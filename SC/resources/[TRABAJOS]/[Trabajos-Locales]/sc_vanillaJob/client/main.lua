local PlayerData = {}
local js_isInJob = false
local js_Job_Name = nil

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    if job ~= nil then
        if job.name == 'vanilla' then
            js_isInJob = true
            js_Job_Name = job.name
        else
            js_isInJob = false
        end
    end
end)

function SetVehicleMaxMods(vehicle)

  local props = {
    modEngine       = 0,
    modBrakes       = 0,
    modTransmission = 0,
    modSuspension   = 0,
    modTurbo        = false,
  }

  ESX.Game.SetVehicleProperties(vehicle, props)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

function OpenCloakroomMenu()
	local playerPed = PlayerPedId()

	local elements = {
		{label = ('Armario de Ropa personal'), value = 'player_dressing'}
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		

		if data.current.value == 'player_dressing' then
		
			ESX.TriggerServerCallback('esx_vanillajob:getPlayerDressing', function(dressing)
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
	
					ESX.TriggerServerCallback('esx_vanillajob:getPlayerOutfit', function(clothes)
	
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
	
		if data.current.value == 'freemode_ped' then
			local modelHash

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)
					SetPedDefaultComponentVariation(PlayerPedId())

					TriggerEvent('esx:restoreLoadout')
				end)
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenVaultMenu()

  if Config.EnableVaultManagement then

    local elements = {
      {label = _U('get_object'), value = 'get_stock'},
      {label = _U('put_object'), value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = _U('vault'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu()
        end

        if data.current.value == 'put_stock' then
           OpenPutStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()
      end
    )

  end

end

function OpenVehicleSpawnerMenu()

  local vehicles = Config.Zones.Vehicles.Opciones

  ESX.UI.Menu.CloseAll()

 

    local elements = {}

    for i=1, #Config.AuthorizedVehicles, 1 do
      local vehicle = Config.AuthorizedVehicles[i]
      table.insert(elements, {label = vehicle.label, value = vehicle.name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vehicle_spawner',
      {
        title    = _U('vehicle_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        local model = data.current.value

        local vehicle = GetClosestVehicle(vehicles.SpawnPoint.x,  vehicles.SpawnPoint.y,  vehicles.SpawnPoint.z,  3.0,  0,  71)

        if not DoesEntityExist(vehicle) then

          local playerPed = GetPlayerPed(-1)

          if Config.MaxInService == -1 then

            ESX.Game.SpawnVehicle(model, {
              x = vehicles.SpawnPoint.x,
              y = vehicles.SpawnPoint.y,
              z = vehicles.SpawnPoint.z
            }, vehicles.Heading, function(vehicle)
              SetVehicleMaxMods(vehicle)
              SetVehicleDirtLevel(vehicle, 0)
            end)

          else

            ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

              if canTakeService then

                ESX.Game.SpawnVehicle(model, {
                  x = vehicles[partNum].SpawnPoint.x,
                  y = vehicles[partNum].SpawnPoint.y,
                  z = vehicles[partNum].SpawnPoint.z
                }, vehicles[partNum].Heading, function(vehicle)
                  SetVehicleMaxMods(vehicle)
                  SetVehicleDirtLevel(vehicle, 0)
                end)

              else
                ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)
              end

            end, 'etat')

          end

        else
          ESX.ShowNotification(_U('vehicle_out'))
        end

      end,
      function(data, menu)

        menu.close()
      end
    )

  

end

function OpenSocietyActionsMenu()

  local elements = {}

  table.insert(elements, {label = _U('billing'),    value = 'billing'})
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vanilla_actions',
    {
      title    = _U('vanilla'),
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'billing' then
        OpenBillingMenu()
      end
    end,
    function(data, menu)

      menu.close()

    end
  )

end

function OpenBillingMenu()

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'billing',
    {
      title = _U('billing_amount')
    },
    function(data, menu)
    
      local amount = tonumber(data.value)
      local player, distance = ESX.Game.GetClosestPlayer()

      if player ~= -1 and distance <= 3.0 then

        menu.close()
        if amount == nil then
            ESX.ShowNotification(_U('amount_invalid'))
        else
            TriggerServerEvent('esx_bithilling:sendBill', GetPlayerServerId(player), 'society_vanilla', _U('billing'), amount)
        end

      else
        ESX.ShowNotification(_U('no_players_nearby'))
      end

    end,
    function(data, menu)
        menu.close()
    end
  )
end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_vanillajob:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('vanilla_stock'),
        align    = 'top-left',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_vanillajob:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

    ESX.TriggerServerCallback('esx_vanillajob:getPlayerInventory', function(inventory)
        local elements = {}

        for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {
          label = item.label .. ' x' .. item.count,
          type = 'item_standard',
          value = item.name})
      end

        end

        ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',{
        title    = _U('inventory'),
        align    = 'top-left',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_vanillajob:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
        )

      end)

end

Citizen.CreateThread(function()
    local blipMarker = Config.Blips.Blip
    local blipCoord = AddBlipForCoord(blipMarker.Pos.x, blipMarker.Pos.y, blipMarker.Pos.z)

    SetBlipSprite (blipCoord, blipMarker.Sprite)
    SetBlipDisplay(blipCoord, blipMarker.Display)
    SetBlipScale  (blipCoord, blipMarker.Scale)
    SetBlipColour (blipCoord, blipMarker.Colour)
    SetBlipAsShortRange(blipCoord, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blips.Blip.Name)
    EndTextCommandSetBlipName(blipCoord)
end)

Citizen.CreateThread(function()
    while true do
      local sleep = 750
  
      if js_isInJob and js_Job_Name == 'vanilla' then
			  for k, v in pairs(Config.Zones.Cloakrooms) do
			  	local me = PlayerPedId()
			  	local playerPos = GetEntityCoords(me, true)
			  	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			  	if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  		DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  		sleep = 0
			  		if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  			if not IsPedInAnyVehicle(me, false) then
			  				ESX.ShowHelpNotification(_U('open_cloackroom'))
			  				if IsControlJustReleased(0, 38) and js_isInJob then
			  					OpenCloakroomMenu()
			  				end
			  			end
			  		end
			  	end
			  end
      
			  for k, v in pairs(Config.Zones.Vaults) do
			  	local me = PlayerPedId()
			  	local playerPos = GetEntityCoords(me, true)
			  	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			  	if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  		DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  		sleep = 0
			  		if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  			if not IsPedInAnyVehicle(me, false) then
			  				ESX.ShowHelpNotification(_U('open_vault'))
			  				if IsControlJustReleased(0, 38) and js_isInJob then
			  					OpenVaultMenu()
			  				end
			  			end
			  		end
			  	end
			  end
      
        for k, v in pairs(Config.Zones.Vaults) do
          for j, p in pairs(v.Pos) do
			  	  local me = PlayerPedId()
			  	  local playerPos = GetEntityCoords(me, true)
			  	  local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, p.x, p.y, p.z)
			  	  if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  	  	DrawMarker(v.Type, p.x, p.y, p.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  	  	sleep = 0
			  	  	if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  	  		if not IsPedInAnyVehicle(me, false) then
			  	  			ESX.ShowHelpNotification(_U('open_vault'))
			  	  			if IsControlJustReleased(0, 38) and js_isInJob then
			  	  				OpenVaultMenu()
			  	  			end
			  	  		end
			  	  	end
			  	  end
          end
			  end
      
        for k, v in pairs(Config.Zones.VehicleDeleters) do
			  	local me = PlayerPedId()
			  	local playerPos = GetEntityCoords(me, true)
			  	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			  	if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  		DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  		sleep = 0
			  		if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  			if IsPedInAnyVehicle(me, false) then
			  				ESX.ShowHelpNotification(_U('store_vehicle'))
			  				if IsControlJustReleased(0, 38) and js_isInJob then
			  					local vehicle = GetVehiclePedIsIn(me,  false)
			  					ESX.Game.DeleteVehicle(vehicle)
			  				end
			  			end
			  		end
			  	end
			  end
      
        for k, v in pairs(Config.Zones.BossActions) do
			  	local me = PlayerPedId()
			  	local playerPos = GetEntityCoords(me, true)
			  	local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
			  	if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
			  		DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
			  		sleep = 0
			  		if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
			  			if not IsPedInAnyVehicle(me, false) then
			  				ESX.ShowHelpNotification(_U('open_bossmenu'))
			  				if IsControlJustReleased(0, 38) and js_isInJob then
			  					ESX.UI.Menu.CloseAll()
			  		      TriggerEvent('esx_society:openBosthsMenu', 'vanilla', function(data, menu)
			  		  	    menu.close()
                  end, { wash = false })
			  				end
			  			end
			  		end
			  	end
			  end
      end
      Wait(sleep)
    end
end)


RegisterCommand("openvanillamenu",function()
	TriggerServerEvent("yueqweuytrquwyteruy_vanilla:eyrtqwyterqywreuytrqwuyte_vanilla")
end)

RegisterNetEvent("wtuqtwiuyqtwutqiuw_vanilla:rwytqrwuyrquywruyqt_vanilla")
AddEventHandler("wtuqtwiuyqtwutqiuw_vanilla:rwytqrwuyrquywruyqt_vanilla",function()
	OpenSocietyActionsMenu()
end)

RegisterKeyMapping('openvanillamenu', 'Abrir Menu vanilla', 'keyboard', 'F6' )

AddEventHandler('onResourceStart', function (resourceName)
	if(GetCurrentResourceName() == resourceName)  then
		TriggerServerEvent("ruyfwuytruyrfwyeruy_vanilla:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_vanilla")
	end
end)

AddEventHandler('esx:playerLoaded', function ()
	TriggerServerEvent("ruyfwuytruyrfwyeruy_vanilla:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_vanilla")
end)

RegisterNetEvent("feuytqwreuyfrquwyterqy_vanilla:gsfcudyafsuydruyas_vanilla")
AddEventHandler("feuytqwreuyfrquwyterqy_vanilla:gsfcudyafsuydruyas_vanilla",function(boolean, job)
	js_isInJob = boolean
	js_Job_Name = job.name
end)


