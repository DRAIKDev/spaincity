-----[ CODE, DON'T TOUCH THIS ]-------------------------------------------
RegisterServerEvent('pa:getPlayerIdentifiers')
AddEventHandler('pa:getPlayerIdentifiers', function()
    if GetPlayerIdentifiers(source) ~= nil then
        TriggerClientEvent('pa:setPlayerIdentifiers', source, GetPlayerIdentifiers(source))
    end
end)
--------------------------------------------------------------------------