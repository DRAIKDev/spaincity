bandamirando = {}

MySQL.ready(function ()
  	for i=12,1,-1 do 
		bandamirando[i] = 0 
	end 
	print(json.encode(bandamirando))
end)

ESX.RegisterServerCallback('dk:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('dk:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)


ESX.RegisterServerCallback('DRAIKARMARIOS:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('DRAIKARMARIOS:getPlayerblackmoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money

	cb({blackMoney = blackMoney})
end)

RegisterNetEvent('draikbandas:drag')
AddEventHandler('draikbandas:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	
	TriggerClientEvent('draikbandas:drag', target, source)
	
	
end)
RegisterServerEvent('draikbandas:putInVehicle')
AddEventHandler('draikbandas:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

		TriggerClientEvent('draikbandas:putInVehicle', target)
	
end)

RegisterServerEvent('draikbandas:OutVehicle')
AddEventHandler('draikbandas:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)


	if target == -1 then 
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"SacarCNP")

		else
			TriggerClientEvent('draikbandas:OutVehicle', target)

		end

end)
--PONER OBJETOS
RegisterNetEvent('DRAIKARMARIOS:putStockItems')
AddEventHandler('DRAIKARMARIOS:putStockItems', function(groupid, itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bandadr'..groupid..'', function(inventory)
		local inventoryItem = inventory.getItem(itemName)
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			xPlayer.showNotification('Has depositado', count, inventoryItem.label)
			sendToDiscord('https://discord.com/api/webhooks/966711099821010964/aFSG0hynuii6tEhOuyWLQWe6fAqDm-8fKdgFRLAtrRFIGBscCtJyFwcTDsKpTj4ZDJJG', "El usuario: "..GetPlayerName(source).." ha depositado en la banda: **"..groupid.."** "..itemName..":"..count.."")

			inventory.addItem(itemName, count)

		else
			xPlayer.showNotification("Cantidad Invalida")
		end
	end)
end)
RegisterNetEvent('DRAIKARMARIOS:ponerpastanegra')
AddEventHandler('DRAIKARMARIOS:ponerpastanegra', function(groupid, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getAccount('black_money').money >= count and count > 0 then
		xPlayer.removeAccountMoney('black_money', count)

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bandadr'..groupid..'', function(account)
			account.addMoney(count)
			sendToDiscord('https://discord.com/api/webhooks/966711099821010964/aFSG0hynuii6tEhOuyWLQWe6fAqDm-8fKdgFRLAtrRFIGBscCtJyFwcTDsKpTj4ZDJJG', "El usuario: "..GetPlayerName(source).." ha añadido a  la banda: **"..groupid.."** dinero negro: "..count.."")

		end)
	else
		xPlayer.showNotification("Cantidad Invalida")
	end
	
end)

ESX.RegisterServerCallback('DRAIKARMARIOS:abrirsacarpasta', function(source, cb,groupid)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bandadr'..groupid..'', function(account)
		blackMoney = account.money

		cb(blackMoney)
	end)
end)

RegisterNetEvent('DRAIKARMARIOS:sacarpastanegra')
AddEventHandler('DRAIKARMARIOS:sacarpastanegra', function(groupid, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bandadr'..groupid..'', function(account)
		if account.money >= count then
			account.removeMoney(count)
			xPlayer.addAccountMoney('black_money', count)
			sendToDiscord('https://discord.com/api/webhooks/966711099821010964/aFSG0hynuii6tEhOuyWLQWe6fAqDm-8fKdgFRLAtrRFIGBscCtJyFwcTDsKpTj4ZDJJG', "El usuario: "..GetPlayerName(source).." ha retirado de la banda: **"..groupid.."** dinero negro: "..count.."")

		else
			xPlayer.showNotification("Cantidad Invalida")
		end
	end)
	
end)


RegisterNetEvent('DRAIKARMARIOS:getStockItem')
AddEventHandler('DRAIKARMARIOS:getStockItem', function(groupid,itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bandadr'..groupid..'', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification("Has sacado", count, inventoryItem.label)
				sendToDiscord('https://discord.com/api/webhooks/966711099821010964/aFSG0hynuii6tEhOuyWLQWe6fAqDm-8fKdgFRLAtrRFIGBscCtJyFwcTDsKpTj4ZDJJG', "El usuario: "..GetPlayerName(source).." ha sacado de la banda: **"..groupid.."** "..itemName..":"..count.."")

			else
				xPlayer.showNotification("Cantidad Invalida")
			end
		else
			xPlayer.showNotification("Cantidad Invalida")
		end
	end)
end)

ESX.RegisterServerCallback('DRAIKARMARIOS:getStockItems', function(source, cb,groupid)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bandadr'..groupid..'', function(inventory)
		cb(inventory.items)
	end)
end)




ESX.RegisterServerCallback('DRAIKARMARIOS:getweapons1', function(source, cb,groupid)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bandadr'..groupid..'', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)


ESX.RegisterServerCallback('DRAIKARMARIOS:getweaponsretirar', function(source, cb, weaponName,groupid)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)
	sendToDiscord('https://discord.com/api/webhooks/966711099821010964/aFSG0hynuii6tEhOuyWLQWe6fAqDm-8fKdgFRLAtrRFIGBscCtJyFwcTDsKpTj4ZDJJG', "El usuario: "..GetPlayerName(source).." ha retirado de la banda: **"..groupid.."** una "..weaponName.."")

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bandadr'..groupid..'', function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)


ESX.RegisterServerCallback('DRAIKARMARIOS:addArmoryWeapon', function(source, cb, weaponName,groupid)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xweapon = xPlayer.getWeapon(weaponName)
	if xPlayer.getWeapon(weaponName) then
		xPlayer.removeWeapon(weaponName)
		sendToDiscord('https://discord.com/api/webhooks/966711099821010964/aFSG0hynuii6tEhOuyWLQWe6fAqDm-8fKdgFRLAtrRFIGBscCtJyFwcTDsKpTj4ZDJJG', "El usuario: "..GetPlayerName(source).." ha depositado en la banda: **"..groupid.."** una "..weaponName.."")


	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bandadr'..groupid..'', function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
	end
end)

function sendToDiscord(canal,message)
	local DiscordWebHook = canal
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('draikbandas:addplayermirandoarmarioarmas')
AddEventHandler('draikbandas:addplayermirandoarmarioarmas', function(id,iddebanda)
print("Added for "..iddebanda.." player: "..id.."")
	bandamirando[tonumber(iddebanda)]= id
end)

RegisterNetEvent('draikbandas:removeplayermirandoarmarioarmas')
AddEventHandler('draikbandas:removeplayermirandoarmarioarmas', function(id,iddebanda)
	print("Remove for "..iddebanda.." player: "..id.."")

	bandamirando[tonumber(iddebanda)] = 0
end)

RegisterNetEvent('draikbandas:preguntosihayalguienmirandoarmariosarmas')
AddEventHandler('draikbandas:preguntosihayalguienmirandoarmariosarmas', function(iddebanda)
local _source = source	
local xPlayer = ESX.GetPlayerFromId(_source)
print(bandamirando[iddebanda])


	if  bandamirando[tonumber(iddebanda)] ~= 0  then 
		xPlayer.showNotification("No cabe más gente en la habitacion del armario")
	else 
		TriggerClientEvent('draikarmarios:JDHSAJHDNIH798JIEB18792JENDUIAI8UDJNAVDB7890DKDJAIDUJQ9IJDSOIADUJN',_source)
	end


end)

AddEventHandler('playerDropped', function ()
	for i, v in pairs(bandamirando) do
	
		if source == v then
			print("ID: "..v.." ha tirado de F8 estando en el armario de la banda: "..i.."")
		bandamirando[i] = 0
		end
	end
end)


RegisterCommand("draikrevisaarmarios",function(source,args,raw)
print(json.encode(bandamirando))
end)
  