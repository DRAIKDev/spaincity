Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/donador',  _U('dar_donador_h'),  {{name = "ID", help = _U('id_param_h')}, {name = _U('rango_n'), help = _U('rango_h')}, {name = _U('dias_n'), help = _U('dias_h')}}  )
	TriggerEvent('chat:addSuggestion', '/autodonador',  _U('dar_auto_h'),  {{name = "ID", help = _U('id_param_h')}, {name = _U('auto_n'), help = _U('auto_h')}}  )
	TriggerEvent('chat:addSuggestion', '/casa',  _U('dar_casa_h'),  {{name = "ID", help = _U('id_param_h')}, {name = _U('casa_n'), help = _U('casa_h')}}  )
	TriggerEvent('chat:addSuggestion', '/cancelarvip',  _U('cacelar_vip_h'),  {{name = "ID", help = _U('id_param_h')}}  )
	TriggerEvent('chat:addSuggestion', '/eliminarvip',  _U('eliminar_vip_h'),  {{name = "ID", help = _U('id_param_h')}}  )
	TriggerEvent('chat:addSuggestion', '/vips',  _U('vips_h'),  {{name = _U('activos_n'), help = _U('activos_h')}}  )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/donador')
		TriggerEvent('chat:removeSuggestion', '/autodonador')
		TriggerEvent('chat:removeSuggestion', '/casa')
		TriggerEvent('chat:removeSuggestion', '/cancelarvip')
		TriggerEvent('chat:removeSuggestion', '/eliminarvip')
		TriggerEvent('chat:removeSuggestion', '/vips')
	end
end)

-- ============================================= --
ESX                           = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('rpproject:vip:giveCar')
AddEventHandler('rpproject:vip:giveCar', function(vehicleModel)

    local playerped = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerped)

    ESX.Game.SpawnVehicle(vehicleModel, coords, 270.0, function (vehicle)
        local newPlate     = exports['esx_vehicleshop']:GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        vehicleProps.plate = newPlate
        SetVehicleNumberPlateText(vehicle, newPlate)
        TriggerServerEvent('esx_vehicleshop:setVehicleOwnedth', vehicleProps)
        TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, false)
        TaskWarpPedIntoVehicle(playerped, vehicle, -1)
        --ESX.Game.DeleteVehicle(vehicle)

        ESX.ShowNotification('Le has dado un vehículo al jugador.')
    end)
end)

RegisterNetEvent('KASJ81O2JE')
AddEventHandler('KASJ81O2JE', function(vehicleModel)

    local playerped = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerped)

    ESX.Game.SpawnVehicle(vehicleModel, coords, 270.0, function (vehicle)
        local newPlate     = exports['esx_vehicleshop']:GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        vehicleProps.plate = newPlate
        SetVehicleNumberPlateText(vehicle, newPlate)
        -----------------------------SQL-----------------------------
		
		TriggerServerEvent('B128AAIUDJA', vehicleProps)
    ------------------------------------------------------------------
        TaskWarpPedIntoVehicle(playerped, vehicle, -1)
        --ESX.Game.DeleteVehicle(vehicle)

        ESX.ShowNotification('Le has dado un vehículo al jugador.')
    end)
end)


RegisterNetEvent('HDSAJ71')
AddEventHandler('HDSAJ71', function(vehicleModel)

    local playerped = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerped)

    ESX.Game.SpawnVehicle(vehicleModel, coords, 270.0, function (vehicle)
        local newPlate     = exports['esx_vehicleshop']:GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        vehicleProps.plate = newPlate
        SetVehicleNumberPlateText(vehicle, newPlate)
        -----------------------------SQL-----------------------------
		
		TriggerServerEvent('GSDH7188', vehicleProps)
    ------------------------------------------------------------------
        TaskWarpPedIntoVehicle(playerped, vehicle, -1)
        --ESX.Game.DeleteVehicle(vehicle)

        ESX.ShowNotification('Le has dado un vehículo al jugador.')
    end)
end)
