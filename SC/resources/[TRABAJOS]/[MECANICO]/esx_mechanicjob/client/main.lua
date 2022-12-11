
local isDead, isBusy = false, false


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


function OpenMechanicActionsMenu()
	local elements = {
		{label = _U('vehicle_list'),   value = 'vehicle_list'},
		{label = _U('work_wear'),      value = 'cloakroom'},
		{label = _U('civ_wear'),       value = 'cloakroom2'},
		{label = _U('pers_wear'),      value = 'player_dressing'},
		{label = _U('deposit_stock'),  value = 'put_stock'},
		{label = _U('withdraw_stock'), value = 'get_stock'}
	}

	if Config.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_actions', {
		title    = _U('mechanic'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'vehicle_list' then
			local elements = {
				{label = _U('flat_bed'),  value = 'flatbedm2'},
				{label = _U('tow_truck'), value = 'towtruck'},
				{label = _U('tow_337flatbed'), value = '337flatbed'}
			}

			if Config.EnablePlayerManagement and ESX.PlayerData.job and (ESX.PlayerData.job.grade_name == 'Encargado' or ESX.PlayerData.job.grade_name == 'Experto' or ESX.PlayerData.job.grade_name == 'Experimentado') then
				table.insert(elements, {label = 'SlamVan', value = 'slamvan3'})
			end

			ESX.UI.Menu.CloseAll()

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
				title    = _U('service_vehicle'),
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
				ESX.Game.SpawnVehicle(data.current.value, Config.Zones[ESX.PlayerData.job.name].MechanicActions.Opciones.SpawnPos, Config.Zones[ESX.PlayerData.job.name].MechanicActions.Opciones.Heading , function(vehicle)
					local playerPed = PlayerPedId()
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				end)
				menu.close()
			end, function(data, menu)
				menu.close()
				OpenMechanicActionsMenu()
			end)

		elseif data.current.value == 'player_dressing' then
		
			ESX.TriggerServerCallback('esx_mechanicjob:getPlayerDressing', function(dressing)
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
					ESX.TriggerServerCallback('esx_mechanicjob:getPlayerOutfit', function(clothes)
		
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

		elseif data.current.value == 'cloakroom' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		elseif data.current.value == 'cloakroom2' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBosthsMenuLogs', ''..ESX.PlayerData.job.name..'', function(data, menu)
				menu.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenMobileMechanicActionsMenu()
	

	local elements = {
		{label = _U('billing'),       value = 'billing'},
		{label = _U('hijack'),        value = 'hijack_vehicle'},
		{label = _U('repair'),        value = 'fix_vehicle'},
		{label = _U('clean'),         value = 'clean_vehicle'},
		{label = _U('imp_veh'),       value = 'del_vehicle'}
	}
	if ESX.PlayerData.job and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'viceboss' or ESX.PlayerData.job.grade_name == 'encargado' or ESX.PlayerData.job.grade_name == 'experto') then
		table.insert(elements, {label = _U('comprar_coche'), value = 'comprar_coche'})
		table.insert(elements, {label = _U('vender_coche'),  value = 'vender_coche'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_mechanic_actions', {
		title    = _U(''..ESX.PlayerData.job.name..''),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if isBusy then return end

		if data.current.value == 'billing' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
				title = _U('invoice_amount')
			}, function(data, menu)
				local amount = tonumber(data.value)

				if amount == nil or amount < 0 then
					ESX.ShowNotification(_U('amount_invalid'))
				else
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification(_U('no_players_nearby'))
					else
						menu.close()
						local playerPed= GetPlayerPed(-1)
						Citizen.CreateThread(function()
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
							Citizen.Wait(5000)
							ClearPedTasks(playerPed)
							TriggerServerEvent('esx_bithilling:sendBill', GetPlayerServerId(closestPlayer), 'society_'..ESX.PlayerData.job.name..'', _U(''..ESX.PlayerData.job.name..''), amount)
						
						end)
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		elseif data.current.value == 'hijack_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(10000)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification(_U('vehicle_unlocked'))
					isBusy = false
				end)
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		elseif data.current.value == 'fix_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(20000)

					SetVehicleFixed(vehicle)
					SetVehicleDeformationFixed(vehicle)
					SetVehicleUndriveable(vehicle, false)
					SetVehicleEngineOn(vehicle, true, true)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification(_U('vehicle_repaired'))
					isBusy = false
				end)
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		elseif data.current.value == 'clean_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(10000)

					SetVehicleDirtLevel(vehicle, 0)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification(_U('vehicle_cleaned'))
					isBusy = false
				end)
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		elseif data.current.value == 'del_vehicle' then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					ESX.ShowNotification(_U('vehicle_impounded'))
					ESX.Game.DeleteVehicle(vehicle)
				else
					ESX.ShowNotification(_U('must_seat_driver'))
				end
			else
				local vehicle = ESX.Game.GetVehicleInDirection()

				if DoesEntityExist(vehicle) then
					ESX.ShowNotification(_U('vehicle_impounded'))
					ESX.Game.DeleteVehicle(vehicle)
				else
					ESX.ShowNotification(_U('must_near'))
				end
			end

		elseif data.current.value == 'comprar_coche' then
			
			local id	 = KeyboardInput("Inserte Id", "", 5)
			local precio = KeyboardInput("Inserte Precio Compra", "", 30)

			TriggerServerEvent('vender:comprarcoche', id, precio)

		elseif data.current.value == 'vender_coche' then

			local id	 = KeyboardInput("Inserte Id", "", 5)
			local precio = KeyboardInput("Inserte Precio Venta", "", 30) 
 			
			TriggerServerEvent('vender:vendercoche', id, precio)

		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "ARMARIO MECANICO",
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_mechanicjob:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_mechanicjob:putStockItems', itemName, count)

					Citizen.Wait(1000)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('esx_mechanicjob:onHijack')
AddEventHandler('esx_mechanicjob:onHijack', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		local chance = math.random(100)
		local alarm  = math.random(100)

		if DoesEntityExist(vehicle) then
			if alarm <= 33 then
				SetVehicleAlarm(vehicle, true)
				StartVehicleAlarm(vehicle)
			end

			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)

			Citizen.CreateThread(function()
				Citizen.Wait(10000)
				if chance <= 66 then
					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)
					ESX.ShowNotification(_U('veh_unlocked'))
				else
					ESX.ShowNotification(_U('hijack_failed'))
					ClearPedTasksImmediately(playerPed)
				end
			end)
		end
	end
end)

RegisterNetEvent('esx_mechanicjob:onCarokit')
AddEventHandler('esx_mechanicjob:onCarokit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_HAMMERING', 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification(_U('body_repaired'))
			end)
		end
	end
end)

RegisterNetEvent('esx_mechanicjob:onFixkit')
AddEventHandler('esx_mechanicjob:onFixkit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(20000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleUndriveable(vehicle, false)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification(_U('veh_repaired'))
			end)
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do
        local sleep = 750
        if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic01' or ESX.PlayerData.job.name == 'mechanic02') then

			for k, v in pairs(Config.Zones[ESX.PlayerData.job.name].MechanicActions) do
				for j, p in pairs(v.Pos) do
					local me = PlayerPedId()
					local playerPos = GetEntityCoords(me, true)
					local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, p.x, p.y, p.z)
					if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
						DrawMarker(v.Type, p.x, p.y, p.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
						sleep = 0
						if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
							if not IsPedInAnyVehicle(me, false) then
								ESX.ShowHelpNotification(_U('open_actions'))
								if IsControlJustReleased(0, 38) and ESX.PlayerData.job then
									OpenMechanicActionsMenu()
								end
							end
						end
					end
				end
			end

			for k, v in pairs(Config.Zones[ESX.PlayerData.job.name].editpoints) do
				local me = PlayerPedId()
				local invehicle = IsPedInAnyVehicle(me)
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.x, v.y, v.z)
				if distance <= 15.0 and invehicle and not IsPedDeadOrDying(me, true) then	
					DrawMarker(0, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,  0.3, 0.3, 0.3, 251, 228, 188, 100, false, true, 2, true, nil, nil, false)
					sleep = 0
					if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
						if  IsPedInAnyVehicle(me, false) then
							ESX.ShowHelpNotification(_U('open_tuner_menu'))
							if IsControlJustReleased(0, 38) and ESX.PlayerData.job then
								TriggerServerEvent("fiuytrhgy:dtreytdtydtchj")
							end
						end
					end
				end
			end

			for k, v in pairs(Config.Zones[ESX.PlayerData.job.name].VehicleDeleter) do
				local me = PlayerPedId()
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
				if distance <= 15.0 and not IsPedDeadOrDying(me, true) then	
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
					sleep = 0
					if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
						if IsPedInAnyVehicle(me, false) then
							ESX.ShowHelpNotification(_U('veh_stored'))
							if IsControlJustReleased(0, 38) and ESX.PlayerData.job then
								local vehicle = GetVehiclePedIsIn(me,  false)
								ESX.Game.DeleteVehicle(vehicle)
							end
						end
					end
				end
			end

			for k, v in pairs(Config.Zones[ESX.PlayerData.job.name].MenuGarage) do
				local me = PlayerPedId()
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
				if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
					sleep = 0
					if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
						if not IsPedInAnyVehicle(me, false) then
							ESX.ShowHelpNotification(_U('open_actions_garage'))
							if IsControlJustReleased(0, 38) and ESX.PlayerData.job then
								TriggerServerEvent('esx_mechanicjob:viewVehicles', v.SpawnPos, v.Heading, k)
							end
						end
					end
				end
			end

		end
        Wait(sleep)
    end
end)

RegisterCommand("openmechanicmenu",function()
	TriggerServerEvent("hdkasjdjahskj:djhaksjdhals")
end)

RegisterNetEvent("JHDAKSHDADHJA:IDKASJDIIOAID7898Y")
AddEventHandler("JHDAKSHDADHJA:IDKASJDIIOAID7898Y",function()
	OpenMobileMechanicActionsMenu()
end)
RegisterKeyMapping('openmechanicmenu', 'Abrir Menu Mecanicos', 'keyboard', 'F6' )

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	-- TextEntry		-->	The Text above the typing field in the black square
	-- ExampleText		-->	An Example Text, what it should say in the typing field
	-- MaxStringLenght	-->	Maximum String Lenght

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

RegisterNetEvent('esx_mechanicjob:view')
AddEventHandler('esx_mechanicjob:view', function(vehicles, coords, heading)
    SetFollowPedCamViewMode(2)
    local firstVehicle = vehicles[1]

    local timer = GetGameTimer() + 1500 
    
    ESX.UI.Menu.CloseAll()
    local elements = {}
    for i = 1, #vehicles do

        table.insert(elements, {label = ('%s - %s'):format(GetLabelText(GetDisplayNameFromVehicleModel(json.decode(vehicles[i].vehicle).model)), vehicles[i].plate), value = i})
       
    end

    local openMenu = function()
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'vehicles',
        {
            title = 'Garage',
            align = 'right',
            elements = elements
        },
        function(data, menu)
            local i = data.current.value
            
                ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'take_out',
                {
                    title = ("¿Deseas sacar %s?"):format(data.current.label),
                    align = 'right',
                    elements = {{label = _U('yes'), value = 'y', vehicle = vehicles[i]}, {label = _U('no'), value = 'n'}}
                },
                function(data2, menu2)
                    if data2.current.value == 'y' then
                        -- open = false
                        DoScreenFadeOut(450) 
                        ESX.UI.Menu.CloseAll()
                        Wait(500) 
                        TriggerServerEvent('esx_mechanicjob:takeOut', data2.current.vehicle, coords, heading)
                        Wait(500)
                        DoScreenFadeIn(450) 
                    else
                        menu2.close()
                    end
                end, 
                    function(data2, menu2)
                    menu2.close()
                end)

        end,
            function(data, menu)
            menu.close()
        end)
    end
    DoScreenFadeIn(1500)
    openMenu()
    while open do
        Wait(0)
        SetVehicleEngineOn(vehicle, false, true)
        
        DisableControlAction(0, 75, true)
        DisableControlAction(27, 75, true)
        if not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'vehicles') and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'take_out') then
            openMenu()
        end
    end
    DeleteVehicle(vehicle)
    SetEntityVisible(PlayerPedId(), true, false)
    
end)

RegisterNetEvent('esx_mechanicjob:spawnVehicle')
AddEventHandler('esx_mechanicjob:spawnVehicle', function(info, coords, heading)
    SetEntityVisible(PlayerPedId(), true, false)
    local model = json.decode(info.vehicle).model
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local car = CreateVehicle(model, coords.x, coords.y, coords.z , heading, true, false)
	exports.renzu_customs:SetVehicleProp(car, json.decode(info.vehicle))


    SetEntityAsMissionEntity(car, true, false)
    SetVehicleHasBeenOwnedByPlayer(car, true)
    SetVehicleNeedsToBeHotwired(car, false)
    SetModelAsNoLongerNeeded(model)

    SetVehRadioStation(car, 'OFF')
    TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
end)



local oferta = nil




RegisterNetEvent('vender:compruebocoche') -- El que lo vende
AddEventHandler('vender:compruebocoche',function(id,precio)

	local coords1 = GetEntityCoords(GetPlayerPed(PlayerId()))

	local coords2 = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(id)))
	print(GetDistanceBetweenCoords(coords1,coords2))
	if GetDistanceBetweenCoords(coords1,coords2) < 10 then
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 	
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			local matr =  GetVehicleNumberPlateText(vehicle)
	
			TriggerServerEvent('vender:esmicoche',matr,id,precio,vehicle,GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))	
		
		else
			TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Debes estar subido al coche que quieres vender")
		end
	else
		TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Demasiado lejos del jugador")
	end
	
end)

RegisterNetEvent('vender:compruebococheCompra') -- El que lo vende
AddEventHandler('vender:compruebococheCompra',function(id,precio)

	local coords1 = GetEntityCoords(GetPlayerPed(PlayerId()))

	local coords2 = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(id)))
	print(GetDistanceBetweenCoords(coords1,coords2))

	if GetDistanceBetweenCoords(coords1,coords2) < 10 then
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 	
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			local matr =  GetVehicleNumberPlateText(vehicle)
				TriggerServerEvent('vender:esmicocheCompra',matr,id,precio,vehicle,GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))	
		else
			TriggerEvent('chatMessage',"Comprador", {255, 0, 0}, "Debes estar subido al coche que quieres comprar")
		end
	else
		TriggerEvent('chatMessage',"Comprador", {255, 0, 0}, "Demasiado lejos del jugador")
	end
end)

RegisterNetEvent('vender:esmicochecallback')
AddEventHandler('vender:esmicochecallback',function(var,id,precio,matr,car,name)

	if var == true then
		TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Esperando a la respuesta del comprador...")
		TriggerServerEvent('vender:vendococheser', id, precio, matr, car, name)
	else
		TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Este coche no es tuyo")

	end

end)

RegisterNetEvent('vender:esmicochecallbackCompra')
AddEventHandler('vender:esmicochecallbackCompra',function(var,id,precio,matr,car,name)

	if var == true then
		TriggerEvent('chatMessage',"Comprador", {255, 0, 0}, "Esperando a la respuesta del Vendedor...")
		TriggerServerEvent('vender:vendococheserCompra', id, precio, matr, car, name)
	else
		TriggerEvent('chatMessage',"Comprador", {255, 0, 0}, "Este coche no es del Vendedor")

	end

end)

RegisterNetEvent('vender:vendocoche') --El que recibe la oferta
AddEventHandler('vender:vendocoche',function(price,jugador,matr,vehicle,name)

	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"La ID("..jugador..") te quiere vender su ^2 "..name.."^0 por ^2 "..price.." $")
	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"^2 TECLA 1 ^0 para ACEPTAR o ^2 TECLA 2 ^0 para rechazar la oferta")
	oferta = true
	Citizen.CreateThread(function()
		while oferta do
				if IsControlJustPressed(1, 157) then -- 1 = YES
					TriggerServerEvent('vender:handleroferta',true,jugador,matr,price,name)
					oferta = false
				end
				if IsControlJustPressed(1, 158) then -- 2 = NO
					TriggerServerEvent('vender:handleroferta',false,jugador,matr,price,name)
					oferta = false
				end
			Citizen.Wait(0)
		end
	end)
end)

RegisterNetEvent('vender:vendococheCompra') --El que recibe la oferta
AddEventHandler('vender:vendococheCompra',function(price,jugador,matr,vehicle,name)

	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"La ID("..jugador..") te quiere comprar tu ^2 "..name.."^0 por ^2 "..price.." $")
	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"^2 TECLA 1 ^0 para ACEPTAR o ^2 TECLA 2 ^0 para rechazar la oferta")
	oferta = true
	Citizen.CreateThread(function()
		while oferta do
				if IsControlJustPressed(1, 157) then -- 1 = YES
					TriggerServerEvent('vender:handlerofertaCompra', true, jugador, matr, price, name)
					oferta = false
				end
				if IsControlJustPressed(1, 158) then -- 2 = NO
					TriggerServerEvent('vender:handlerofertaCompra', false, jugador, matr, price, name)
					oferta = false
				end
			Citizen.Wait(0)
		end
	end)


end)

