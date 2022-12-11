Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local FirstSpawn, PlayerLoaded, loopdead, bloqtecla, estadoherido = true, false, false, false, false
IsDead = false
local deathCoords
ESX = nil

local js_isInJob = false
local js_Job_Name = nil

local IsBusy = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if job ~= nil then
        if job.name == 'ambulance' or job.name == 'medico_ilegal' then
            js_isInJob = true
            js_Job_Name = job.name
        else
            js_isInJob = false
        end
    end
end)

----### FUNCTION ###----

function loadanimdict(dictname)
  if not HasAnimDictLoaded(dictname) then
    RequestAnimDict(dictname) 
    while not HasAnimDictLoaded(dictname) do 
      Citizen.Wait(1)
    end
  end
end

function OnPlayerDeath()
	IsDead = true
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
	StartDeathTimer()
	StartDistressSignal()
	StartScreenEffect('DeathFailOut', 0, false)

end

function StartDistressSignal()
	Citizen.CreateThread(function()
		local timer = Config.BleedoutTimer
		while timer > 0 and IsDead do
			Citizen.Wait(2)
			timer = timer - 30
			SetTextFont(4)
			SetTextScale(0.49, 0.49)
			SetTextColour(185, 185, 185, 255)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			BeginTextCommandDisplayText('STRING')
			AddTextComponentSubstringPlayerName(_U('distress_send'))
			EndTextCommandDisplayText(0.400, 0.770)

			if IsControlPressed(0, Keys['G']) then
				SendDistressSignal()

				Citizen.CreateThread(function()
					Citizen.Wait(1000 * 60 * 5)
					if IsDead then
						StartDistressSignal()
					end
				end)

				break
			end
		end
	end)
end

function SendDistressSignal()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	--ESX.ShowNotification(_U('distress_sent'))
	exports['mythic_notify']:DoCustomHudText('cajaazul', _U('distress_sent'),10000)
	
	
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end

function DrawGenericTextThisFrame()
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format("%02.f", math.floor(seconds / 3600))
		local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end

function StartDeathTimer()
	local canPayFine = false

	if Config.EarlyRespawnFine then
		ESX.TriggerServerCallback('esx_ambulancejob:checkBalance', function(canPay)
			canPayFine = canPay
		end)
	end
	local earlySpawnTimer = ESX.Math.Round(Config.EarlyRespawnTimer / 1000)
	local bleedoutTimer = ESX.Math.Round(Config.BleedoutTimer / 1000)
	Citizen.CreateThread(function()
		-- early respawn timer
		while earlySpawnTimer > 0 and IsDead do
			Citizen.Wait(1000)

			if earlySpawnTimer > 0 then
				earlySpawnTimer = earlySpawnTimer - 1
			end
		end
		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(1000)

			if bleedoutTimer > 0 then
				bleedoutTimer = bleedoutTimer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		local text, timeHeld

		-- early respawn timer
		while earlySpawnTimer > 0 and IsDead do
			Citizen.Wait(0)

			text = _U('respawn_available_in', secondsToClock(earlySpawnTimer))

			DrawGenericTextThisFrame()

			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end

		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(0)
			text = _U('respawn_bleedout_in', secondsToClock(bleedoutTimer))

			if not Config.EarlyRespawnFine then
				text = text .. _U('respawn_bleedout_prompt')

				if IsControlPressed(0, Keys['E']) and timeHeld > 60 then
					RemoveItemsAfterRPDeath()
					TriggerServerEvent("telogeoporquemesaledelapolla")
					break
				end
			elseif Config.EarlyRespawnFine and canPayFine then
				text = text .. _U('respawn_bleedout_fine', ESX.Math.GroupDigits(Config.EarlyRespawnFineAmount))

				if IsControlPressed(0, Keys['E']) and timeHeld > 60 then
					TriggerServerEvent('esx_ambulancejob:payFine')
					RemoveItemsAfterRPDeath()
					break
				end
			end

			if IsControlPressed(0, Keys['E']) then
				timeHeld = timeHeld + 1
			else
				timeHeld = 0
			end

			DrawGenericTextThisFrame()

			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end
			
		if bleedoutTimer < 1 and IsDead then
			RemoveItemsAfterRPDeath()
		end
	end)
end

function RemoveItemsAfterRPDeath()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	loopdead = false
 
	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end

        
		ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			local formattedCoords = {
				x = Config.RespawnPoint.coords.x,
				y = Config.RespawnPoint.coords.y,
				z = Config.RespawnPoint.coords.z
			}

            
			ESX.SetPlayerData('lastPosition', formattedCoords)
			ESX.SetPlayerData('loadout', {})
			SetEntityInvincible(GetPlayerPed(-1),false)
			TriggerServerEvent('esx:updateLastPosition', formattedCoords)
			RespawnPed(PlayerPedId(), formattedCoords, Config.RespawnPoint.heading)
			StopScreenEffect('DeathFailOut')
			DoScreenFadeIn(800)
		end)
	end)
end

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('esx:onPlayerSpawn', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)

	ESX.UI.Menu.CloseAll()
end

-- JOB --
function OpenAmbulanceActionsMenu()
	local elements = {
		{label = _U('cloakroom'), value = 'cloakroom'}
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
	
		end
	end, function(data, menu)
		menu.close()
	end)
end

function entidadvisible()
	SetEntityVisible(GetPlayerPed(-1), false)
	Wait(250)
	SetEntityVisible(GetPlayerPed(-1), true)
end

function  OpenMobileAmbulanceActionsMenu2()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title    = '<b><span style="color: lightsteelblue;">MENU SOCIEDAD</span></b>',
		align    = 'bottom-right',
		elements = {
			{label = '<span style="color: Beige;">Interaccion Cuidadana</span>', value = 'citizen_interaction'},
			{label = '<span style="color: Beige;">Asistencia Medica</span>', value = 'vehicle_interaction'},
			{label = '<span style="color: Beige;">Menu de vehiculos</span>', value = 'incautar_bufas'}

		}
		}, function(data, menu)

		if data.current.value == 'citizen_interaction' then

			local elements = {
				{label = '<span style="color: Beige;">Poner en el Vehiculo</span>', value = 'vehiculo'},
				{label = '<span style="color: Beige;">Sacar del Vehiculo</span>', value = 'vehiculo2'},
				{label = '<span style="color: Beige;">Factura</span>', value = 'factura'}

			}
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = '<b><span style="color: lightsteelblue;">INTERACCION CIUDADANA</span></b>',
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
               	if IsBusy then return end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer ~= -1 and closestDistance <= 2.0 then
					local action = data2.current.value

					if action == 'vehiculo' then

							TriggerServerEvent('esx_sem:putInVehicle', GetPlayerServerId(closestPlayer))

					elseif action == 'vehiculo2' then

							TriggerServerEvent('esx_sem:OutVehicle', GetPlayerServerId(closestPlayer))

					elseif action == 'catearems' then

							TriggerServerEvent('esx_emsrevision:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
	                 		OpenBodySearchMenu(closestPlayer)					
							ESX.UI.Menu.CloseAll() 

					elseif action == 'factura' then 
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
							title = _U('ems_menu')
						}, function(data, menu)
							local amount = tonumber(data.value)

							if amount == nil or amount < 0 then
								exports['mythic_notify']:DoCustomHudText('cajaroja',U('invalid_amount'),7000)				
								--ESX.ShowNotification(_U('invalid_amount'))
							else
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestPlayer == -1 or closestDistance > 3.0 then
								exports['mythic_notify']:DoCustomHudText('cajamostaza',_U('no_players'),7000)					
									--ESX.ShowNotification(_U('no_players'))
								else
									menu.close()
									TriggerServerEvent('esx_bithilling:sendBill', GetPlayerServerId(closestPlayer), 'society_ambulance', _U('ambulance'), amount)
								end
							end
									end, function(data, menu)
										menu.close()
									end)
						
					end
			
				else
				exports['mythic_notify']:DoCustomHudText('cajamostaza', _U('no_players_nearby'),7000)
				end
			end, function(data2, menu2)
				menu2.close()
			end)

		elseif data.current.value == 'incautar_bufas' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()

			if DoesEntityExist(vehicle) then
				table.insert(elements, {label = ('Desbloquear vehículo'), value = 'hijack_vehicle'})
				table.insert(elements, {label = ('Mandar a un lugar mejor el vehículo'), value = 'impound'})
			end

			-- table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = '<b><span style="color: lightsteelblue;">ACCIONES DE VEHICULO</span></b>',
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value


				if DoesEntityExist(vehicle) then
					if action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(('Vehículo desbloqueado'))
						end
					elseif action == 'impound' then
						-- is the script busy?
						if currentTask.busy then
							return
						end

						ESX.ShowHelpNotification(('Estas procediendo a mandar este vehiculo a la otra vida ;D'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									ESX.ShowNotification(('Viaje a la otra vida cancelada por moverte. :('))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(('No hay vehiculos cerca de tí.'))
				end

			end, function(data2, menu2)
				menu2.close()
			end)

		elseif data.current.value == 'vehicle_interaction' then
			local playerPed = PlayerPedId()	
				elements = {
					{label = '<span style="color: Beige;">[RCP] Rapido</span>', value = 'rev1'},
					{label = '<span style="color: Beige;">[RCP] Normal</span>', value = 'rev2'},
					{label = '<span style="color: Beige;">Tratar Heridas Leves</span>', value = 'curar1'},
					{label = '<span style="color: Beige;">Tratar Heridas Graves</span>', value = 'curar2'}
				}
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = '<b><span style="color: lightsteelblue;">ASISTENCIA MEDICA</span></b>',
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer ~= -1 and closestDistance <= 1.0 then
				local action  = data2.current.value
				if action == 'rev1' then
				IsBusy = true

			ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
				local target, distance = ESX.Game.GetClosestPlayer()
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
							--	if IsPedDeadOrDying(closestPlayerPed, 1) then

				                   local target, distance = ESX.Game.GetClosestPlayer()
								   playerheading = GetEntityHeading(GetPlayerPed(-1))
								   playerlocation = GetEntityForwardVector(PlayerPedId())
								   playerCoords = GetEntityCoords(GetPlayerPed(-1))						
								   local target_id = GetPlayerServerId(target)
			                       local searchPlayerPed = GetPlayerPed(target)
								   local closestPlayerPed = GetPlayerPed(closestPlayer)
                      			   local health = GetEntityHealth(closestPlayerPed)

                  				 if health > 0 or IsEntityDead(searchPlayerPed)  then

									   local playerPed = PlayerPedId()
									   menu2.close()

				             ClampGameplayCamPitch(0.0, -90.0)
					         TriggerServerEvent("anim:revivirfastsv",target_id, playerheading, playerCoords, playerlocation)
							 exports['progressBars']:startUI(15000, "Reanimando...")

                                                                        Citizen.Wait(15000)
									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:rethivive', GetPlayerServerId(closestPlayer))
									-- Show revive award?
                           if Config.ReviveReward > 0 then
						   exports['mythic_notify']:DoCustomHudText('success',_U('revive_complete_award', GetPlayerName(closestPlayer), Config.ReviveReward),4500)
							--ESX.ShowNotification(_U('revive_complete_award', GetPlayerName(closestPlayer), Config.ReviveReward))
									else									
							 exports['mythic_notify']:DoCustomHudText('success',_U('revive_complete', GetPlayerName(closestPlayer)),5500)				
							--ESX.ShowNotification(_U('revive_complete', GetPlayerName(closestPlayer)))
									end															
								else
								exports['mythic_notify']:DoCustomHudText('nohayjugadorescerca', ' El Sujeto no esta en estado critico. ',2500)
									--ESX.ShowNotification(_U('player_not_unconscious'))
								end						
							else
							 exports['mythic_notify']:DoCustomHudText('error', _U('not_enough_medikit') ,3000)	
								--ESX.ShowNotification(_U('not_enough_medikit'))
				     		end
							IsBusy = false
						end, 'medikit')
				elseif action == 'rev2' then

			ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
				local target, distance = ESX.Game.GetClosestPlayer()

				if quantity > 0 then
							local closestPlayerPed = GetPlayerPed(closestPlayer)
							--	if IsPedDeadOrDying(closestPlayerPed, 1) then
				                   local target, distance = ESX.Game.GetClosestPlayer()
								   playerheading = GetEntityHeading(GetPlayerPed(-1))
								   playerlocation = GetEntityForwardVector(PlayerPedId())
								   playerCoords = GetEntityCoords(GetPlayerPed(-1))						
								   local target_id = GetPlayerServerId(target)
			                       local searchPlayerPed = GetPlayerPed(target)
								   local closestPlayerPed = GetPlayerPed(closestPlayer)
                      			   local health = GetEntityHealth(closestPlayerPed)


					if health > 0 or IsEntityDead(searchPlayerPed)  then
						menu2.close()

					    TriggerServerEvent('ems:nuevobb',target_id, playerheading, playerCoords, playerlocation)
						exports['progressBars']:startUI(60000, "Reanimando...")

                        Citizen.Wait(60000)
									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:rethivive', GetPlayerServerId(closestPlayer))
                           if Config.ReviveReward > 0 then							   
						   exports['mythic_notify']:DoCustomHudText('success',_U('revive_complete_award', GetPlayerName(closestPlayer), Config.ReviveReward),4500)
									else								
							 exports['mythic_notify']:DoCustomHudText('success',_U('revive_complete', GetPlayerName(closestPlayer)),5500)
									end
																
								else
								exports['mythic_notify']:DoCustomHudText('nohayjugadorescerca', ' El Sujeto no esta en estado critico. ',2500)
								end						
							else
							 exports['mythic_notify']:DoCustomHudText('error', _U('not_enough_medikit') ,3000)	
							end

							IsBusy = false


						end, 'medikit')		
				elseif action == 'curar1' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)
								if health > 0 then
									local playerPed = PlayerPedId()
									IsBusy = true
										exports['mythic_notify']:DoCustomHudText('cajaverde',_U('heal_inprogress'),8000)							
									--ESX.ShowNotification(_U('heal_inprogress'))								
								TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
								 exports['progressBars']:startUI(5000, "Aplicando Vendajes")
									Citizen.Wait(5000)
									ClearPedTasks(playerPed)
									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')															
			 						exports['mythic_notify']:DoCustomHudText('cajaverde',_U('heal_complete', GetPlayerName(closestPlayer)),5500)						
									--ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									IsBusy = false

								else
								 exports['mythic_notify']:DoCustomHudText('cajamostaza',_U('player_not_conscious'),7000)					
								--ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								exports['mythic_notify']:DoCustomHudText('cajaroja',_U('not_enough_bandage'),7000)
								--ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')
				elseif action == 'curar2' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									IsBusy = true					
							exports['mythic_notify']:DoCustomHudText('cajaverde',_U('heal_inprogresse'),8000)
								
									--ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									 exports['progressBars']:startUI(7000, "Aplicando medkits")
									Citizen.Wait(7000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
								          exports['mythic_notify']:DoCustomHudText('cajaverde',_U('heal_complete', GetPlayerName(closestPlayer)),8000)								
									--ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									IsBusy = false
								else
							exports['mythic_notify']:DoCustomHudText('cajamostaza',_U('player_not_conscious'),8000)
									--ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
							exports['mythic_notify']:DoCustomHudText('cajaroja',_U('not_enough_medikit'),8000)
								--ESX.ShowNotification(_U('not_enough_medikit'))
							end
						end, 'medikit')

				end

						else
							exports['mythic_notify']:DoCustomHudText('cajamostaza', _U('no_players_nearby'),7000)
						end
			end, function(data2, menu2)
				menu2.close()
			end)
			
		end
	end, function(data, menu)
		menu.close()
	end)
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()
	DoScreenFadeOut(800)
	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end
	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)
		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

function SetVehicleMaxMods(vehicle)

	local props = {
		modEngine       = 2,
		modBrakes       = 2,
		modTransmission = 2,
		modTurbo        = true,
	}

	ESX.Game.SetVehicleProperties(vehicle, props)

end

function DrawText3Ds(coords, text, scale)
	local x,y,z = coords.x, coords.y, coords.z
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / 400
	DrawRect(_x, _y + 0.0115, 0.035 + factor, 0.035, 41, 11, 41, 100)
end

function OpenVehicleSpawnerMenu(hospital, tipo)
	local hospital = "CentralLosSantos"
	
    local vehicles = Config.Hospitals[hospital][tipo].Opciones

    ESX.UI.Menu.CloseAll()

    local elements = {}
	local string = "Authorized"..tipo..""
    for i=1, #Config[string], 1 do
	local vehicle = Config[string][i]
      table.insert(elements, {label = vehicle.label, value = vehicle.name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vehicle_spawner',
      {
		title    = '<b><span style="color: lightsteelblue;">MENU VEHICULOS</span></b>',
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        local model = data.current.value

        local vehicle = GetClosestVehicle(vehicles.SpawnPoint.x,  vehicles.SpawnPoint.y,  vehicles.SpawnPoint.z,  3.0,  0,  71)

        if not DoesEntityExist(vehicle) then

          local playerPed = PlayerPedId()


            ESX.Game.SpawnVehicle(model, {
              x = vehicles.SpawnPoint.x,
              y = vehicles.SpawnPoint.y,
              z = vehicles.SpawnPoint.z
            }, vehicles.Heading, function(vehicle)
              SetVehicleMaxMods(vehicle)
              SetVehicleDirtLevel(vehicle, 0)
			  SetPedIntoVehicle(playerPed,vehicle,-1)

            end)

         

        else
          ESX.ShowNotification("Has sacado el vehiculo")
        end

      end,

      function(data, menu)
        menu.close()
      end
    )
end

function OpenCloakroomMenu()

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'cloakroom',
	  {
		title    = _U('cloakroom'),
		align    = 'bottom-right',
		elements = {
		  {label = _U('ems_clothes_civil'), value = 'citizen_wear'},
		  {label = 'Armario de ropa personal' , value = 'player_dressing'},
		  {label = 'Uniforme desnudo [M]', value = 'desnudo'},
		  {label = '-= Uniformidades básicas =-'},
		  {label = 'Uniforme básico [M]', value = 'base'},
		  {label = 'Pantalón 1 [M]', value = 'pantalon1'},
		  {label = 'Pantalón 2 [M]', value = 'pantalon2'},
		  {label = '-= Chalecos =-'},
		  {label = 'Chaleco enfermero', value = 'chaleco_enfermero'},
		  {label = 'Chaleco técnico', value = 'chaleco_tecnico'},
		  {label = 'Chaleco medico', value = 'chaleco_medico'},
		  {label = 'Chaleco doctor', value = 'chaleco_doctor'},
		  {label = 'Chaleco jefatura', value = 'chaleco_jefatura'},
		  {label = '-= Variaciones =-'},
		  {label = '-= Uniformes de protocolo =-'},
		  {label = 'Riesgo de biológico', value = 'bio'},
		  {label = 'Poner mascara', value = 'biomask'},
		  {label = '-= Añadir accesorios =-'},
		  {label = 'Añadir guantes [M]' , value = 'conguantes'},
		  {label = 'Añadir estetoscopio [M]' , value = 'conestetoscopio'},
		  {label = '-= Quitar accesorios =-'},
		  {label = 'Quitar guantes [M]' , value = 'singuantes'},
		  {label = 'Quitar estetoscopio [M]' , value = 'sinestetoscopio'},
		  {label = 'Quitar chaleco' , value = 'sinchaleco'},
  
		},
	  },
	  function(data, menu)
  
		menu.close()
  
		if data.current.value == 'citizen_wear' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			local model = nil
  
			if skin.sex == 0 then
			  model = GetHashKey("mp_m_freemode_01")
			else
			  model = GetHashKey("mp_f_freemode_01")
			end
  
			RequestModel(model)
			while not HasModelLoaded(model) do
			  RequestModel(model)
			  Citizen.Wait(1)
			end
  
			SetPlayerModel(PlayerId(), model)
			SetModelAsNoLongerNeeded(model)
  
			TriggerEvent('skinchanger:loadSkin', skin)
			TriggerEvent('esx:restoreLoadout')
		  end)
		end

		if data.current.value == 'player_dressing' then
			ESX.TriggerServerCallback('esx_ambulancejob:getPlayerDressing', function(dressing)
				local elements = {}
	  
				for i=1, #dressing, 1 do
				  table.insert(elements, {label = dressing[i], value = i})
				end
	  
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = ('Ropa Personal'),
					align    = 'top-left',
					elements = elements,
				  }, function(data, menu)
	  
					TriggerEvent('skinchanger:getSkin', function(skin)
	  
					  ESX.TriggerServerCallback('esx_ambulancejob:getPlayerOutfit', function(clothes)
	  
						TriggerEvent('skinchanger:loadClothes', skin, clothes)
						TriggerEvent('esx_skin:setLastSkin', skin)
	  
						TriggerEvent('skinchanger:getSkin', function(skin)
						  TriggerServerEvent('esx_skin:save', skin)
						end)
						
						ESX.ShowNotification(('¡Ropa personal puesta!'))
						HasLoadCloth = true
					  end, data.current.value)
					end)
				  end, function(data, menu)
					menu.close()
				  end
				)
			  end)
		end
  
  
		if data.current.value == 'skin' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[data.current.id].male)
			else
			  TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[data.current.id].female)
			end
  
		  end)
  
		end
  
		if data.current.value == 'desnudo' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'tshirt_1', 57)
			  TriggerEvent('skinchanger:change', 'tshirt_2', 0)
			  TriggerEvent('skinchanger:change', 'torso_1', 91)
			  TriggerEvent('skinchanger:change', 'torso_2', 0)
			  TriggerEvent('skinchanger:change', 'arms', 15)
			  TriggerEvent('skinchanger:change', 'pants_1', 61)
			  TriggerEvent('skinchanger:change', 'pants_2', 3)
			  TriggerEvent('skinchanger:change', 'shoes_1', 34)
			  TriggerEvent('skinchanger:change', 'shoes_2', 0)
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			  TriggerEvent('skinchanger:change', 'chain_2', 0)
			  TriggerEvent('skinchanger:change', 'helmet_1', -1)
			  TriggerEvent('skinchanger:change', 'helmet_2', 0)
			  TriggerEvent('skinchanger:change', 'mask_1', 0)
			  TriggerEvent('skinchanger:change', 'mask_2', 0)
			  TriggerEvent('skinchanger:change', 'bags_1', 0)
			  TriggerEvent('skinchanger:change', 'bags_2', 0)
			  TriggerEvent('skinchanger:change', 'glasses_1', 0)
			  TriggerEvent('skinchanger:change', 'glasses_2', 0)
			  TriggerEvent('skinchanger:change', 'bproof_1', 0)
			  TriggerEvent('skinchanger:change', 'bproof_2', 0)
			else
			  TriggerEvent('skinchanger:change', 'tshirt_1', 34)
			  TriggerEvent('skinchanger:change', 'tshirt_2', 0)
			  TriggerEvent('skinchanger:change', 'torso_1', 18)
			  TriggerEvent('skinchanger:change', 'torso_2', 3)
			  TriggerEvent('skinchanger:change', 'arms', 15)
			  TriggerEvent('skinchanger:change', 'pants_1', 17)
			  TriggerEvent('skinchanger:change', 'pants_2', 3)
			  TriggerEvent('skinchanger:change', 'shoes_1', 35)
			  TriggerEvent('skinchanger:change', 'shoes_2', 0)
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			  TriggerEvent('skinchanger:change', 'chain_2', 0)
			  TriggerEvent('skinchanger:change', 'helmet_1', -1)
			  TriggerEvent('skinchanger:change', 'helmet_2', 0)
			  TriggerEvent('skinchanger:change', 'mask_1', 0)
			  TriggerEvent('skinchanger:change', 'mask_2', 0)
			  TriggerEvent('skinchanger:change', 'bags_1', 0)
			  TriggerEvent('skinchanger:change', 'bags_2', 0)
			  TriggerEvent('skinchanger:change', 'glasses_1', 5)
			  TriggerEvent('skinchanger:change', 'glasses_2', 0)
			  TriggerEvent('skinchanger:change', 'bproof_1', 0)
			  TriggerEvent('skinchanger:change', 'bproof_2', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'bio' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'tshirt_1', 61)
			  TriggerEvent('skinchanger:change', 'tshirt_2', 2)
			  TriggerEvent('skinchanger:change', 'torso_1', 67)
			  TriggerEvent('skinchanger:change', 'torso_2', 2)
			  TriggerEvent('skinchanger:change', 'arms', 86)
			  TriggerEvent('skinchanger:change', 'pants_1', 40)
			  TriggerEvent('skinchanger:change', 'pants_2', 2)
			  TriggerEvent('skinchanger:change', 'shoes_1', 24)
			  TriggerEvent('skinchanger:change', 'shoes_2', 0)
			else
			  TriggerEvent('skinchanger:change', 'tshirt_1', 26)
			end
  
		  end)
		end
  
		if data.current.value == 'biomask' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'tshirt_1', 62)
			  TriggerEvent('skinchanger:change', 'tshirt_2', 2)
			  TriggerEvent('skinchanger:change', 'mask_1', 46)
			  TriggerEvent('skinchanger:change', 'mask_2', 0)
			else
			  TriggerEvent('skinchanger:change', 'tshirt_1', 26)
			end
  
		  end)
		end
  
		if data.current.value == 'base' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'tshirt_1', 15)
			  TriggerEvent('skinchanger:change', 'tshirt_2', 0)
			  TriggerEvent('skinchanger:change', 'torso_1', 412)
			  TriggerEvent('skinchanger:change', 'torso_2', 0)
			  TriggerEvent('skinchanger:change', 'pants_1', 97)
			  TriggerEvent('skinchanger:change', 'pants_2', 22)
			  TriggerEvent('skinchanger:change', 'shoes_1', 25)
			  TriggerEvent('skinchanger:change', 'shoes_2', 0)
			  TriggerEvent('skinchanger:change', 'arms', 82)
			else
			  TriggerEvent('skinchanger:change', 'tshirt_1', 7)
			  TriggerEvent('skinchanger:change', 'tshirt_2', 1)
			  TriggerEvent('skinchanger:change', 'torso_1', 416)
			  TriggerEvent('skinchanger:change', 'torso_2', 1)
			  TriggerEvent('skinchanger:change', 'pants_1', 100)
			  TriggerEvent('skinchanger:change', 'pants_2', 22)
			  TriggerEvent('skinchanger:change', 'shoes_1', 25)
			  TriggerEvent('skinchanger:change', 'shoes_2', 0)
			  TriggerEvent('skinchanger:change', 'arms', 109)
  
			end
  
		  end)
		end
  
		if data.current.value == 'pantalon1' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'pants_1', 84)
			  TriggerEvent('skinchanger:change', 'pants_2', 1)
			else
			  TriggerEvent('skinchanger:change', 'pants_1', 51)
			  TriggerEvent('skinchanger:change', 'pants_2', 1)
			end
  
		  end)
		end
  
		if data.current.value == 'pantalon2' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'pants_1', 84)
			  TriggerEvent('skinchanger:change', 'pants_2', 2)
			else
			  TriggerEvent('skinchanger:change', 'pants_1', 51)
			  TriggerEvent('skinchanger:change', 'pants_2', 2)
			end
  
		  end)
		end
  
		if data.current.value == 'conguantes' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'arms', 85)
			else
			  TriggerEvent('skinchanger:change', 'arms', 109)
			end
  
		  end)
		end
  
		if data.current.value == 'singuantes' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'arms', 0)
			else
			  TriggerEvent('skinchanger:change', 'arms', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'conestetoscopio' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'chain_1', 126)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 96)
			end
  
		  end)
		end
  
		if data.current.value == 'sinestetoscopio' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'sinchaleco' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'bproof_1', 0)
			else
			  TriggerEvent('skinchanger:change', 'bproof_1', 0)
			end
  
		  end)
		end
		
		if data.current.value == 'chaleco_enfermero' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'bproof_1', 20)
			  TriggerEvent('skinchanger:change', 'bproof_2', 0)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'chaleco_tecnico' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'bproof_1', 20)
			  TriggerEvent('skinchanger:change', 'bproof_2', 1)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'chaleco_medico' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'bproof_1', 20)
			  TriggerEvent('skinchanger:change', 'bproof_2', 2)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'chaleco_forense' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'bproof_1', 20)
			  TriggerEvent('skinchanger:change', 'bproof_2', 3)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'chaleco_doctor' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'bproof_1', 20)
			  TriggerEvent('skinchanger:change', 'bproof_2', 4)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			end
  
		  end)
		end
  
		if data.current.value == 'chaleco_jefatura' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:change', 'bproof_1', 20)
			  TriggerEvent('skinchanger:change', 'bproof_2', 5)
			else
			  TriggerEvent('skinchanger:change', 'chain_1', 0)
			end
  
		  end)
		end

	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
end

function DeleteSpawnedVehicles()
	while #spawnedVehicles > 0 do
		local vehicle = spawnedVehicles[1]
		ESX.Game.DeleteVehicle(vehicle)
		table.remove(spawnedVehicles, 1)
	end
end

function WaitForVehicleToLoad(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))
	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)
		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)

			DisableControlAction(0, Keys['TOP'], true)
			DisableControlAction(0, Keys['DOWN'], true)
			DisableControlAction(0, Keys['LEFT'], true)
			DisableControlAction(0, Keys['RIGHT'], true)
			DisableControlAction(0, 176, true) -- ENTER key
			DisableControlAction(0, Keys['BACKSPACE'], true)
			drawLoadingText(_U('vehicleshop_awaiting_model'), 255, 255, 255, 255)

		end
	end
end

function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = _U('pharmacy_menu_title'),
		align    = 'bottom-right',
		elements = {
			{label = _U('pharmacy_take', _U('medikit')), value = 'medikit'},
			{label = _U('pharmacy_take', _U('bandage')), value = 'bandage'},
			{label = _U('pharmacy_take', _U('bread')), value = 'bread'},
			{label = _U('pharmacy_take', _U('water')), value = 'water'},
			-- {label = ('Depositar Cosas de Servicio'), value = 'borrar'},
			
		}
	}, function(data, menu)
		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.value)
		
	
	end, function(data, menu)
		menu.close()
	end)
end

function WarpPedInClosestVehicle(ped)
	local coords = GetEntityCoords(ped)

	local vehicle, distance = ESX.Game.GetClosestVehicle(coords)

	if distance ~= -1 and distance <= 5.0 then
		local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

		for i=maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end
		if freeSeat then
			TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
		end
	else
		exports['mythic_notify']:DoCustomHudText('cajamostaza', _U('no_vehicles'),7500)
		--ESX.ShowNotification(_U('no_vehicles'))
	end
end

-------animacion cpr----------
function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName,8.0, -8.0, -1, 0, 0, false, false, false)
	RemoveAnimDict(animDict)
end

function LoadAnimationDictionary(animationD)
	while(not HasAnimDictLoaded(animationD)) do
		RequestAnimDict(animationD)
		Citizen.Wait(1)
	end
end

function ImpoundVehicle(vehicle)
	ESX.Game.DeleteVehicle(vehicle)
	ESX.ShowNotification(('Vehículo mandado a una mejor vida satisfactoriamente.'))
	currentTask.busy = false
end

----### ORIGINAL ###----

AddEventHandler('esx:onPlayerSpawn', function()
	IsDead = false
	if FirstSpawn then
		FirstSpawn = false
		ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(isDead)
			if isDead and Config.AntiCombatLog then
				while not PlayerLoaded do
					Citizen.Wait(1000)
				end
				exports['mythic_notify']:DoCustomHudText('cajaroja', _U('combatlog_message'),7000)
				--ESX.ShowNotification(_U('combatlog_message'))
				RemoveItemsAfterRPDeath()
			end
		end)
	end
end)

RegisterNetEvent('animrevive:loopfalse')
AddEventHandler('animrevive:loopfalse', function()
	loopdead = false
end)

-- Items con uso
RegisterNetEvent('esx_ambulancejob:useItem')
AddEventHandler('esx_ambulancejob:useItem', function(itemName)
	ESX.UI.Menu.CloseAll()

	-- if itemName == 'medikit' then
	
	-- 		local lib, anim = 'missheistdockssetup1clipboard@idle_a', 'idle_a' -- TODO better animations
	--      	local playerPed = PlayerPedId()
 	-- 	exports['progressBars']:startUI(6000, "Aplicando medkits")

	-- 	ESX.Streaming.RequestAnimDict(lib, function()
	-- 		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	-- 		Citizen.Wait(500)
	-- 		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
	-- 			Citizen.Wait(0)
	-- 			DisableAllControlActions(0)
	-- 		end
	-- 		TriggerEvent('esx_ambulancejob:heal', 'big', true)	
	-- 		exports['mythic_notify']:DoCustomHudText('cajanegra', _U('used_medikit'),7000)				
	-- 		--ESX.ShowNotification(_U('used_medikit'))
	-- 	end)
 
	if itemName == 'bandage' then

		local lib, anim = 'anim@mp_player_intincardancestd@rps@', 'idle_a' -- TODO better animations
		local playerPed = PlayerPedId()

		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, 7000, 0, 0, false, false, false)
			Citizen.Wait(500)
			while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				Citizen.Wait(0)
				DisableAllControlActions(0)
			end
			TriggerEvent('esx_ambulancejob:heal', 'small', true)	
			exports['mythic_notify']:DoCustomHudText('cajanegra', _U('used_bandage'),7000)
		end)	

	elseif itemName == 'pildora' then
	 
	 	exports['progressBars']:startUI(1500, "Tomando pildoras")
		local lib, anim = 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp' -- TODO better animations
		local playerPed = PlayerPedId()
		ESX.Streaming.RequestAnimDict(lib, function()
			AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
			TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
			Citizen.Wait(500)
			while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				Citizen.Wait(0)
				ClearPedTasksImmediately(ped)
				AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
			end
			TriggerEvent('esx_ambulancejob:heal', 'verysmall', true)
			exports['mythic_notify']:DoCustomHudText('cajanegra', _U('used_pildora'),7000)
			--ESX.ShowNotification(_U('used_pildora'))
		end)
	end
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'Ambulance',
		number     = 'ambulance',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAABp5JREFUWIW1l21sFNcVhp/58npn195de23Ha4Mh2EASSvk0CPVHmmCEI0RCTQMBKVVooxYoalBVCVokICWFVFVEFeKoUdNECkZQIlAoFGMhIkrBQGxHwhAcChjbeLcsYHvNfsx+zNz+MBDWNrYhzSvdP+e+c973XM2cc0dihFi9Yo6vSzN/63dqcwPZcnEwS9PDmYoE4IxZIj+ciBb2mteLwlZdfji+dXtNU2AkeaXhCGteLZ/X/IS64/RoR5mh9tFVAaMiAldKQUGiRzFp1wXJPj/YkxblbfFLT/tjq9/f1XD0sQyse2li7pdP5tYeLXXMMGUojAiWKeOodE1gqpmNfN2PFeoF00T2uLGKfZzTwhzqbaEmeYWAQ0K1oKIlfPb7t+7M37aruXvEBlYvnV7xz2ec/2jNs9kKooKNjlksiXhJfLqf1PXOIU9M8fmw/XgRu523eTNyhhu6xLjbSeOFC6EX3t3V9PmwBla9Vv7K7u85d3bpqlwVcvHn7B8iVX+IFQoNKdwfstuFtWoFvwp9zj5XL7nRlPXyudjS9z+u35tmuH/lu6dl7+vSVXmDUcpbX+skP65BxOOPJA4gjDicOM2PciejeTwcsYek1hyl6me5nhNnmwPXBhjYuGC699OpzoaAO0PbYJSy5vgt4idOPrJwf6QuX2FO0oOtqIgj9pDU5dCWrMlyvXf86xsGgHyPeLos83Brns1WFXLxxgVBorHpW4vfQ6KhkbUtCot6srns1TLPjNVr7+1J0PepVc92H/Eagkb7IsTWd4ZMaN+yCXv5zLRY9GQ9xuYtQz4nfreWGdH9dNlkfnGq5/kdO88ekwGan1B3mDJsdMxCqv5w2Iq0khLs48vSllrsG/Y5pfojNugzScnQXKBVA8hrX51ddHq0o6wwIlgS8Y7obZdUZVjOYLC6e3glWkBBVHC2RJ+w/qezCuT/2sV6Q5VYpowjvnf/iBJJqvpYBgBS+w6wVB5DLEOiTZHWy36nNheg0jUBs3PoJnMfyuOdAECqrZ3K7KcACGQp89RAtlysCphqZhPtRzYlcPx+ExklJUiq0le5omCfOGFAYn3qFKS/fZAWS7a3Y2wa+GJOEy4US+B3aaPUYJamj4oI5LA/jWQBt5HIK5+JfXzZsJVpXi/ac8+mxWIXWzAG4Wb4g/jscNMp63I4U5FcKaVvsNyFALokSA47Kx8PVk83OabCHZsiqwAKEpjmfUJIkoh/R+L9oTpjluhRkGSPG4A7EkS+Y3HZk0OXYpIVNy01P5yItnptDsvtIwr0SunqoVP1GG1taTHn1CloXm9aLBEIEDl/IS2W6rg+qIFEYR7+OJTesqJqYa95/VKBNOHLjDBZ8sDS2998a0Bs/F//gvu5Z9NivadOc/U3676pEsizBIN1jCYlhClL+ELJDrkobNUBfBZqQfMN305HAgnIeYi4OnYMh7q/AsAXSdXK+eH41sykxd+TV/AsXvR/MeARAttD9pSqF9nDNfSEoDQsb5O31zQFprcaV244JPY7bqG6Xd9K3C3ALgbfk3NzqNE6CdplZrVFL27eWR+UASb6479ULfhD5AzOlSuGFTE6OohebElbcb8fhxA4xEPUgdTK19hiNKCZgknB+Ep44E44d82cxqPPOKctCGXzTmsBXbV1j1S5XQhyHq6NvnABPylu46A7QmVLpP7w9pNz4IEb0YyOrnmjb8bjB129fDBRkDVj2ojFbYBnCHHb7HL+OC7KQXeEsmAiNrnTqLy3d3+s/bvlVmxpgffM1fyM5cfsPZLuK+YHnvHELl8eUlwV4BXim0r6QV+4gD9Nlnjbfg1vJGktbI5UbN/TcGmAAYDG84Gry/MLLl/zKouO2Xukq/YkCyuWYV5owTIGjhVFCPL6J7kLOTcH89ereF1r4qOsm3gjSevl85El1Z98cfhB3qBN9+dLp1fUTco+0OrVMnNjFuv0chYbBYT2HcBoa+8TALyWQOt/ImPHoFS9SI3WyRajgdt2mbJgIlbREplfveuLf/XXemjXX7v46ZxzPlfd8YlZ01My5MUEVdIY5rueYopw4fQHkbv7/rZkTw6JwjyalBCHur9iD9cI2mU0UzD3P9H6yZ1G5dt7Gwe96w07dl5fXj7vYqH2XsNovdTI6KMrlsAXhRyz7/C7FBO/DubdVq4nBLPaohcnBeMr3/2k4fhQ+Uc8995YPq2wMzNjww2X+vwNt1p00ynrd2yKDJAVN628sBX1hZIdxXdStU9G5W2bd9YHR5L3f/CNmJeY9G8WAAAAAElFTkSuQmCC'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	OnPlayerDeath()
end)

RegisterNetEvent('esx_ambulancejob:rethivive')
AddEventHandler('esx_ambulancejob:rethivive', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	loopdead = false
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(50)
		end
		local formattedCoords = {
			x = ESX.Math.Round(coords.x, 1),
			y = ESX.Math.Round(coords.y, 1),
			z = ESX.Math.Round(coords.z, 1)
		}

		ESX.SetPlayerData('lastPosition', formattedCoords)
		TriggerServerEvent('esx:updateLastPosition', formattedCoords)	
		ClearPedSecondaryTask(PlayerPedId())
		RespawnPed(playerPed, formattedCoords, 0.0)
		ClearPedSecondaryTask(playerPed)
        SetEntityInvincible(GetPlayerPed(-1),false)
		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(800)
	end)
end)

RegisterNetEvent('anim:revivirfast')
AddEventHandler('anim:revivirfast', function(playerheading, playercoords, playerlocation)
	local deathCoords			 
	local coords = GetEntityCoords(playerPed)
	local playerPed = GetPlayerPed(-1)
	local test1, test2 = ESX.Game.GetClosestPlayer()
	local test1_id = GetPlayerServerId(target)

    bloqtecla = true
    ClampGameplayCamPitch(0.0, -90.0)
    SetEntityVisible(playerPed, false)
	loadanimdict('mini@cpr@char_b@cpr_str')
	TriggerEvent('animrevive:loopfalse')
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false) 
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	SetEntityInvincible(playerPed, false)
	StopScreenEffect('DeathFailOut')

	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(test1_id, x, y, z-0.50)
	SetEntityHeading(GetPlayerPed(-1), playerheading - 270.0) 

   	Citizen.Wait(1500)
    SetEntityCoords(test1_id, x, y, z-0.50)
   	SetEntityVisible(playerPed, true)

	for i=1, 15, 1 do
		Citizen.Wait(900)
		TaskPlayAnim(playerPed, 'mini@cpr@char_b@cpr_str', 'cpr_pumpchest', 8.0, 8.0, -1, 0, 0, false, false, false)
	end	
    bloqtecla = false

end)

RegisterNetEvent('anim:medicorevivirfast')
AddEventHandler('anim:medicorevivirfast', function(playerheading, playercoords, playerlocation)
	bloqtecla = true
	local playerPed = GetPlayerPed(-1)

	loadanimdict('mini@cpr@char_a@cpr_str')
	Citizen.Wait(1500)
	ClampGameplayCamPitch(0.0, -90.0)

	for i=1, 15, 1 do
		Citizen.Wait(900)
		TaskPlayAnim(playerPed, 'mini@cpr@char_a@cpr_str','cpr_pumpchest', 8.0, 8.0, -1, 0, 0, false, false, false)
	end

    bloqtecla = false
end) 

---NUEVA ANIMACION REVIVIR ---
RegisterNetEvent('anim:herido')
AddEventHandler('anim:herido', function(playerheading, playercoords, playerlocation)
	bloqtecla = true

    local coords = GetEntityCoords(playerPed)
	playerPed = GetPlayerPed(-1)
    loadanimdict('mini@cpr@char_b@cpr_str')
    loadanimdict('mini@cpr@char_b@cpr_def')
	entidadvisible()
	TriggerEvent('animrevive:loopfalse')
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false) 
	SetEntityInvincible(playerPed, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	StopScreenEffect('DeathFailOut')
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z-0.50)
	SetEntityHeading(GetPlayerPed(-1), playerheading - 270.0) 

   	TaskPlayAnim(playerPed, 'mini@cpr@char_b@cpr_def',  'cpr_intro', 8.0, 8.0, -1, 0, 0, false, false, false)
   	Citizen.Wait(15800 - 900)

	for i=1, 15, 1 do
	    Citizen.Wait(900)
	    TaskPlayAnim(playerPed, 'mini@cpr@char_b@cpr_str', 'cpr_pumpchest', 8.0, 8.0, -1, 0, 0, false, false, false)
	end	

    TaskPlayAnim(playerPed, 'mini@cpr@char_b@cpr_str', 'cpr_success', 8.0, 8.0, 30590, 0, 0, false, false, false)	
    Citizen.Wait(30590)

    bloqtecla = false
end) 

RegisterNetEvent('anim:medico')
AddEventHandler('anim:medico', function()
	bloqtecla = true
    playerPed = GetPlayerPed(-1)
	loadanimdict('mini@cpr@char_a@cpr_def')
	loadanimdict('mini@cpr@char_a@cpr_str')
    TaskPlayAnim(playerPed, 'mini@cpr@char_a@cpr_def', 'cpr_intro', 8.0, 8.0, -1, 0, 0, false, false, false)                      	
    Citizen.Wait(15800 - 900)

	for i=1, 15, 1 do
		Citizen.Wait(900)
			TaskPlayAnim(playerPed, 'mini@cpr@char_a@cpr_str','cpr_pumpchest', 8.0, 8.0, -1, 0, 0, false, false, false)
	end

	TaskPlayAnim(playerPed,'mini@cpr@char_a@cpr_str', 'cpr_success', 8.0, 8.0, 30590, 0, 0, false, false, false)
    Citizen.Wait(33590 - 3000)

    bloqtecla = false
end) 

---  LEVANTAR HERIDO       ---
RegisterNetEvent('commando:levantarherido')
AddEventHandler('commando:levantarherido', function()
  	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer == -1 or closestDistance > 1.1 then
		exports['mythic_notify']:DoCustomHudText('nohayjugadorescerca', 'no_players',3500)
	else	
        local dict,base = "anim@heists@box_carry@","idle"
		loadanimdict(dict)
		TriggerServerEvent('esx_cargarherido:levantar', GetPlayerServerId(closestPlayer))
        TriggerServerEvent("cargarherido:mensaje", GetPlayerServerId(closestPlayer))
		TaskPlayAnim(GetPlayerPed(-1), dict,"idle", 8.0, 8.0, -1, 50, 0, false, false, false)
	end
end)

RegisterNetEvent('esx_cargarherido:anim')
AddEventHandler('esx_cargarherido:anim', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	local lPed = GetPlayerPed(-1)	

	if isCarry == false then
		estadoherido = true
		LoadAnimationDictionary("amb@code_human_in_car_idles@generic@ps@base")
  	    
        Citizen.CreateThread(function()
		    while estadoherido do
		    Citizen.Wait(0)
		    TaskPlayAnim(lPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 8.0, -8, -1, 33, 0, 0, 40, 0)
		    end
	    end)

		AttachEntityToEntity(GetPlayerPed(-1), targetPed, 9816, 0.015, 0.38, 0.11, 0.9, 0.30, 90.0, false, false, false, false, 2, false)
	    Citizen.CreateThread(function()
            while estadoherido do
                Citizen.Wait(0)
                if not IsEntityPlayingAnim(GetPlayerPed(-1),"amb@code_human_in_car_idles@generic@ps@base", "base", 3) then
                    TaskPlayAnim(GetPlayerPed(-1),"amb@code_human_in_car_idles@generic@ps@base", "base", 1.0, -1, -1, 10, 0, 0, 0, 0)
                end
            end
        end)

		isCarry = true
	else
	    DetachEntity(GetPlayerPed(-1), true, false)
	    estadoherido = false
	    ClearPedTasks(GetPlayerPed(-1))
        ClearPedSecondaryTask(GetPlayerPed(-1))
        ClearPedTasksImmediately(GetPlayerPed(-1))
        ClearPedTasksImmediately(targetPed)
		isCarry = false
	    Citizen.Wait(250)			
	    TriggerEvent("random:animacion")
	end

end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
			end
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)

	elseif healType == 'verysmall' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 16))
		SetEntityHealth(playerPed, newHealth)
	end
	if not quiet then
	exports['mythic_notify']:DoCustomHudText('cajaverde', _U('healed'),7500)
		--ESX.ShowNotification(_U('healed'))
	end
end)

RegisterNetEvent('esx_sem:putInVehicle')
AddEventHandler('esx_sem:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	--if not IsHandcuffed then
		--return
	--end
	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('esx_sem:OutVehicle')
AddEventHandler('esx_sem:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
	return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

RegisterNetEvent('anim:animloop')
AddEventHandler('anim:animloop', function()
       if not IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arresting", "idle", 3) then
            ClearPedTasksImmediately(GetPlayerPed(-1))
       end
end)

RegisterNetEvent('random:animacion')
AddEventHandler('random:animacion', function()

  local ped = PlayerPedId()
  local animacionrandom  = math.random(1,50)
  local playerPed  = GetPlayerPed(-1)

	  loadanimdict('combat@damage@writhe')
	  loadanimdict('combat@damage@writheidle_a')
	  loadanimdict('combat@damage@writheidle_b')
	  loadanimdict('combat@damage@writheidle_c')
	  loadanimdict('combat@damage@rb_writhe')

  local lib1,anim1 ='combat@damage@writhe','writhe_loop'           --2500
  local lib2,anim2 ='combat@damage@writheidle_a','writhe_idle_a'   --13000
  local lib3,anim3 ='combat@damage@writheidle_b','writhe_idle_e'   --11166
  local lib4,anim4 ='combat@damage@writheidle_c','writhe_idle_g'   --8666
  local lib5,anim5 ='combat@damage@rb_writhe' ,'rb_writhe_loop'    --6500

		if animacionrandom  <= 10 then
		     TaskPlayAnim(playerPed,lib1,anim1, 8.0, 8.0, -1, 33, 0, 0, 0, 0)    

			elseif animacionrandom > 10 and  animacionrandom <= 20 then
			    TaskPlayAnim(playerPed,lib2,anim2, 8.0, 8.0, -1, 33, 0, 0, 0, 0)   

			elseif animacionrandom > 20 and  animacionrandom <= 30 then
			    TaskPlayAnim(playerPed,lib3,anim3, 8.0, 8.0, -1, 33, 0, 0, 0, 0)    

			elseif animacionrandom > 30 and  animacionrandom <= 40 then
			    TaskPlayAnim(playerPed,lib4,anim4, 8.0, 8.0, -1, 33, 0, 0, 0, 0)    

			elseif animacionrandom > 40 and  animacionrandom <= 50 then
			    TaskPlayAnim(playerPed,lib5,anim5, 8.0, 8.0, -1, 33, 0, 0, 0, 0)    
		end

end)

-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Hospitals) do
		local blip = AddBlipForCoord(v.Blip.coords)

		SetBlipSprite(blip, v.Blip.sprite)
		SetBlipScale(blip, v.Blip.scale)
		SetBlipColour(blip, v.Blip.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('hospital'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Bloqueo de teclas muertos y animacion muerto
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)     
   		local playerPed = PlayerPedId()

		    if isDead or GetEntityHealth(playerPed) <= 0 then
				local lib, anim = 'combat@damage@rb_writhe'  , 'rb_writhe_loop' 
				local lib1,anim1 ='combat@damage@writhe','writhe_loop'           --2500
				local lib2,anim2 ='combat@damage@writheidle_a','writhe_idle_a'   --13000
				local lib3,anim3 ='combat@damage@writheidle_b','writhe_idle_e'   --11166
				local lib4,anim4 ='combat@damage@writheidle_c','writhe_idle_g'   --8666
				local lib5,anim5 ='combat@damage@rb_writhe' ,'rb_writhe_loop'    --6500
				local animm,libb = 'combat@damage@rb_writhe' , 'rb_writhe_loop' 

				loadanimdict('combat@damage@writhe')
				loadanimdict('combat@damage@writheidle_a')
				loadanimdict('combat@damage@writheidle_b')
				loadanimdict('combat@damage@writheidle_c')
				loadanimdict('combat@damage@rb_writhe')

		        ClearPedTasks(GetPlayerPed(-1))
		        ClearPedSecondaryTask(GetPlayerPed(-1))
		        ClearPedTasksImmediately(GetPlayerPed(-1))
		        Citizen.Wait(750)
		        deathCoords = GetEntityCoords(playerPed)
		        SetEntityInvincible(GetPlayerPed(-1),true)
		        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) 
		        TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		        TriggerEvent('esx_basicneeds:resetStatus')
		        SetEntityHealth(playerPed, GetPedMaxHealth(playerPed))
		        SetEntityCoords(playerPed, deathCoords)
		        Citizen.Wait(500)
		        TriggerEvent("random:animacion")
		        Citizen.Wait(500)
				if not IsEntityPlayingAnim(GetPlayerPed(-1),lib5,anim5, 3) and  not IsEntityPlayingAnim(GetPlayerPed(-1),lib1,anim1, 3) and  not IsEntityPlayingAnim(GetPlayerPed(-1),lib2,anim2, 3) and  not IsEntityPlayingAnim(GetPlayerPed(-1),lib3,anim3, 3) and  not IsEntityPlayingAnim(GetPlayerPed(-1),lib4,anim4, 3) then                 
				    TriggerEvent("random:animacion")
				else
				    Citizen.Wait(1000)
				end
		end
   end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500   
		if IsDead then

            sleep = 0
			--DisableAllControlActions(0)
			DisableControlAction(0, 322, true) -- Disable tilt
			DisableControlAction(0, 200, true) -- Disable tilt		
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S
			DisableControlAction(0, 30, true) -- D
			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?
			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job
			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen
			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle
			DisableControlAction(2, 36, true) -- Disable going stealth
            DisableControlAction(0, 200, true)  -- ESC
            DisableControlAction(0, 322, true)  -- ESC
            DisableControlAction(0, 191, true)  
			DisableControlAction(0, 201, true) 
            DisableControlAction(0, 215, true)  
			DisableControlAction(0, 18, true) 
            DisableControlAction(0, 176, true)  
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
			DisableControlAction(0,Keys['X'], true) 
            DisableControlAction(0,Keys['B'], true)  
			DisableControlAction(0, 73,  true)  -- x
			DisableControlAction(0, 105, true)  -- x
			DisableControlAction(0, 120, true)  -- x
			DisableControlAction(0, 154, true)  -- x
			DisableControlAction(0, 186, true)  -- x
			DisableControlAction(0, 252, true)  -- x
			DisableControlAction(0, 323, true)  -- x
			DisableControlAction(0, 337, true)  -- x
			DisableControlAction(0, 354, true)  -- x
			DisableControlAction(0, 357, true)  -- x
			DisableControlAction(0, 166, true)  -- F5
			DisableControlAction(0, 318, true)  -- F5 
			DisableControlAction(0, 327, true)  -- F5 
            DisableControlAction(0, 243, true)  -- 
			EnableControlAction(0, Keys['G'], true)
			EnableControlAction(0, Keys['T'], true)
			EnableControlAction(0, Keys['E'], true) 
			EnableControlAction(0, Keys['LEFTALT'], true)
            SetEntityInvincible(GetPlayerPed(-1),true)
		end
        Citizen.Wait(sleep)
	end
end)

-- Bloqueo de tecla EMS
Citizen.CreateThread(function()
	while true do
	  local sleep = 1000
		if bloqtecla then
            sleep = 0
            DisableAllControlActions(0)
		    EnableControlAction(0,  1, true)
		    EnableControlAction(0,  2, true)
		    EnableControlAction(0,  Keys["T"], true)
		    EnableControlAction(0,  Keys["N"], true)
 		    EnableControlAction(0,  Keys["CAPS"], true)
		    EnableControlAction(0,  Keys["N+"], true)
		    EnableControlAction(0,  Keys["F6"], true)
		    DisableControlAction(0, Keys ["LEFTALT"], true)
        end
        Citizen.Wait(sleep)
    end
end)

-- Markers --
Citizen.CreateThread(function()
    while true do
        local sleep = 750
  
        if js_isInJob and (js_Job_Name == 'ambulance' or js_Job_Name == 'medico_ilegal') then
            for hospitalNum, hospital in pairs(Config.Hospitals) do
			    -- Armarios Ropa --
                for k, v in pairs(hospital.Cloakrooms) do
                    for j, p in pairs(v.Pos) do
			      	    local me = PlayerPedId()
			      	    local playerPos = GetEntityCoords(me, true)
			      	    local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, p.x, p.y, p.z)
			      	    if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			      	    	DrawMarker(v.Type, p.x, p.y, p.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			      	    	sleep = 0
			      	    	if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			      	    		if not IsPedInAnyVehicle(me, false) then
			      	    			ESX.ShowHelpNotification(_U('actions_prompt'))
			      	    			if IsControlJustReleased(0, 38) and js_isInJob then
			      	    				OpenAmbulanceActionsMenu()
			      	    			end
			      	    		end
			      	    	end
			      	    end
                    end
			    end

                -- Almacenes --
                for k, v in pairs(hospital.Vaults) do
                    for j, p in pairs(v.Pos) do
			      	    local me = PlayerPedId()
			      	    local playerPos = GetEntityCoords(me, true)
			      	    local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, p.x, p.y, p.z)
			      	    if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			      	    	DrawMarker(v.Type, p.x, p.y, p.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			      	    	sleep = 0
			      	    	if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			      	    		if not IsPedInAnyVehicle(me, false) then
			      	    			ESX.ShowHelpNotification(_U('open_pharmacy'))
			      	    			if IsControlJustReleased(0, 38) and js_isInJob then
			      	    				OpenPharmacyMenu()
			      	    			end
			      	    		end
			      	    	end
			      	    end
                    end
			    end

				-- BossActions --
				for k, v in pairs(hospital.BossActions) do
			      	local me = PlayerPedId()
			      	local playerPos = GetEntityCoords(me, true)
			      	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			      	if distance <= 7.5 and not IsPedDeadOrDying(me, true) and ESX.PlayerData.job.grade_name == 'boss' then	
			      		DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			      		sleep = 0
			      		if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			      			if not IsPedInAnyVehicle(me, false) then
			      				ESX.ShowHelpNotification(_U('open_pharmacy'))
			      				if IsControlJustReleased(0, 38) and js_isInJob then
			      					ESX.UI.Menu.CloseAll()
			  		      			TriggerEvent('esx_society:openBosthsMenu', 'ambulance', function(data, menu)
			  		  	    			menu.close()
                  					end, { wash = false })
			      				end
			      			end
			      		end
			      	end
			    end

                -- Spawn Vehiculos --
                for k, v in pairs(hospital.Vehicles) do
			  	    local me = PlayerPedId()
			  	    local playerPos = GetEntityCoords(me, true)
			  	    local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			  	    if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  		    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  		    sleep = 0
			  		    if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  		    	if not IsPedInAnyVehicle(me, false) then
			  		    		ESX.ShowHelpNotification(_U('garage_prompt'))
			  		    		if IsControlJustReleased(0, 38) and js_isInJob then
			  		    			OpenVehicleSpawnerMenu(hospital.name, 'Vehicles')
			  		    		end
			  		    	end
			  		    end
			  	    end
			    end

                -- Spawn Helicopteros --
                for k, v in pairs(hospital.Helicopters) do
			  	    local me = PlayerPedId()
			  	    local playerPos = GetEntityCoords(me, true)
			  	    local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			  	    if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  		    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  		    sleep = 0
			  		    if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  		    	if not IsPedInAnyVehicle(me, false) then
			  		    		ESX.ShowHelpNotification(_U('garage_prompt'))
			  		    		if IsControlJustReleased(0, 38) and js_isInJob then
			  		    			OpenVehicleSpawnerMenu(hospital.name, 'Helicopters')
			  		    		end
			  		    	end
			  		    end
			  	    end
			    end

				-- Spawn Boats --
                for k, v in pairs(hospital.Boats) do
			  	    local me = PlayerPedId()
			  	    local playerPos = GetEntityCoords(me, true)
			  	    local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			  	    if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  		    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  		    sleep = 0
			  		    if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  		    	if not IsPedInAnyVehicle(me, false) then
			  		    		ESX.ShowHelpNotification(_U('garage_prompt'))
			  		    		if IsControlJustReleased(0, 38) and js_isInJob then
			  		    			OpenVehicleSpawnerMenu(hospital.name, 'Boats')
			  		    		end
			  		    	end
			  		    end
			  	    end
			    end

				-- Borrar Vehiculos --
                for k, v in pairs(hospital.VehicleDeleters) do
					for j, p in pairs(v.Pos) do
			  	    	local me = PlayerPedId()
			  	    	local playerPos = GetEntityCoords(me, true)
			  	    	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, p.x, p.y, p.z)
			  	    	if distance <= 10 and not IsPedDeadOrDying(me, true) then
							if IsPedInAnyVehicle(me, false) then
								
			  	    			DrawMarker(v.Type, p.x, p.y, p.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  	    			sleep = 0
			  	    			if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  	    				ESX.ShowHelpNotification(_U('store_vehicle'))
			  	    				if IsControlJustReleased(0, 38) and js_isInJob then
			  	    					local vehicle = GetVehiclePedIsIn(me,  false)
			  	    					ESX.Game.DeleteVehicle(vehicle)
			  	    				end
			  	    			end
							end
			  	    	end
					end
			    end

                -- Fast Travels
			    for k,v in ipairs(hospital.FastTravels) do
			    	local me = PlayerPedId()
			      	local playerPos = GetEntityCoords(me, true)
			      	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.From)
                    
			    	if distance < Config.DrawDistance then
			    		DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
			    		sleep = 0
			    	    if distance < v.Marker.x then
			    		    FastTravel(v.To.coords, v.To.heading)
			    	    end
                    end
			    end

			    -- Fast Travels (Prompt)
			    for k,v in ipairs(hospital.FastTravelsPrompt) do
			    	local me = PlayerPedId()
			      	local playerPos = GetEntityCoords(me, true)
			      	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.From)
                    
			    	if distance < Config.DrawDistance then
			    		DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
			    		sleep = 0
                        if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  		    	if not IsPedInAnyVehicle(me, false) then
			  		    		ESX.ShowHelpNotification(_U('fast_travel'))
			  		    		if IsControlJustReleased(0, 38) then
			  		    			FastTravel(v.To.coords, v.To.heading)
			  		    		end
			  		    	end
			  		    end
			    	end
			    end

            end
        end
        Wait(sleep)
    end
end)



RegisterCommand("openambulancemenu",function()
	TriggerServerEvent("yueqweuytrquwyteruy_ambulance:eyrtqwyterqywreuytrqwuyte_ambulance")
end)

RegisterNetEvent("wtuqtwiuyqtwutqiuw_ambulance:rwytqrwuyrquywruyqt_ambulance")
AddEventHandler("wtuqtwiuyqtwutqiuw_ambulance:rwytqrwuyrquywruyqt_ambulance",function()
	OpenMobileAmbulanceActionsMenu2()
end)

RegisterKeyMapping('openambulancemenu', 'Abrir Menu EMS', 'keyboard', 'F6' )

AddEventHandler('onResourceStart', function (resourceName)
	if(GetCurrentResourceName() == resourceName)  then
		TriggerServerEvent("ruyfwuytruyrfwyeruy_ambulance:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_ambulance")
	end
end)

AddEventHandler('esx:playerLoaded', function ()
	TriggerServerEvent("ruyfwuytruyrfwyeruy_ambulance:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_ambulance")
end)

RegisterNetEvent("feuytqwreuyfrquwyterqy_ambulance:gsfcudyafsuydruyas_ambulance")
AddEventHandler("feuytqwreuyfrquwyterqy_ambulance:gsfcudyafsuydruyas_ambulance",function(boolean, job)
	js_isInJob = boolean
	js_Job_Name = job.name
end)



S = {}
local attached, brancard, layed = false, nil, false

-- Functions
S.GetTable = function(table, callback)
    for k,v in pairs(table) do
        callback(v)
    end
end

S.Draw = function(text, x, y, z)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

S.CheckBrancard = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local veh = 0

    for k,v in pairs(Config.VehiclesBrancard) do
        veh = GetClosestVehicle(pedC.x, pedC.y, pedC.z, 7.5, GetHashKey(v), 70)

        if veh ~= 0 then
            return false
        end
    end

    return veh
end

S.Attach = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)

    local playerPos = GetEntityCoords(player)

    if brancard ~= nil then
        if brancard == -1 then

            NetworkRequestControlOfEntity(brancard)
            LoadAnim("anim@heists@box_carry@")
            TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)

            SetTimeout(150, function()
                AttachEntityToEntity(brancard, ped, GetPedBoneIndex(ped, 28422), 0.0, -1.0, -1.0, 195.0, 180.0, 180.0, 90.0, false, false, true, false, 2, true)
            end)

            FreezeEntityPosition(object, false)
        else

            NetworkRequestControlOfEntity(brancard)

            while not HasAnimDictLoaded("anim@heists@box_carry@") do
                RequestAnimDict("anim@heists@box_carry@")

                Citizen.Wait(1)
            end
            TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)

            SetTimeout(150, function()
                AttachEntityToEntity(brancard, ped, GetPedBoneIndex(ped, 28422), 0.0, -1.0, -1.0, 195.0, 180.0, 180.0, 90.0, false, false, true, false, 2, true)
            end)

            FreezeEntityPosition(object, false)
        end
    end
end

S.Detach = function()
    local ped = PlayerPedId()

    DetachEntity(brancard, false, true)
    ClearPedTasks(ped)
    attached = false
end

S.SetClosest = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local object = GetClosestObjectOfType(pedC.x, pedC.y, pedC.z, 10.0, GetHashKey("prop_ld_binbag_01"), false, false, false)

    if object ~= 0 then
        brancard = object
    end
end

S.GetBrancard = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local veh = S.CheckBrancard()

    if veh ~= 0 then
        local VehCoords = GetOffsetFromEntityInWorldCoords(PlayerPed, 0, 0.75, 0)

        while not HasModelLoaded('prop_ld_binbag_01') do
            RequestModel('prop_ld_binbag_01')

            Citizen.Wait(1)
        end

        object = CreateObject(GetHashKey('prop_ld_binbag_01'), pedC, true)
        if object ~= nil or object ~= 0 then

            SetEntityRotation(object, 0.0, 0.0, GetEntityHeading(Vehicle), false, false)
            FreezeEntityPosition(object, true)
            PlaceObjectOnGroundProperly(object)
            brancard = object

            SetTimeout(200, function()
                S.Attach()
                attached = true
            end)
        end
    else
        ESX.ShowNotification('No estás cerca de una ambulancia')
    end
end

S.Lay = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local obj = GetClosestObjectOfType(pedC.x, pedC.y, pedC.z, 3.0, GetHashKey('prop_ld_binbag_01'), false, false, false)
    local player, distance = ESX.Game.GetClosestPlayer()

    if player == -1 then
        while not HasAnimDictLoaded("anim@gangops@morgue@table@") do
            RequestAnimDict("anim@gangops@morgue@table@")

            Citizen.Wait(1)
        end

        if obj ~= nil or obj ~= 0 then
            TaskPlayAnim(PlayerPedId(), "anim@gangops@morgue@table@", "ko_front", 8.0, 8.0, -1, 69, 1, false, false, false)
            AttachEntityToEntity(ped, obj, 0, 0, 0.0, 1.6, 0.0, 0.0, 360.0, 0.0, false, false, false, false, 2, true)

            layed = true
        end
    else
        while not HasAnimDictLoaded("anim@gangops@morgue@table@") do
            RequestAnimDict("anim@gangops@morgue@table@")

            Citizen.Wait(1)
        end

        if obj ~= nil or obj ~= 0 then
            TaskPlayAnim(PlayerPedId(), "anim@gangops@morgue@table@", "ko_front", 8.0, 8.0, -1, 69, 1, false, false, false)
            AttachEntityToEntity(ped, obj, 0, 0, 0.0, 1.6, 0.0, 0.0, 360.0, 0.0, false, false, false, false, 2, true)

            layed = true
        end
    end
end

S.GetOff = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local coords = GetOffsetFromEntityInWorldCoords(brancard, 0.85, 0.0, 0)

    ClearPedTasks(ped)
    DetachEntity(ped, false, true)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)

    layed = false
end

-- END Functions

-- Threads

Citizen.CreateThread(function()
    while true do
        local s = 500

        local ped = PlayerPedId()

        S.SetClosest()

        if attached then
            s = 0

            for k,v in pairs(Config.DetachKeys) do
                if IsControlJustPressed(0, v) or IsDisabledControlJustPressed(0, v) then
                    S.Detach()
                end
            end

            if IsPedShooting(ped) or IsPlayerFreeAiming(PlayerId()) or IsPedInMeleeCombat(ped) then
                S.Detach()
            end

            if IsPedDeadOrDying(ped, false) then
                S.Detach()
            end

            if IsPedRagdoll(ped) then
                S.Detach()
            end
        end

        Citizen.Wait(s)
    end
end)

Citizen.CreateThread(function()
    while true do
        local s = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)

        if brancard ~= nil then
            local objectC = GetEntityCoords(brancard)
            local offset = GetOffsetFromEntityInWorldCoords(brancard, 0, 0.85, 0)

            local dist = #(pedC - vector3(offset.x, offset.y, offset.z))

            if dist <= 2 then
                s = 0

                if not layed then
                    if not attached then
                        S.Draw('~h~~b~COGER CAMILLA', offset.x, offset.y, offset.z + 1.5)
                        S.Draw('Pulsa la H', offset.x, offset.y, offset.z + 1.35)
                        S.Draw('~h~~b~CONGELAR CAMILLA', offset.x, offset.y, offset.z + 1.15)
                        S.Draw('Pulsa la G', offset.x, offset.y, offset.z + 1.0)

                        if IsControlJustPressed(0, 74) then
                            S.Attach()

                            attached = true
                        end

                        if IsControlJustPressed(0, 58) then
                            FreezeEntityPosition(brancard, true)
                        end
                    else
                        S.Draw('~h~~b~DEJAR CAMILLA', offset.x, offset.y, offset.z + 1.15)
                        S.Draw('Pulsa la H', offset.x, offset.y, offset.z + 1.0)

                        if IsControlJustPressed(0, 74) then
                            S.Detach()

                            attached = false
                        end
                    end
                end

                if not layed then
                    if not attached then
                        S.Draw('~h~~b~SUBIRTE', offset.x, offset.y, offset.z + 0.85)
                        S.Draw('Pulsa la Y', offset.x, offset.y, offset.z + 0.70)

                        if IsControlJustPressed(0, 246) or IsDisabledControlJustPressed(0, 246) then
                            S.Lay()
                        end
                    end
                else
                    if not attached then
                        S.Draw('~h~~b~BAJARTE', offset.x, offset.y, offset.z + 1.0)
                        S.Draw('Pulsa la Y', offset.x, offset.y, offset.z + 0.85)

                        if IsControlJustPressed(0, 246) or IsDisabledControlJustPressed(0, 246) then
                            S.GetOff()
                        end
                    end
                end
            end
        end

        Citizen.Wait(s)
    end
end)

RegisterCommand('borrarcamilla', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)

        local obj = GetClosestObjectOfType(pedC.x, pedC.y, pedC.z, 3.0, GetHashKey('prop_ld_binbag_01'), false, false, false)
        if obj ~= nil or obj ~= 0 then
            S.Detach()
    
            DeleteObject(brancard)
            ClearPedTasks(PlayerPedId())
        else
            ESX.ShowNotification('No hay ningúna camilla cerca')
        end
    else
        ESX.ShowNotification('No eres EMS para utilizar este comando')
    end
end)

RegisterCommand('camilla', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
        S.GetBrancard()
    else
        ESX.ShowNotification('No eres EMS para utilizar este comando')
    end
end)

-- END Threads

-- Events

AddEventHandler('onResourceStop', function()
    if brancard ~= nil then
        S.Detach()

        DeleteObject(brancard)
        ClearPedTasks(PlayerPedId())
    end
end)

-- END Events