
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
RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'Abogado',
		number     = 'abogado',
		base64Icon = 'data:image/png;base64,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',
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

function dasdhajksdhahsdioad()
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
		title    = _U('abogado'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'vehicle_list' then
			local elements = {
				{label = ('BMW M6'),  value = 'm6f13abogados'},
				{label = ('BMW M5'), value = 'gxm5'},
				{label = ('Range Rover'), value = 'evoque'},
				{label = ('Bentley'), value = 'bencongt13' }
			}

		
			ESX.UI.Menu.CloseAll()

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
				title    = _U('service_vehicle'),
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
				ESX.Game.SpawnVehicle(data.current.value, Config.Zones.AbogadoActions.Opciones.SpawnPos, Config.Zones.AbogadoActions.Opciones.Heading , function(vehicle)
					local playerPed = PlayerPedId()
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				end)
				menu.close()
			end, function(data, menu)
				menu.close()
				dasdhajksdhahsdioad()
			end)

		elseif data.current.value == 'player_dressing' then
		
			ESX.TriggerServerCallback('esx_abogados:getPlayerDressing', function(dressing)
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
					ESX.TriggerServerCallback('esx_abogados:getPlayerOutfit', function(clothes)
		
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

function dasdasdasd()
	

	local elements = {
		{label = _U('billing'),       value = 'billing'}
	}


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
							TriggerServerEvent('esx_bithilling:sendBill', GetPlayerServerId(closestPlayer), 'society_abogado', "Abogado", amount)
						
						end)
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_abogados:getStockItems', function(items)
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
					TriggerServerEvent('esx_abogados:getStockItem', itemName, count)

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
	ESX.TriggerServerCallback('esx_abogados:getPlayerInventory', function(inventory)
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
					TriggerServerEvent('esx_abogados:putStockItems', itemName, count)

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
        if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'abogado') then

			for k, v in pairs(Config.Zones.AbogadoActions) do
				local me = PlayerPedId()
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
				if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
					sleep = 0
					if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
						if not IsPedInAnyVehicle(me, false) then
							ESX.ShowHelpNotification(_U('open_actions'))
							if IsControlJustReleased(0, 38) and ESX.PlayerData.job then
								dasdhajksdhahsdioad()
							end
						end
					end
				end
			end

	


			for k, v in pairs(Config.Zones.VehicleDeleter) do
				local me = PlayerPedId()
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
				if distance <= 15.0 and not IsPedDeadOrDying(me, true) then	
					if IsPedInAnyVehicle(me, false) then
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
			end

			for k,v in ipairs(Config.FastTravels) do
				local distance = GetDistanceBetweenCoords(playerCoords, v.From, true)

				if distance < 20 then
					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false
				end


				if distance < v.Marker.x then
					FastTravel(v.To.coords, v.To.heading)
				end
			end

	

		end
        Wait(sleep)
    end
end)

AddEventHandler('esx_abogadojob:teleport', function(position)
	SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
  end)

RegisterCommand("openabogadosmenu",function()
	TriggerServerEvent("sdaadsasdadsasdadadsad:djhaksjdhals")
end)

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

RegisterNetEvent("sdaadsasdadsa:IDKASJDIIOAID7898Y")
AddEventHandler("sdaadsasdadsa:IDKASJDIIOAID7898Y",function()
	dasdasdasd()
end)
RegisterKeyMapping('openabogadosmenu', 'Abrir Menu Abogado', 'keyboard', 'F6' )

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)



Citizen.CreateThread(function()

	local blipMarker = Config.Blips.Blip
	local blipCoord = AddBlipForCoord(blipMarker.Pos.x, blipMarker.Pos.y, blipMarker.Pos.z)
  
	SetBlipSprite (blipCoord, blipMarker.Sprite)
	SetBlipDisplay(blipCoord, blipMarker.Display)
	SetBlipScale  (blipCoord, blipMarker.Scale)
	SetBlipColour (blipCoord, blipMarker.Colour)
	SetBlipAsShortRange(blipCoord, true)
  
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Abogado')
	EndTextCommandSetBlipName(blipCoord)
  
  
  end)