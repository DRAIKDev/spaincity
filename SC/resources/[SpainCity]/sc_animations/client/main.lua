local Keys = {
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

ESX = nil
local isDead = false
local inAnim = false
local isMult = false
local GUI							= {}
GUI.Time							= 0
local canShoot = true
--local prop = ''
--local prop_name = ''
currentDict = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

function startAttitude(lib, anim)
	ESX.Streaming.RequestAnimSet(lib, function()
		SetPedMovementClipset(PlayerPedId(), anim, true)
	end)


end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
		--TaskPlayAnim( PlayerPedId(), lib, anim, 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	end)

	
end

function startScenario(anim)

	local ped = GetPlayerPed(-1);
    
    if ped and not IsPedSittingInAnyVehicle(ped) then

        local pos = GetEntityCoords(ped);
        local head = GetEntityHeading(ped);
		
		if anim == "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" or anim == "PROP_HUMAN_SEAT_SUNLOUNGER" or anim == "PROP_HUMAN_SEAT_BENCH" then
          TaskStartScenarioAtPosition(ped, anim, pos['x'], pos['y'], pos['z'] - 1, head, 0, true, true);
		  --FreezeEntityPosition(ped, true)
		else
          TaskStartScenarioInPlace(ped, anim, 0, false)
		end

    end
	--TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)

end

function OpenAnimationsMenu()
	local elements = {}

	for i=1, #Config.Animations, 1 do
		table.insert(elements, {label = Config.Animations[i].label, value = Config.Animations[i].name})
	end
	table.insert(elements, {label = 'Animaciones Sincronizadas +18', value = 'sync18'})
	table.insert(elements, {label = 'Animaciones Sincronizadas', value = 'sync'})
	table.insert(elements, {label = 'Animaci�n favorita [L]', value = 'favorite'})
	table.insert(elements, {label = 'Forma de andar favorita [.]', value = 'favorite_attitude'})

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animations',
	{
		title    = 'Animaciones',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'favorite' then
			OpenFavoriteMenu()
		elseif data.current.value == 'favorite_attitude' then
			OpenFavoriteAttitudeMenu()
		elseif data.current.value == 'sync' then
			OpenSyncedMenuNormal()
		elseif data.current.value == 'sync18' then
			OpenSyncedMenu18()
		else
			OpenAnimationsSubMenu(data.current.value)
		end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx_animations:syncTarget')
AddEventHandler('esx_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, spin)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, 180.0, false, false, false, false, 2, false)
	Wait(500)
	DetachEntity(GetPlayerPed(-1), true, false)
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, 3000, 0, 0, false, false, false)

	Citizen.Wait(3000)
	DetachEntity(GetPlayerPed(-1), true, false)
end)

RegisterNetEvent('esx_animations:syncMe')
AddEventHandler('esx_animations:syncMe', function(animationLib, animation)
	local playerPed = GetPlayerPed(-1)

	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, 3000, 0, 0, false, false, false)

	Citizen.Wait(3000)

end)
function OpenSyncedMenuNormal()

	local elements2 = {}
	for k, v in pairs(Config['Synced']) do
		table.insert(elements2, {['label'] = v['Label'], ['id'] = k})
	end
	
	ESX['UI']['Menu']['Open']('default', GetCurrentResourceName(), 'play_synced',
	{
		title = "Animaciones sincronizadas",
		align = 'bottom-right',
		elements = elements2
	}, function(data2, menu2)
		current = data2['current']
		local allowed = false
		if Config['Synced'][current['id']]['Car'] then
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				allowed = true
			else
				ESX['ShowNotification'](Strings['Not_In_Car'])
			end
		else
			allowed = true
		end
		if allowed then
			if not Config['Debug'] then
				local allowed = false
				local distance, closest

				for k, v in pairs(GetActivePlayers()) do
					src = GetPlayerServerId(v)
					if src ~= GetPlayerServerId(PlayerId()) then
						plr = GetPlayerFromServerId(src)
						dist = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(plr)))
						if not closest then
							closest = src
							distance = dist
						else
							if dist < distance then
								distance = dist
								closest = src
							end
						end
					end
				end

				if distance <= 2.0 then
					TriggerServerEvent('yisus_animations:requestSynced', closest, current['id'])
				else
					ESX['ShowNotification'](Strings['Noone_Close'])
				end

			else

				local id = current['id']

				local target = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), 1, 1)
				CreateThread(function()

					local anim = Config['Synced'][id]['Accepter']

					if Config['Synced'][id]['Car'] then
						TaskWarpPedIntoVehicle(target, GetVehiclePedIsUsing(PlayerPedId()), 0)
					end

					if anim['Attach'] then
						local attach = anim['Attach']
						AttachEntityToEntity(target, PlayerPedId(), attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
					end

					Wait(750)

					if anim['Type'] == 'animation' then
						loadAnimDict(anim['Dict'])
						TaskPlayAnim(target, anim['Dict'], anim['Anim'], 8.0, -8.0, -1, anim['Flags'] or 0, 0, false, false, false)
					end

					anim = Config['Synced'][id]['Requester']

					while not IsEntityPlayingAnim(PlayerPedId(), anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(target, PlayerPedId(), true)
					end
					DetachEntity(target)
					while IsEntityPlayingAnim(PlayerPedId(), anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(target, PlayerPedId(), true)
					end

					ClearPedTasks(target)
					DeleteEntity(target)

				end)
				CreateThread(function()
					local anim = Config['Synced'][id]['Requester']
					if anim['Attach'] then
						local attach = anim['Attach']
						AttachEntityToEntity(PlayerPedId(), target, attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
					end

					Wait(750)

					if anim['Type'] == 'animation' then
						PlayAnim(anim['Dict'], anim['Anim'], anim['Flags'])
					end

					anim = Config['Synced'][id]['Accepter']

					while not IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(PlayerPedId(), target, true)
					end
					DetachEntity(PlayerPedId())
					while IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(PlayerPedId(), target, true)
					end

					ClearPedTasks(PlayerPedId())
				end)

			end
		end
	end, function(data2, menu2)
		menu2['close']()
	end)

end

function OpenSyncedMenu18()

	local elements2 = {}
	for k, v in pairs(Config['Synced+18']) do
		table.insert(elements2, {['label'] = v['Label'], ['id'] = k})
	end
	
	ESX['UI']['Menu']['Open']('default', GetCurrentResourceName(), 'play_synced',
	{
		title = "Animaciones sincronizadas",
		align = 'bottom-right',
		elements = elements2
	}, function(data2, menu2)
		current = data2['current']
		local allowed = false
		if Config['Synced+18'][current['id']]['Car'] then
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				allowed = true
			else
				ESX['ShowNotification'](Strings['Not_In_Car'])
			end
		else
			allowed = true
		end
		if allowed then
			if not Config['Debug'] then
				local allowed = false
				local distance, closest

				for k, v in pairs(GetActivePlayers()) do
					src = GetPlayerServerId(v)
					if src ~= GetPlayerServerId(PlayerId()) then
						plr = GetPlayerFromServerId(src)
						dist = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(plr)))
						if not closest then
							closest = src
							distance = dist
						else
							if dist < distance then
								distance = dist
								closest = src
							end
						end
					end
				end

				if distance <= 2.0 then
					TriggerServerEvent('yisus_animations:requestSynced', closest, current['id'], "+18")
				else
					ESX['ShowNotification'](Strings['Noone_Close'])
				end

			else

				local id = current['id']

				local target = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), 1, 1)
				CreateThread(function()

					local anim = Config['Synced+18'][id]['Accepter']

					if Config['Synced+18'][id]['Car'] then
						TaskWarpPedIntoVehicle(target, GetVehiclePedIsUsing(PlayerPedId()), 0)
					end

					if anim['Attach'] then
						local attach = anim['Attach']
						AttachEntityToEntity(target, PlayerPedId(), attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
					end

					Wait(750)

					if anim['Type'] == 'animation' then
						loadAnimDict(anim['Dict'])
						TaskPlayAnim(target, anim['Dict'], anim['Anim'], 8.0, -8.0, -1, anim['Flags'] or 0, 0, false, false, false)
					end

					anim = Config['Synced+18'][id]['Requester']

					while not IsEntityPlayingAnim(PlayerPedId(), anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(target, PlayerPedId(), true)
					end
					DetachEntity(target)
					while IsEntityPlayingAnim(PlayerPedId(), anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(target, PlayerPedId(), true)
					end

					ClearPedTasks(target)
					DeleteEntity(target)

				end)
				CreateThread(function()
					local anim = Config['Synced+18'][id]['Requester']
					if anim['Attach'] then
						local attach = anim['Attach']
						AttachEntityToEntity(PlayerPedId(), target, attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
					end

					Wait(750)

					if anim['Type'] == 'animation' then
						PlayAnim(anim['Dict'], anim['Anim'], anim['Flags'])
					end

					anim = Config['Synced+18'][id]['Accepter']

					while not IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(PlayerPedId(), target, true)
					end
					DetachEntity(PlayerPedId())
					while IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
						Wait(0)
						SetEntityNoCollisionEntity(PlayerPedId(), target, true)
					end

					ClearPedTasks(PlayerPedId())
				end)

			end
		end
	end, function(data2, menu2)
		menu2['close']()
	end)

end


function OpenFavoriteMenu()

	local elements = {}

	for i=1, #Config.Animations, 1 do
		if Config.Animations[i].name ~= "attitudem" then
			table.insert(elements, {label = Config.Animations[i].label, value = Config.Animations[i].name})
		end
	end

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'favorite',
	{
		title    = 'Favoritas',
		align = 'bottom-right',
		elements = elements
	},
	function(data, menu)
		OpenFavoriteSubMenu(data.current.value)
	end,
	function(data, menu)
		menu.close()
	end)

end

function OpenFavoriteSubMenu(menu)

	local title    = nil
	local elements = {}

	for i=1, #Config.Animations, 1 do
		
		if Config.Animations[i].name == menu then

			title = Config.Animations[i].label

			for j=1, #Config.Animations[i].items, 1 do
				table.insert(elements, {
					label = Config.Animations[i].items[j].label,
					type  = Config.Animations[i].items[j].type,
					value = Config.Animations[i].items[j].data
				})
			end

			break

		end

	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'favorite_submemu',
		{
			title = title,
			align = 'bottom-right',
			elements = elements
		},
		function(data, menu)

			local type = data.current.type
			local lib  = data.current.value.lib
			local anim = data.current.value.anim
			if type == 'scenario' then
				ESX.UI.Menu.CloseAll()
				TriggerServerEvent('esx_animations:newFavorite', 'null', anim, 1)
			else
			if type ~= 'attitude' and type == 'anim' then
				ESX.UI.Menu.CloseAll()
				TriggerServerEvent('esx_animations:newFavorite', lib, anim, 0)
			else
				--print(type)
				ESX.UI.Menu.CloseAll()
				TriggerServerEvent('esx_animations:newFavorite', data.current.type, 'null', 0)
			end
		end
		
	end,
	function(data, menu)
		menu.close()
	end)

end



function OpenFavoriteAttitudeMenu()

	local elements = {}

	for i=1, #Config.Animations, 1 do
		if Config.Animations[i].name == "attitudem" then
			table.insert(elements, {label = Config.Animations[i].label, value = Config.Animations[i].name})
		end
	end

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'favorite',
	{
		title    = 'Favoritas',
		align = 'bottom-right',
		elements = elements
	},
	function(data, menu)
		OpenFavoriteAttitudeSubMenu(data.current.value)
	end,
	function(data, menu)
		menu.close()
	end)

end

function OpenFavoriteAttitudeSubMenu(menu)

	local title    = nil
	local elements = {}

	for i=1, #Config.Animations, 1 do
		
		if Config.Animations[i].name == menu then

			title = Config.Animations[i].label

			for j=1, #Config.Animations[i].items, 1 do
				table.insert(elements, {
					label = Config.Animations[i].items[j].label,
					type  = Config.Animations[i].items[j].type,
					value = Config.Animations[i].items[j].data
				})
			end

			break

		end

	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'favorite_submemu',
		{
			title = title,
			align = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			local lib  = data.current.value.lib
			local anim = data.current.value.anim			
			ESX.UI.Menu.CloseAll()
			print('[CLIENTE] Paso la actitud seleccionada a la base de datos' .. '   lib: ' .. lib .. '   anim: ' .. anim)
			TriggerServerEvent('esx_animations:newFavoriteAttitude', lib, anim)
		end,
	function(data, menu)
		menu.close()
	end)

end




function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function OpenAnimationsSubMenu(menu)
	local title    = nil
	local elements = {}

	for i=1, #Config.Animations, 1 do
		if Config.Animations[i].name == menu then
			title = Config.Animations[i].label

			for j=1, #Config.Animations[i].items, 1 do
				table.insert(elements, {
					label = Config.Animations[i].items[j].label,
					type  = Config.Animations[i].items[j].type,
					value = Config.Animations[i].items[j].data
				})
			end

			break

		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animations_sub',
	{
		title    = title,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local type = data.current.type
		local lib  = data.current.value.lib
		local anim = data.current.value.anim

		if type == 'scenario' then
			startScenario(anim)
		elseif type == 'attitude' then
			startAttitude(lib, anim)
		elseif type == 'anim' then
			startAnim(lib, anim)

		else
			local argh = type
			--print(argh)
			RadiantAnims(argh)

		end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx_animations')
AddEventHandler('esx_animations', function()
	OpenAnimationsMenu()
end)

-- Key Controls
Citizen.CreateThread(function()


	local playerPed = PlayerPedId()

	while true do
		Citizen.Wait(10)

		--Abrir menu animaciones
		if IsControlJustReleased(0, Keys['F9']) and IsInputDisabled(0) and not isDead then
			OpenAnimationsMenu()
		end

		--cancelar animaciones y borrar objetos
		 if IsControlJustPressed(0,  Keys['X']) then

		  	ClearPedTasks(GetPlayerPed(-1))
			DetachEntity(prop, 1, 1)
			DeleteObject(prop)
			DetachEntity(secondaryprop, 1, 1)
			DeleteObject(secondaryprop)
		
			RemoveWeaponFromPed(player,0x88C78EB7) --brie
			SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
			currentDict = nil	
			canShoot = true
		
	 	 end
		
		--Animaciones favoritas
		if IsControlJustReleased(0, Keys['L']) and not IsControlJustReleased(0, Keys['LEFTSHIFT']) and not isDead and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
			ESX.TriggerServerCallback('esx_animations:getFavorite', function(data)

				--print(data.lib,data.animation,data.scenario)
				if data.scenario == true then
					startScenario(data.animation)
				elseif data.scenario == false and data.animation ~= 'null' then
					startAnim(data.lib, data.animation)
				elseif data.animation == 'null' then
					--print("playeando fav", data.lib)
					RadiantAnims(data.lib)
				end
			end)
		end

		-- Actitud favorita
		if IsControlJustReleased(0, Keys['.']) and not isDead and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
			ESX.TriggerServerCallback('esx_animations:getFavoriteAttitude', function(data)
				--print(data.lib,data.animation,data.scenario)
				if data.anim ~= 'null' then
					startAttitude(data.lib, data.anim)
				end
			end)
		end

		--Puede disparar? En animaciones de armas
		if not canShoot then
			if IsControlPressed(0, 25) then
				if IsEntityPlayingAnim(GetPlayerPed(-1), currentDict, "idle", 3) then
					StopAnimTask(GetPlayerPed(-1), currentDict, "idle", 2.0)
				end
			else
				DisablePlayerFiring(GetPlayerPed(-1), true)
				if not IsEntityPlayingAnim(GetPlayerPed(-1), currentDict, "idle", 3) then
					TaskPlayAnim( GetPlayerPed(-1), currentDict, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
				end
			end
		end

	end
end)

function sendNotification(message, messagetype, messagetimeout)
	TriggerEvent("pNotify:SendNotification",{
		text = (message),
		type = messagetype,
		timeout = (messagetimeout),
		layout = "bottomCenter",
		queue = "global"
	})
end



function RadiantAnims(arghh)


	local player = GetPlayerPed(-1)
	--local name = GetPlayerName(PlayerId())
	--local id = GetPlayerServerId(PlayerId())
	local argh = arghh
	
			--print(argh)
			if argh == 'salute' then --ok
				local ad = "anim@mp_player_intuppersalute"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (600)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'finger' then --ok
				local ad = "anim@mp_player_intselfiethe_bird"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'finger2' then --ok
				local ad = "anim@mp_player_intupperfinger"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'palm' then --ok
				local ad = "anim@mp_player_intupperface_palm"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end

			elseif argh == 'notes' then --ok
				--print("dentro notes")
				local ad = "missheistdockssetup1clipboard@base"
				
				local prop_name = prop_name or 'prop_notepad_01'
				local secondaryprop_name = secondaryprop_name or 'prop_pencil_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						secondaryprop = CreateObject(GetHashKey(secondaryprop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 18905), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true, true, false, true, 1, true) -- notepad
						AttachEntityToEntity(secondaryprop, player, GetPedBoneIndex(player, 58866), 0.12, 0.0, 0.001, -150.0, 0.0, 0.0, true, true, false, true, 1, true) -- pencil
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'brief' then --ok
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					GiveWeaponToPed(player, 0x88C78EB7, 1, false, true);
					
				end

		
			elseif argh == 'damn' then --ok
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_damn", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_damn", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'fail' then --ok
				local ad = "random@car_thief@agitated@idle_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "agitated_idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "agitated_idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'gang1' then --ok
				local ad = "mp_player_int_uppergang_sign_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_gang_sign_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_gang_sign_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'gang2' then --ok
				local ad = "mp_player_int_uppergang_sign_b"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_gang_sign_b", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_gang_sign_b", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'no' then --ok
				local ad = "mp_player_int_upper_nod"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_nod_no", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_nod_no", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'pickbutt' then --ok
				local ad = "mp_player_int_upperarse_pick"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_arse_pick", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_arse_pick", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'grabcrotch' then --ok 
				local ad = "mp_player_int_uppergrab_crotch"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_grab_crotch", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_grab_crotch", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'peace' then --ok
				local ad = "mp_player_int_upperpeace_sign"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_peace_sign", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_peace_sign", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'holster' then --ok
				local ad = "move_m@intimidation@cop@unarmed"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'aim' then --OK  
				local ad = "move_weapon@pistol@copa"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) and IsPedArmed (player, 7) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						canShoot = true
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						canShoot = false
						currentDict=ad
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 

				else
					sendNotification('No tienes ninguna arma equipada.', 'error', 2500)    
				end
			elseif argh == 'aim2' then --ok 
				local ad = "move_weapon@pistol@cope"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) and IsPedArmed (player, 7) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						canShoot = true
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						
					else
						canShoot = false
						currentDict=ad
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				else
					sendNotification('No tienes ninguna arma equipada.', 'error', 2500)    
				end

			elseif argh == 'guard' then --OK
				local ad = "rcmepsilonism8"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base_carrier", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "base_carrier", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end

			
			elseif argh == 'slowclap' then --ok
				local ad = "anim@mp_player_intcelebrationmale@slow_clap"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
						loadAnimDict( ad )
						if ( IsEntityPlayingAnim( player, ad, "slow_clap", 3 ) ) then 
							TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							ClearPedSecondaryTask(player)
							Wait (100)
						else
							TaskPlayAnim( player, ad, "slow_clap", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							Wait (500)
						end       
					end
				end

			elseif argh == 'cheer' then --ok
				local ad = "amb@world_human_cheering@male_a"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
						loadAnimDict( ad )
						if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
							TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							ClearPedSecondaryTask(player)
							Wait (100)
						else
							TaskPlayAnim( player, ad, "base", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							Wait (500)
						end       
					end
				end

			elseif argh == 'leanwall' then
				local ad = "amb@lo_res_idles@"
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (100)
					else
						TaskPlayAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (500)
					end     
				end
			elseif argh == 'copcrowd' then --ok
				local ad = "amb@code_human_police_crowd_control@idle_a" --- insert the animation dic here
				local anim = "idle_a" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			elseif argh == 'copcrowd2' then --ok
				local ad = "amb@code_human_police_crowd_control@idle_b" --- insert the animation dic here
				local anim = "idle_d" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'copidle' then --ok

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_COP_IDLES', 0, 1)   
					end 
				end
			end
			--Cerramos menu
		--[[end,
		function(data, menu)
			menu.close()
	end)--]]
		
end


-------------------------------------------------------------

RegisterNetEvent('yisus_animations:syncRequest')
AddEventHandler('yisus_animations:syncRequest', function(requester, id, name, menu)
    local accepted = false
    local timer = GetGameTimer() + 5000
    while timer >= GetGameTimer() do 
        Wait(0)
		if menu == "+18" then 
			HelpText((Strings['Sync_Request']):format(Config['Synced+18'][id]['RequesterLabel'], name) .. ('\n~INPUT_FRONTEND_ACCEPT~ %s \n~INPUT_FRONTEND_RRIGHT~ %s'):format(Strings['Yes'], Strings['No']))

		else 
			HelpText((Strings['Sync_Request']):format(Config['Synced'][id]['RequesterLabel'], name) .. ('\n~INPUT_FRONTEND_ACCEPT~ %s \n~INPUT_FRONTEND_RRIGHT~ %s'):format(Strings['Yes'], Strings['No']))

		end 


        if IsControlJustReleased(0, 194) then
            break
        elseif IsControlJustReleased(0, 201) then
            accepted = true
            break
        end

    end

    if accepted then
        TriggerServerEvent('yisus_animations:syncAccepted', requester, id, menu)
    end
end)


----------------------- Funcions Sync
RegisterNetEvent('yisus_animations:playSynced')
AddEventHandler('yisus_animations:playSynced', function(serverid, id, type, menu)
	local anim 
	
	if menu == "+18" then 
		anim = Config['Synced+18'][id][type]
	else 
		anim = Config['Synced'][id][type]
	end

    local target = GetPlayerPed(GetPlayerFromServerId(serverid))
    if anim['Attach'] then
        local attach = anim['Attach']
        AttachEntityToEntity(PlayerPedId(), target, attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
    end

    Wait(750)

    if anim['Type'] == 'animation' then
        PlayAnim(anim['Dict'], anim['Anim'], anim['Flags'])
    end
	if menu == "+18" then 
		if type == 'Requester' then
			anim = Config['Synced+18'][id]['Accepter']
		else
			anim = Config['Synced+18'][id]['Requester']
		end
	else
		if type == 'Requester' then
			anim = Config['Synced'][id]['Accepter']
		else
			anim = Config['Synced'][id]['Requester']
		end
	end
		
    while not IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
        Wait(0)
        SetEntityNoCollisionEntity(PlayerPedId(), target, true)
    end
    DetachEntity(PlayerPedId())
    while IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
        Wait(0)
        SetEntityNoCollisionEntity(PlayerPedId(), target, true)
    end

    ClearPedTasks(PlayerPedId())
end)


PlayAnim = function(Dict, Anim, Flag)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end
    TaskPlayAnim(PlayerPedId(), Dict, Anim, 8.0, -8.0, -1, Flag or 0, 0, false, false, false)
end



HelpText = function(msg)
    AddTextEntry(GetCurrentResourceName(), msg)
    DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
end


Citizen.CreateThread(function()
	while true do

		Citizen.Wait(5)
		if Config['PoleDance']['Enabled'] then
			for k, v in pairs(Config['PoleDance']['Locations']) do
				if #(GetEntityCoords(PlayerPedId()) - v['Position']) <= 1.0 then
					DrawText3D(v['Position'], Strings['Pole_Dance'], 0.35)
					if IsControlJustReleased(0, 51) then
						loadAnimDict('mini@strip_club@pole_dance@pole_dance' .. v['Number'])
						local scene = NetworkCreateSynchronisedScene(v['Position'], vector3(0.0, 0.0, 0.0), 2, false, false, 1065353216, 0, 1.3)
						NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@pole_dance@pole_dance' .. v['Number'], 'pd_dance_0' .. v['Number'], 1.5, -4.0, 1, 1, 1148846080, 0)
						NetworkStartSynchronisedScene(scene)
					end
				end
			end
		end
	end
end)


DrawText3D = function(coords, text, scale)
	local onScreen,_x,_y=World3dToScreen2d(coords.x, coords.y, coords.z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 41, 41, 125)
end