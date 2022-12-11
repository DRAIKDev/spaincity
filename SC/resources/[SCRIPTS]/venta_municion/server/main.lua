ESX               = nil
local ItemsLabels = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('carg:buyItem')
AddEventHandler('carg:buyItem', function(itemName, price, zone,name)
	
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	local money = xPlayer.getMoney()
	if zone=="BlackWeashop" then 
		if account.money >= price then

		xPlayer.removeAccountMoney('black_money', price)
		--xPlayer.addWeapon(itemName, 42)
		TriggerClientEvent('esx:showNotification', _source, _U('buy') .. name)

		else
				TriggerClientEvent('esx:showNotification', _source, _U('not_enough_black'))
		end	

	else
		if money >= price then

		--xPlayer.addWeapon(itemName, 42)
		TriggerClientEvent('carg:doyarma',_source,itemName,price)

		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
		end
	end
end)

RegisterServerEvent('carg:pipa')
AddEventHandler('carg:pipa',function(name,price)
		local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(price)

end)