ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('inside-fruitpicker:checkMoney', function(playerId, cb)
	local xPlayer = ESX.GetPlayerFromId(playerId)
    local name = ESX.GetPlayerFromId(playerId)

	if xPlayer.getMoney() >= Config.DepositPrice then
        xPlayer.removeMoney(Config.DepositPrice)
		cb(true)
    elseif xPlayer.getAccount('bank').money >= Config.DepositPrice then
        xPlayer.removeAccountMoney('bank', Config.DepositPrice)
        cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('inside-fruitpicker:depositBack')
AddEventHandler('inside-fruitpicker:depositBack', function(token)
	local xPlayer = ESX.GetPlayerFromId(source)
	local Payout = Config.DepositPrice
	local _source = source
	local resource = GetCurrentResourceName()

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_source,resource)
	end
	xPlayer.addAccountMoney('bank', Config.DepositPrice)
end)

RegisterServerEvent('inside-fruitpicker:Payout')
AddEventHandler('inside-fruitpicker:Payout', function(arg,token)	
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	local resource = GetCurrentResourceName()

	local Payout = Config.Payout * tonumber(arg)
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_source,resource)
	end
	xPlayer.addMoney(Payout)
end)