webhookurl = 'https://discord.com/api/webhooks/943654629072330802/w-TA2aXPQWCDBPyxlTuuOpwDV9WsVq5NIkgTxTR4OhIwmfuXyYHsvXvV9EOfE1FyZX-F' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'vanilla', 'vanilla', 'society_vanilla', 'society_vanilla', 'society_vanilla', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'vanilla' then
		return true
	end
end

RegisterServerEvent('esx_vanillajob:getStockItem')
AddEventHandler('esx_vanillajob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "vanilla" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vanilla', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Vanilla', 'Vanilla | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_vanillajob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "vanilla" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vanilla', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_vanillajob:putStockItems')
AddEventHandler('esx_vanillajob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "vanilla" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vanilla', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad Vanilla',
        'Vanilla | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_vanillajob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_vanillajob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_vanillajob:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)

function sendDiscord(name, message)
	PerformHttpRequest(webhookurl,
  function(err, text, headers)
  end, 'POST', json.encode({username = name,
      content = message}),
       { ['Content-Type'] = 'application/json' }) 
end

-- Menu F6 Serverside --
RegisterServerEvent('yueqweuytrquwyteruy_vanilla:eyrtqwyterqywreuytrqwuyte_vanilla')
AddEventHandler('yueqweuytrquwyteruy_vanilla:eyrtqwyterqywreuytrqwuyte_vanilla',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_vanilla:rwytqrwuyrquywruyqt_vanilla", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_vanilla:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_vanilla")
AddEventHandler("ruyfwuytruyrfwyeruy_vanilla:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_vanilla",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'vanilla' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_vanilla:gsfcudyafsuydruyas_vanilla", xPlayer.source, true, xPlayer.job )
	end
end)