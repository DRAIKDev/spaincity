ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('DAJDK193:viewVehicles')
AddEventHandler('DAJDK193:viewVehicles', function(coords, heading, garage)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local vehicles = {}

    if not garage then garage = 'custom' end
    MySQL.Async.fetchAll('SELECT * FROM owned_aircrafts WHERE owner=@identifier',{['@identifier'] = xPlayer.identifier}, function(result) 
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
                TriggerClientEvent('DAJDK193:view', src, vehicles, coords, heading)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'No tienes ningun vehículo en el garage'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'No tienes ningun vehículo en el garage'})
        end
	end)
end)

RegisterServerEvent('DAJDK193:impound')
AddEventHandler('DAJDK193:impound', function(vehicleSpawn)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM owned_aircrafts WHERE owner=@identifier AND state=false',{['@identifier'] = xPlayer.identifier}, function(result) 
        local impounded = {}
        for k, v in pairs(result) do
            table.insert(impounded, v)
        end
        TriggerClientEvent('DAJDK193:openImpound', xPlayer.source, vehicleSpawn, impounded)
    end)
end)

RegisterServerEvent('DAJDK193:storeVehicle')
AddEventHandler('DAJDK193:storeVehicle', function(vehicleInfo, vehicleDamages, garage)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not garage then garage = 'custom' end
    MySQL.Async.fetchAll('SELECT * FROM owned_aircrafts WHERE owner=@identifier AND plate=@plate',{['@identifier'] = xPlayer.identifier, ['@plate'] = vehicleInfo.plate}, function(result) 
        if result then
            if #result > 0 then
                if vehicleInfo['model'] == json.decode(result[1]['vehicle'])['model'] then
                    MySQL.Sync.execute("UPDATE owned_aircrafts SET vehicle=@vehicle, damages=@damages, state=true, garage=@garage WHERE plate=@plate",{['@vehicle'] = json.encode(vehicleInfo), ['@damages'] = vehicleDamages, ['@plate'] = vehicleInfo.plate, ['@garage'] = garage})
                    TriggerClientEvent('DAJDK193:stored', xPlayer.source)
                else
                    print(owner .. ' intentó almacenar un vehículo con un modelo diferente. Probablemente este utilizando Cheat Engine\n')
                end
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Este vehículo no es tuyo'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Este vehículo no es tuyo'})
        end
    end)
end)

RegisterServerEvent('DAJDK193:takeOut')
AddEventHandler('DAJDK193:takeOut', function(vehicleInfo, spawnpoint, heading2)
    -- print('takeout')
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Sync.execute("UPDATE owned_aircrafts SET state=false WHERE plate=@plate",{['@plate'] = vehicleInfo.plate})
    TriggerClientEvent('DAJDK193:spawnVehicle', xPlayer.source, vehicleInfo, spawnpoint, heading2) -- Config.Garage[garage].coords, Config.Garage[garage].heading
end)

RegisterServerEvent('DAJDK193:getImpounded')
AddEventHandler('DAJDK193:getImpounded', function(coords, heading, car)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= Config.ImpoundPrice then
        xPlayer.removeMoney(Config.ImpoundPrice)
        TriggerClientEvent('DAJDK193:spawnVehicle', xPlayer.source, car, coords, heading)
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