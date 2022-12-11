ESX                = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'abogado',   'abogado', 'society_abogado', 'society_abogado', 'society_abogado', {type = 'private'})

TriggerEvent('esx_phone:registerNumber', 'abogado', 'Abogado', true, true)

RegisterServerEvent('esx_abogados:getStockItem')
AddEventHandler('esx_abogados:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if not(xPlayer.job.name == "abogado") then 
	    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",xPlayer.source, "notabifado")
		return 
	end
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_abogado', function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification(_U('have_withdrawn', count, item.label))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			xPlayer.showNotification(_U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_abogados:getStockItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', "society_abogado", function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_abogados:putStockItems')
AddEventHandler('esx_abogados:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if not(xPlayer.job.name == "abogado") then 
	    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",xPlayer.source, "NOTMECHANIC")
		return 
	end
	local society = 'society_abogado'
	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, item.label))
	end)

end)

RegisterServerEvent('sdaadsasdadsasdadadsad:djhaksjdhals')
AddEventHandler('sdaadsasdadsasdadadsad:djhaksjdhals', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	if xPlayer.job.name == "abogado" then 
		TriggerClientEvent("sdaadsasdadsa:IDKASJDIIOAID7898Y",_source)
	end
end)
 
ESX.RegisterServerCallback('esx_abogados:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({items = items})
end)


ESX.RegisterServerCallback('esx_abogados:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_abogados:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)


