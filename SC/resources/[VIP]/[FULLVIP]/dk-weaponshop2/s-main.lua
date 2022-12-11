ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterServerCallback('dk-weaponshop2:chk_vip', function(source, cb)
	local user = GetPlayerIdentifiers(source)
	local hoy = os.date("%Y-%m-%d")
	
	local result = MySQL.Sync.fetchAll('SELECT rango FROM vip WHERE identifier = @identifier AND desde <= @hoy AND hasta >= @hoy', {
		['@identifier'] = user[1], 
		['@hoy'] = hoy
	})

	if result[1] and result[1].rango ~= 'basico' and result[1].rango ~= 'oro' then 
		cb(true)
	else
		cb(false)
	end
end)


ESX.RegisterServerCallback('dk-weaponshop2:buyWeapon', function(source, cb, weaponName,identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.Weapons[identifier].price
	if price then
		if xPlayer.hasWeapon(weaponName) then
			xPlayer.showNotification(_U('already_owned'))
			cb(false)
		else
		
			if xPlayer.getMoney() >= price then
				xPlayer.removeMoney(price)
				xPlayer.addWeapon(weaponName, 42)

				cb(true)
			else
				xPlayer.showNotification(_U('not_enough'))
				cb(false)
			end
			
		end
	else
	--ponertrigger
	end
end)
