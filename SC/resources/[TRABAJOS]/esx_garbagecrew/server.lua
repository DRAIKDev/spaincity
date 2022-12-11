ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterNetEvent('ndrp-garbage:pay')
AddEventHandler('ndrp-garbage:pay', function(jobStatus,money)
    local _source = source
    local _money = money
    local xPlayer = ESX.GetPlayerFromId(_source)
    if jobStatus and xPlayer.job.name == "garbage" then
        if xPlayer ~= nil then
            if money < 451 then 
            xPlayer.addMoney(money)
            else
                TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Basureros 1.1")
            end

        end
    else
        TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Basureros 1")
    end
end)


RegisterNetEvent('ndrp-garbage:reward')
AddEventHandler('ndrp-garbage:reward', function(item,rewardStatus)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if rewardStatus then
        if item == 'bread' or item == 'water' then 
        if xPlayer ~= nil then
            if xPlayer.canCarryItem(item,1) then
                xPlayer.addInventoryItem(item,1)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Has encontrado ' ..item})
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = ' '.. item .. ' encontrado pero no se puede llevar'})
            end
        end
        else
            TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Basureros 2.1")
        end
    else
        TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Basureros 2")
     end
end)