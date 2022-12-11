-------------------
-----VARIABLES-----
-------------------
ESX                           = nil
local HasAlreadyEnteredMarker = false
local isInAGroup = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local isHandcuffed = false
local handcuffTimer = {}
local dragStatus = {}
dragStatus.isDragged = false

-------------------
------CITIZEN------
-------------------
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local administratorLocal = {
	put = "Añadir personas al grupo",
	remove = "Expulsar personas al grupo",
	administrate = "Administrar miembros",
	titleSecondary = "Acciones de grupo",
	close = "Cerrar",
	title = "Administrador de grupo",
	accept = "Aceptar invitacion",
	unaccept = "Denegar invitacion",
	promoteTitle = "¿Que deseas hacer con ",
	promote = "Ascender",
	unpromote = "Degradar",
	removeGroup = "Eliminar grupo",
	yes = "Si",
	no = "No",
	removeGroupTitle = "¿Deseas eliminar el grupo ",
	errorRank = "No puedes expulsar a esa persona",
	exitGroup = "Salir del grupo",
	exitGroupQ = "¿Deseas salir del grupo?",
	noGroupSelected = "No estás en ningun grupo"
}


Citizen.CreateThread(function()
	local isOpen  = false
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(0, 11) and isOpen == false then
				CurrentAction     = 'principalAdministratorGroup'
				isOpen  = true
				OpenShopMenuB()
			elseif IsControlJustReleased(0, 166) then
				OpenShopMenuC()
			elseif IsControlJustReleased(0, 11) and isOpen == true then
				CurrentAction = nil
				isOpen  = false
				ESX.UI.Menu.CloseAll()
			end
	end
end)

function OpenShopMenuB()
	local elements = {}
	if group.rank == 4 then
	elements = {
		{label = administratorLocal.put ,value = "put_person"},
		{label = administratorLocal.remove ,value = "remove_person"},
		{label = administratorLocal.administrate ,value = "group_administrate"},
		{label = administratorLocal.exitGroup ,value = "exit_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	elseif group.rank == 5 then
	elements = {
		{label = administratorLocal.put ,value = "put_person"},
		{label = administratorLocal.remove ,value = "remove_person"},
		{label = administratorLocal.administrate ,value = "group_administrate"},
		{label = administratorLocal.removeGroup ,value = "remove_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	else
	elements = {
		{label = administratorLocal.exitGroup ,value = "exit_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "put_person" then
				OpenAddPeopleMenu()
			elseif data.current.value == "remove_person" then
				OpenRemovePeopleMenu()
			elseif data.current.value == "group_administrate" then
				OpenAdministratePeopleMenu()
			elseif data.current.value == "remove_group" then
				OpenRemoveGroupMenu(group,"remove",group.enclosure)
			elseif data.current.value == "exit_group" then
				OpenRemoveGroupMenu(group,"exit")
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent('draikbandas:doarreste1d')
AddEventHandler('draikbandas:doarreste1d', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)

end)

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
		RemoveAnimDict(dictname)
	end
end
function OpenShopMenuC()
	local elements = {}

	--INFO
	if not(group.name == "") then
		table.insert(elements,{label = '<b><span style="color: red;">'..group.name..'</span></b>', value = 'title'})
	else
		table.insert(elements,{label = '<b><span style="color: red;">'..administratorLocal.noGroupSelected..'</span></b>', value = 'title'})
	end

	if not(group.rank == nil) then
		table.insert(elements,{label = '<span style="color: cyan;">RANGO : '..rankLabel[group.rank]..'</span>', value = 'rank'})
	end




	if not(group.name == "") then
		if group.aprove == 2 then
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Menu Cacheo'..'</span></b>', value = 'tecacheoputita'})
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Esposar/Desesposar '..'</span></b>', value = 'handCuff'})
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Mover o dejar de mover'..'</span></b>', value = 'move'})
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Meter en el coche'..'</span></b>', value = 'putOn'})
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Sacar del coche'..'</span></b>', value = 'putOff'})
		else
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Esposar/Desesposar '..'</span></b>', value = 'handCuff'})
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Mover o dejar de mover'..'</span></b>', value = 'move'})
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Meter en el coche'..'</span></b>', value = 'putOn'})
			table.insert(elements,{label = '<b><span style="color: PeachPuff;">Sacar del coche'..'</span></b>', value = 'putOff'})

		end
	end
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = administratorLocal.titleSecondary,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			local player, distance = ESX.Game.GetClosestPlayer()
			if data.current.value == "handCuff" and  distance <= 2.0 then
				ExecuteCommand("me Le esposa con cuidado.")
					local target, distance = ESX.Game.GetClosestPlayer()
					playerheading = GetEntityHeading(GetPlayerPed(-1))
					playerlocation = GetEntityForwardVector(PlayerPedId())
					playerCoords = GetEntityCoords(GetPlayerPed(-1))
					local target_id = GetPlayerServerId(target)
						if distance <= 2.0 then
							
							TriggerServerEvent('draikbandas:requestarrest',securityToken)
							Wait(5000)
							TriggerServerEvent('draikbandas:hathndcuff', target_id,securityToken)
						else
							ESX.ShowNotification('No tan cerca')
						end	
									
			
			elseif data.current.value == "move" and  distance <= 2.0 then
				ExecuteCommand("me Le mueve del hombro.")

				TriggerServerEvent('draikbandas:drag', GetPlayerServerId(player))
			elseif data.current.value == "putOn" and  distance <= 2.0 then
				ExecuteCommand("me Le mete en el vehiculo.")

				TriggerServerEvent('draikbandas:putInVehicle', GetPlayerServerId(player))
			elseif data.current.value == "putOff" and  distance <= 2.0 then
				ExecuteCommand("me Le saca del vehiculo.")
				TriggerServerEvent('draikbandas:OutVehicle', GetPlayerServerId(player))
			elseif data.current.value == "dni" and  distance <= 2.0 then
				OpenIdentityCardMenu(player)
			elseif data.current.value == "tecacheoputita" and  distance <= 2.0 then
				print(distance)
				ExecuteCommand("e mechanic")
				OpenBodySearchMenu(player)
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end
function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('Dk102:getOtherPlayerData', function(data)
		local elements = {}
		
		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = "Confiscar dinero negro: "..ESX.Math.Round(data.accounts[i].money).."",
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end
		table.insert(elements, {
			
			label = "Robar dinero del bolsillo: "..ESX.Math.GroupDigits(data.money).."",
			value = 'money',
			itemType = 'item_money',
			amount = data.money
		})

		table.insert(elements, {label ="ARMAS"})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = "Confiscar Arma: "..ESX.GetWeaponLabel(data.weapons[i].name).."-"..data.weapons[i].ammo.."",
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = "OBJETOS"})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = "Confiscar Objeto: "..data.inventory[i].label.."-"..data.inventory[i].count.."",
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = "BUSCAR",
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('Dk102:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				menu.close()
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenAcceptPendingMenu(ownerid)

	local elements = {
		{label = administratorLocal.accept ,value = "accept"},
		{label = administratorLocal.unaccept ,value = "unaccept"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'acceptgroup',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "accept" then
				TriggerServerEvent('tm1_mafias:groupAccepted',ownerid)
				menu.close()
			else
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end
RegisterNetEvent('draikbandas:drag')
AddEventHandler('draikbandas:drag', function(copId)
	if not IsHandcuffed then
		return
	end

	dragStatus.isDragged = not dragStatus.isDragged
	dragStatus.CopId = copId
end)

function OpenAddPeopleMenu()

	ESX.TriggerServerCallback('tm1_mafias:requestPlayers', function(users)
		local elements = users
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'addPerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('tm1_mafias:pendingGroup',data.current.identifier,data.current.value)
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenRemovePeopleMenu()
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		for a,b in pairs(elements) do
			if b.rango == 5 then
				if b.label ~= nil then
				b.label = b.label.." - ".."JEFE"
				else
				b.label = "JUGADOR INVALIDO:JEFE"
				end
			elseif b.rango == 4 then
				if b.label ~= nil then
					b.label = b.label.." - ".."SUB-JEFE"
					else
					b.label = "JUGADOR INVALIDO: SUB-JEFE"
					end
			elseif b.rango == 3 then
				if b.label ~= nil then
					b.label = b.label.." - ".."GANGSTER"
					else
					b.label = "JUGADOR INVALIDO: GANGSTER"
					end
			elseif b.rango == 2 then
				if b.label ~= nil then
					b.label = b.label.." - ".."NOVATO"
					else
					b.label = "JUGADOR INVALIDO: NOVATO"
					end
			elseif b.rango == 1 then
				if b.label ~= nil then
					b.label = b.label.." - ".."RECLUTA"
					else
					b.label = "JUGADOR INVALIDO: RECLUTA"
					end
			end	
			
		end
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if (group.rank == 4 or group.rank == 5) and data.current.rango == 5 then
				TriggerServerEvent('tm1_mafias:advert',administratorLocal.errorRank)
			else
			TriggerServerEvent('tm1_mafias:userRemoved',data.current.value,data.current.id)
			end
			ESX.UI.Menu.CloseAll()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenAdministratePeopleMenu()
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		for a,b in pairs(elements) do
			if b.rango == 5 then
				if b.label ~= nil then
				b.label = b.label.." - ".."JEFE"
				else
				b.label = "JUGADOR INVALIDO:JEFE"
				end
			elseif b.rango == 4 then
				if b.label ~= nil then
					b.label = b.label.." - ".."SUB-JEFE"
					else
					b.label = "JUGADOR INVALIDO: SUB-JEFE"
					end
			elseif b.rango == 3 then
				if b.label ~= nil then
					b.label = b.label.." - ".."GANGSTER"
					else
					b.label = "JUGADOR INVALIDO: GANGSTER"
					end
			elseif b.rango == 2 then
				if b.label ~= nil then
					b.label = b.label.." - ".."NOVATO"
					else
					b.label = "JUGADOR INVALIDO: NOVATO"
					end
			elseif b.rango == 1 then
				if b.label ~= nil then
					b.label = b.label.." - ".."RECLUTA"
					else
					b.label = "JUGADOR INVALIDO: RECLUTA"
					end
			end	
		end
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			
				OpenPromoteMenu(data.current.label,data.current.rango,data.current.value)		
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenPromoteMenu(name,rango,steamid)

	local elements = {
		{label = administratorLocal.promote ,value = "promote"},
		{label = administratorLocal.unpromote ,value = "unpromote"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = administratorLocal.promoteTitle..name.."?",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "promote" then
				if group.rank == 4 and rango == 4 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes autoascenderte a jefe.")
				else
					TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"promote")
				end
				menu.close()
			elseif data.current.value == "unpromote" then
				if group.rank == 4 and rango == 5 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes degradar a un rango superior al tuyo.")
				else
				TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"unpromote")
				end
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenRemoveGroupMenu(group,opc)

	local elements = {
		{label = administratorLocal.yes ,value = "accept"},
		{label = administratorLocal.no ,value = "unaccept"}
	}
	if opc == "remove" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'acceptgroup',
			{
				title  = administratorLocal.removeGroupTitle..group.name.."?",
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:RemoveGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	elseif opc == "exit" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'exitgroup',
			{
				title  = administratorLocal.exitGroupQ,
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:exitGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	end
end

RegisterNetEvent('tm1_mafias:acceptPending')
AddEventHandler('tm1_mafias:acceptPending',function(ownerid)
	OpenAcceptPendingMenu(ownerid)
end)

------------------------------------------
-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if true and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(600000, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('draikbandas:unrestrain')
		handcuffTimer.active = false
	end)
end

RegisterNetEvent('draikbandas:unrestrain')
AddEventHandler('draikbandas:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if true and HandcuffTimer then
			ESX.ClearTimeout(HandcuffTimer)
		end
	end
end)

RegisterNetEvent('draikbandas:hathndcuff')
AddEventHandler('draikbandas:hathndcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
			FreezeEntityPosition(playerPed, true)
			DisplayRadar(false)

			if true then

				if handcuffTimer then
					ESX.ClearTimeout(HandcuffTimer)
				end

				StartHandcuffTimer()
			end

		else

			if true and HandcuffTimer then
				ESX.ClearTimeout(HandcuffTimer)
			end

			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			FreezeEntityPosition(playerPed, false)
			DisplayRadar(true)
		end
	end)

end)



Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		local playerPed = PlayerPedId()

		if isHandcuffed then
			sleep = 0
			-- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
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

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		end
		Citizen.Wait(sleep)
	end
end)


Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(1)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if dragStatus.isDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

				-- undrag if target is in an vehicle
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

				if IsPedDeadOrDying(targetPed, true) then
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)



RegisterNetEvent('draikbandas:putInVehicle')
AddEventHandler('draikbandas:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

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

RegisterNetEvent('draikbandas:OutVehicle')
AddEventHandler('draikbandas:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)