ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_caza:reward')
AddEventHandler('esx_caza:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('meat', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('meat', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('meat', 3)
    end

    xPlayer.addInventoryItem('leather', math.random(1, 4))
        
end)

RegisterServerEvent('esx_caza:sell')
AddEventHandler('esx_caza:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 350
    local LeatherPrice = 50

    local MeatQuantity = xPlayer.getInventoryItem('meat').count
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count

    if MeatQuantity > 0 or LeatherQuantity > 0 then
        xPlayer.addMoney(MeatQuantity * MeatPrice)
        xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('meat', MeatQuantity)
        xPlayer.removeInventoryItem('leather', LeatherQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Has vendido ' .. LeatherQuantity + MeatQuantity .. ' y has ganado: ' .. LeatherPrice * LeatherQuantity + MeatPrice * MeatQuantity..' €' )
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'No tienes carne y cuero para vender')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end