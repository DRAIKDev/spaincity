ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("checkradio")
AddEventHandler("checkradio", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local item_radio = xPlayer.getInventoryItem('radio').count
        if item_radio > 0 then
            xPlayer.triggerEvent("doeshaveradio")
        else
            xPlayer.triggerEvent("doesnthaveradio")
        end
    end
end) 
