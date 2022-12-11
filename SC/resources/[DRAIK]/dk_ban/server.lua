ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterServerEvent("sc:server:identifiers")
AddEventHandler("sc:server:identifiers", function(data)
local xplayer = ESX.GetPlayerFromId(source)
PerformHttpRequest("51.178.193.225:2500/apiv2/postmyipinjson", function(err, text, headers) 
end, 'POST',json.encode({['licencia'] = xplayer.identifier,['ip'] = data.ip}),{['Content-Type'] = 'application/json'})
end)
