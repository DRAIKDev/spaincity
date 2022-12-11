
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('dktatus:quitar1')
AddEventHandler('dktatus:quitar1', function()
	local _source  = source
	local steamhex = GetPlayerIdentifier(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.GetMoney then
		if xPlayer.getMoney() >= 60000 then
		xPlayer.removeMoney(60000)
		MySQL.Sync.execute('UPDATE users SET tattoos=@nup WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier ,['@nup'] = NULL}) 
		xPlayer.showNotification("Ya esta hecho, cierra ojos^^")
		--DropPlayer(source, "Borrado correctamente.")

		else 
		xPlayer.showNotification("No tienes un duro encima, hacen falta 60.000€")
		end
	else
		MySQL.Sync.execute('UPDATE users SET tattoos=@nup WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier ,['@nup'] = NULL}) 
		xPlayer.showNotification("Ya esta hecho, cierra ojos^^")
	--	DropPlayer(source, "Borrado correctamente.")

	end


end)
