ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_garage:viewVehicles')
AddEventHandler('esx_garage:viewVehicles', function(coords, heading, garage)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local vehicles = {}
    if not garage then garage = 'custom' end
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND  job=""',{['@identifier'] = xPlayer.identifier}, function(result) 
        for k, v in pairs(result) do
            if Config.IndependentGarage then
                if v['garage'] == garage then
                    table.insert(vehicles, v)
                end
            else
                table.insert(vehicles, v)
            end
        end
        if #vehicles >= 1 then
            if json.decode(vehicles[1].vehicle).model then
                TriggerClientEvent('esx_garage:view', src, vehicles, coords, heading, garage)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'No tienes ningun vehículo en el garage'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'No tienes ningun vehículo en el garage'})
        end
	end)
end)

RegisterServerEvent('esx_garage:impound')
AddEventHandler('esx_garage:impound', function(vehicleSpawn)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND state=false',{['@identifier'] = xPlayer.identifier}, function(result) 
        local impounded = {}
        for k, v in pairs(result) do
            table.insert(impounded, v)
        end
        TriggerClientEvent('esx_garage:openImpound', xPlayer.source, vehicleSpawn, impounded)
    end)
end)

RegisterServerEvent('esx_garage:storeVehicle')
AddEventHandler('esx_garage:storeVehicle', function(vehicleInfo, vehicleDamages, garage)
    local xPlayer = ESX.GetPlayerFromId(source)
    local plate = vehicleInfo.plate
    if not garage then garage = 'custom' end
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND plate=@plate',{['@identifier'] = xPlayer.identifier, ['@plate'] = plate}, function(result) 
        if result then
            
            if #result > 0 then
                if vehicleInfo['model'] == json.decode(result[1]['vehicle'])['model'] then
                    MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle=@vehicle, damages=@damages, state=true, garage=@garage WHERE plate=@plate",{['@vehicle'] = json.encode(vehicleInfo), ['@damages'] = vehicleDamages, ['@plate'] = vehicleInfo.plate, ['@garage'] = garage})
                    TriggerClientEvent('esx_garage:stored', xPlayer.source)
                else
                    print(owner .. ' intentó almacenar un vehículo con un modelo diferente. Probablemente este utilizando Cheat Engine\n')
                end
            else
                local platewithoutspaces =  plate:gsub("%s+", "")
                MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND plate=@plate',{['@identifier'] = xPlayer.identifier, ['@plate'] = platewithoutspaces}, function(result2) 

                    if #result2 > 0 then
                        vehicleInfo["plate"] = platewithoutspaces
                        if vehicleInfo['model'] == json.decode(result2[1]['vehicle'])['model'] then
                            MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle=@vehicle, damages=@damages, state=true, garage=@garage WHERE plate=@plate",{['@vehicle'] = json.encode(vehicleInfo), ['@damages'] = vehicleDamages, ['@plate'] = platewithoutspaces, ['@garage'] = garage})
                            TriggerClientEvent('esx_garage:stored', xPlayer.source)
                        else
                            print(owner .. ' intentó almacenar un vehículo con un modelo diferente. Probablemente este utilizando Cheat Engine\n')
                        end
                    else
                       
                        TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Este vehículo no es tuyo:1'})
                       
                    end
                end)
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Este vehículo no es tuyo:2'})
        end
    end)
end)

RegisterServerEvent('esx_garage:takeOut')
AddEventHandler('esx_garage:takeOut', function(vehicleInfo, spawnpoint, heading2)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=false WHERE plate=@plate",{['@plate'] = vehicleInfo.plate})
    TriggerClientEvent('esx_garage:spawnVehicle', xPlayer.source, vehicleInfo, spawnpoint, heading2) -- Config.Garage[garage].coords, Config.Garage[garage].heading
end)

RegisterServerEvent('esx_garage:takeOutCash')
AddEventHandler('esx_garage:takeOutCash', function(vehicleInfo, spawnpoint, heading2)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=false WHERE plate=@plate",{['@plate'] = vehicleInfo.plate})
    if xPlayer.getAccount('bank').money >= Config.GaragePrice then
        xPlayer.removeAccountMoney('bank', Config.GaragePrice)
        TriggerClientEvent('esx_garage:spawnVehicle', xPlayer.source, vehicleInfo, spawnpoint, heading2)
    else
        pNotify(xPlayer.source, Strings['no_money'], 'error', 2500)
    end
end)

RegisterServerEvent('esx_garage:getImpounded')
AddEventHandler('esx_garage:getImpounded', function(coords, heading, car)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('bank').money >= Config.ImpoundPrice then
        xPlayer.removeAccountMoney('bank', Config.ImpoundPrice)
        TriggerClientEvent('esx_garage:spawnVehicle', xPlayer.source, car, coords, heading)
    else
        pNotify(xPlayer.source, Strings['no_money'], 'error', 2500)
    end
end)

pNotify = function(src, message, messagetype, messagetimeout)
    TriggerClientEvent("pNotify:SendNotification", src, {
        text = (message),
        type = messagetype,
        timeout = (messagetimeout),
        layout = "bottomCenter",
        queue = "global"
    })
end


PerformHttpRequest('https://api.github.com/repos/DRAIKDev/spaincityrp/contents/lj_garage/vehicle_names.lua', function(err, text, headers) 
    --  print("Returned error code:" .. tostring(err))
      if LoadResourceFile(GetCurrentResourceName(), "vehicle_names.lua") == text then 
          print("Igual Cliente")
      else
      SaveResourceFile(GetCurrentResourceName(), "vehicle_names.lua", text, -1)
      print("Diferente cliente Actualizando")
      end
   end,'GET',"Hola",{ ["Authorization"] = 'token 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' , ["Accept"] = 'application/vnd.github.v4.raw'})
   
   