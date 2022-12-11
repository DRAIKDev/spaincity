ESX = nil
TriggerEvent("esx:getSharedObject", function(esx) ESX = esx end)

RegisterNetEvent("rcore_arcade:buyTicket")
AddEventHandler("rcore_arcade:buyTicket", function(source,ticket)
    if ESX then
        local player = source 
        print("Player "..player.."")
        local data = Config.ticketPrice[ticket]
        local xPlayer = ESX.GetPlayerFromId(player);
        local moneyPlayer = xPlayer.getMoney();

        TriggerClientEvent("rcore_arcade:ticketResult", player, ticket);
        TriggerClientEvent("rcore_arcade:ticketResult", player, _U("gold"));
    end
end)


ESX.RegisterUsableItem('ticketoro', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local _scr = source
    xPlayer.removeInventoryItem("ticketoro", 1)
    TriggerEvent("rcore_arcade:buyTicket",_scr, 3)
end)

ESX.RegisterUsableItem('ticketplata', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local _scr = source
    xPlayer.removeInventoryItem("ticketplata", 1)
    TriggerEvent("rcore_arcade:buyTicket",_scr, 2)
end)

ESX.RegisterUsableItem('ticketbronce', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local _scr = source
    xPlayer.removeInventoryItem("ticketbronce", 1)
    TriggerEvent("rcore_arcade:buyTicket",_scr, 1)       
end)