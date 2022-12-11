
ESX = nil
local playersHealing = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('anim:revivirfastsv')
AddEventHandler('anim:revivirfastsv', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	--print ("Prueba1")
    -- TriggerClientEvent('anim:revivirfast', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('anim:medicorevivirfast', _source)
end)

RegisterServerEvent('esx_ambulancejob:rethivive')
AddEventHandler('esx_ambulancejob:rethivive', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		xPlayer.addMoney(Config.ReviveReward)
		TriggerClientEvent('esx_ambulancejob:rethivive', target)	
	else
        TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source)
	end
end)

RegisterServerEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:heal', target, type)
	else
		print(('esx_ambulancejob: %s attempted to heal!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:putInVehicle', target)
	else
		print(('esx_ambulancejob: %s attempted to put in vehicle!'):format(xPlayer.identifier))
	end
end)

TriggerEvent('esx_phone:registerNumber', 'ambulance', _U('alert_ambulance'), true, true)

TriggerEvent('esx_society:registerSociety', 'ambulance', 'Ambulance', 'society_ambulance', 'society_ambulance', 'society_ambulance', {type = 'public'})


ESX.RegisterServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if Config.RemoveCashAfterRPDeath then
		if xPlayer.getMoney() > 0 then
			xPlayer.removeMoney(xPlayer.getMoney())
		end

		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.setAccountMoney('black_money', 0)
		end
	end
	if Config.RemoveItemsAfterRPDeath then
		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
	end
	local playerLoadout = {}
	if Config.RemoveWeaponsAfterRPDeath then
		for i=1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	else -- save weapons & restore em' since spawnmanager removes them
		for i=1, #xPlayer.loadout, 1 do
			table.insert(playerLoadout, xPlayer.loadout[i])
		end
		-- give back wepaons after a couple of seconds
		Citizen.CreateThread(function()
			Citizen.Wait(5000)
			for i=1, #playerLoadout, 1 do
				if playerLoadout[i].label ~= nil then
					xPlayer.addWeapon(playerLoadout[i].name, playerLoadout[i].ammo)
				end
			end
		end)
	end
	cb()
end)

RegisterServerEvent('esx_ambulancejob:recuperacion')
AddEventHandler('esx_ambulancejob:recuperacion', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(1000)

end)

if Config.EarlyRespawnFine then
	ESX.RegisterServerCallback('esx_ambulancejob:checkBalance', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		local bankBalance = xPlayer.getAccount('bank').money

		cb(bankBalance >= Config.EarlyRespawnFineAmount)
	end)

	RegisterServerEvent('esx_ambulancejob:payFine')
	AddEventHandler('esx_ambulancejob:payFine', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		local fineAmount = Config.EarlyRespawnFineAmount
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('respawn_bleedout_fine_msg', ESX.Math.GroupDigits(fineAmount)))
		xPlayer.removeAccountMoney('bank', fineAmount)
	end)
end

ESX.RegisterServerCallback('esx_ambulancejob:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

ESX.RegisterServerCallback('esx_ambulancejob:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		print(('esx_ambulancejob: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)
	
			MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, `stored`) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)', {
				['@owner'] = xPlayer.identifier,
				['@vehicle'] = json.encode(vehicleProps),
				['@plate'] = vehicleProps.plate,
				['@type'] = type,
				['@job'] = xPlayer.job.name,
				['@stored'] = true
			}, function (rowsChanged)
				cb(true)
			end)
		else
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:storeNearbyVehicle', function(source, cb, nearbyVehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundPlate, foundNum

	for k,v in ipairs(nearbyVehicles) do
		local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = v.plate,
			['@job'] = xPlayer.job.name
		})

		if result[1] then
			foundPlate, foundNum = result[1].plate, k
			break
		end
	end

	if not foundPlate then
		cb(false)
	else
		MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = foundPlate,
			['@job'] = xPlayer.job.name
		}, function (rowsChanged)
			if rowsChanged == 0 then
				print(('esx_ambulancejob: %s has exploited the garage!'):format(xPlayer.identifier))
				cb(false)
			else
				cb(true, foundNum)
			end
		end)
	end

end)

function getPriceFromHash(hashKey, jobGrade, type)
	if type == 'helicopter' then
		local vehicles = Config.AuthorizedHelicopters[jobGrade]

		for k,v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	elseif type == 'car' then
		local vehicles = Config.AuthorizedVehicles[jobGrade]

		for k,v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	end

	return 0
end

RegisterServerEvent('esx_ambulancejob:removeItem')
AddEventHandler('esx_ambulancejob:removeItem', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem(item, 1)

	if item == 'bandage' then
TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajanegra', text = _U('used_bandage'),length = 6500})
--TriggerClientEvent('esx:showNotification', _source, _U('used_bandage'))

	elseif item == 'medikit' then
TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajanegra', text = _U('used_medikit'),length = 6500})
--TriggerClientEvent('esx:showNotification', _source, _U('used_medikit'))
	
	elseif item == 'pildora' then
TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajanegra', text = _U('used_pildora'),length = 6500})
  --TriggerClientEvent('esx:showNotification', _source, _U('used_pildora'))  
	end
end)

RegisterServerEvent('esx_ambulancejob:giveItem')
AddEventHandler('esx_ambulancejob:giveItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'ambulance' then
		print(('esx_ambulancejob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	elseif (itemName ~= 'medikit' and itemName ~= 'bandage' and itemName ~= 'bread' and itemName ~= 'water') then
		print(('esx_ambulancejob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	end

	local xItem = xPlayer.getInventoryItem(itemName)
	local count = 5
	local limite = 20

	if xItem.count < limite then
		xPlayer.addInventoryItem(itemName, count)
	else
	
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja2', text = _U('max_item'),length = 7500})
	
		--TriggerClientEvent('esx:showNotification', source, _U('max_item'))
	end
end)



-- ESX.RegisterUsableItem('medikit', function(source)
-- 	if not playersHealing[source] then
-- 		local xPlayer = ESX.GetPlayerFromId(source)
-- 		xPlayer.removeInventoryItem('medikit', 1)
	
-- 		playersHealing[source] = true
-- 		TriggerClientEvent('esx_ambulancejob:useItem', source, 'medikit')

-- 		Citizen.Wait(10000)
-- 		playersHealing[source] = nil
-- 	end
-- end)

ESX.RegisterUsableItem('bandage', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('bandage', 1)
	
		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'bandage')

		Citizen.Wait(5000)
		playersHealing[source] = nil
	end
end)

-- ESX.RegisterUsableItem('pildora', function(source)
-- 	if not playersHealing[source] then
-- 		local xPlayer = ESX.GetPlayerFromId(source)
-- 		xPlayer.removeInventoryItem('pildora', 1)
	
-- 		playersHealing[source] = true
-- 		TriggerClientEvent('esx_ambulancejob:useItem', source, 'pildora')

-- 		Citizen.Wait(3000)
-- 		playersHealing[source] = nil
-- 	end
-- end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchScalar('SELECT is_dead FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(isDead)
		if isDead then
			print(('esx_ambulancejob: %s attempted combat logging!'):format(identifier))
		end
		cb(isDead)
	end)
end)
RegisterServerEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
	local identifier = GetPlayerIdentifiers(source)[1]

	if type(isDead) ~= 'boolean' then
		print(('esx_ambulancejob: %s attempted to parse something else than a boolean to setDeathStatus!'):format(identifier))
		return
	end
	MySQL.Sync.execute('UPDATE users SET is_dead = @isDead WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@isDead'] = isDead
	})
end)
---------------------------------
--------####SACAR Y PONER DEL VEHICULO ###-------------
RegisterServerEvent('esx_sem:putInVehicle')
AddEventHandler('esx_sem:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_sem:putInVehicle', target)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source)
	end
end)
RegisterServerEvent('esx_sem:OutVehicle')
AddEventHandler('esx_sem:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_sem:OutVehicle', target)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source)
	end
end)
 
-------------#######--------------#####################

---------------------------------
---  NUEVA ANIMACION REVIVIR ----
---------------------------------
RegisterServerEvent('ems:nuevobb')
AddEventHandler('ems:nuevobb', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == 'ambulance' then
	--print ("Prueba1")
    TriggerClientEvent('anim:herido', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('anim:medico', _source)
	else 
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source)
	end

end)
---------------------------------
---FIN NUEVA ANIMACION REVIVIR --
---------------------------------

---------------------------------
----    LEVANTAR HERIDO      ----
---------------------------------

RegisterCommand('levantarherido', function(source, args)
    TriggerClientEvent('commando:levantarherido', source)
end)
RegisterServerEvent('esx_cargarherido:levantar')
AddEventHandler('esx_cargarherido:levantar', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('esx_cargarherido:anim', targetPlayer.source, source)

end)
RegisterServerEvent('cargarherido:mensaje')
AddEventHandler('cargarherido:mensaje', function(source)

	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = 'Alguien te está levantando ' ,length = 3500})
	--TriggerClientEvent('esx:showNotification', source, ('Alguien está tratando de levantarte '))
end)

---------------------------------
---- FIN LEVANTAR HERIDO     ----
---------------------------------


----Armario personal de Ropa añadido por Bufas----

ESX.RegisterServerCallback('esx_ambulancejob:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local count    = store.count('dressing')
	  local labels   = {}
  
	  for i=1, count, 1 do
		local entry = store.get('dressing', i)
		table.insert(labels, entry.label)
	  end
  
	  cb(labels)
	end)
end)
  
ESX.RegisterServerCallback('esx_ambulancejob:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)
