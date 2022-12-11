ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


--[[ ***** EVENTS GUI ***** ]]
RegisterServerEvent("chaini_test:kick")
AddEventHandler("chaini_test:kick", function()
    print('kick')
    DropPlayer(source, "No has pasado el test, por lo que has sido kickeado. Leete las normas en www.spaincity.es. ")
end)

RegisterServerEvent("chaini_test:success")
AddEventHandler("chaini_test:success", function(steamID)
    local _source = source
   -- local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute("UPDATE users SET tutorial=1 WHERE identifier = @username", { ['@username'] = steamID})

end)

RegisterServerEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(source,xPlayer)
    local _source = source
--    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer then
        local result = MySQL.Sync.fetchAll("SELECT tutorial FROM users WHERE identifier = @username",{['@username'] = xPlayer.identifier})
        if result and result[1] ~= nil then

            if result[1].tutorial == 0  then
                TriggerClientEvent('chaini_test:notMade',source, xPlayer.identifier)
            end
        end
    end
end)

--[[
RegisterServerEvent('chaini_test:hagoTestTrasRegister')
AddEventHandler('chaini_test:hagoTestTrasRegister',function()
    local source = source
    local player = ESX.GetPlayerFromId(source)
        local result = MySQL.Sync.fetchAll("SELECT tutorial FROM users WHERE identifier = @username",{['@username'] = player.identifier})
        if result and result[1] ~= nil then

            if (result[1].tutorial == false or result[1].tutorial == 0) then
                TriggerClientEvent('chaini_test:notMade',source)
            end
        end

end)]]

