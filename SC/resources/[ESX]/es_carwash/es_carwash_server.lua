ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
enableprice = true -- true = carwash is paid, false = carwash is free

price = 20 -- you may edit this to your liking. if "enableprice = false" ignore this one

--DO-NOT-EDIT-BELLOW-THIS-LINE--

RegisterServerEvent('es_carwash:checkmoney')
AddEventHandler('es_carwash:checkmoney', function ()
	if enableprice == true then
		local xPlayer = ESX.GetPlayerFromId(source)
		userMoney = xPlayer.getMoney()
		if userMoney >= price then
			xPlayer.removeMoney(price)
			TriggerClientEvent('es_carwash:success', source, price)
		else
			moneyleft = price - userMoney
			TriggerClientEvent('es_carwash:notenoughmoney', source, moneyleft)
		end
	else
		TriggerClientEvent('es_carwash:free', source)
	end
end)
