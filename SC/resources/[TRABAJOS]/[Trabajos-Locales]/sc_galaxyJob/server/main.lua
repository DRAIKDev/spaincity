webhookurl = 'https://discord.com/api/webhooks/943654951513632939/tvvt2u7FXihc10f1lVSCKnZ9r9y0QKjb1Xnot7cwGiPWT5t_9fYU81r-A25-1Jx6Wgtc' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'galaxy', 'galaxy', 'society_galaxy', 'society_galaxy', 'society_galaxy', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'galaxy' then
		return true
	end
end

RegisterServerEvent('esx_galaxyjob:getStockItem')
AddEventHandler('esx_galaxyjob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "galaxy" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_galaxy', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Galaxy', 'Galaxy | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_galaxyjob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "galaxy" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_galaxy', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_galaxyjob:putStockItems')
AddEventHandler('esx_galaxyjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "galaxy" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_galaxy', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad  Galaxy',
        'Galaxy | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_galaxyjob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_galaxyjob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_galaxyjob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_galaxy:eyrtqwyterqywreuytrqwuyte_galaxy')
AddEventHandler('yueqweuytrquwyteruy_galaxy:eyrtqwyterqywreuytrqwuyte_galaxy',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_galaxy:rwytqrwuyrquywruyqt_galaxy", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_galaxy:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_galaxy")
AddEventHandler("ruyfwuytruyrfwyeruy_galaxy:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_galaxy",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'galaxy' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_galaxy:gsfcudyafsuydruyas_galaxy", xPlayer.source, true, xPlayer.job )
	end
end)