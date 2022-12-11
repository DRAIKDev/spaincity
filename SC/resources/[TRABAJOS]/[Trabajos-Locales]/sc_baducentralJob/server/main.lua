webhookurl = 'https://discord.com/api/webhooks/943655214320324678/fagvwd_ST1h5e7AXp-Yky60s_WZbtsfJSm-IUsZmbziOKornCwJQy4M-aBgjX_Kc_hw7' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'baducentral', 'baducentral', 'society_baducentral', 'society_baducentral', 'society_baducentral', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'baducentral' then
		return true
	end
end

RegisterServerEvent('esx_baducentraljob:getStockItem')
AddEventHandler('esx_baducentraljob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "baducentral" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_baducentral', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Badu Central', 'Badu Central | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_baducentraljob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "baducentral" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_baducentral', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_baducentraljob:putStockItems')
AddEventHandler('esx_baducentraljob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "baducentral" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_baducentral', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad Badu Central',
        'Badu Central | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_baducentraljob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_baducentraljob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_baducentraljob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_baducentral:eyrtqwyterqywreuytrqwuyte_baducentral')
AddEventHandler('yueqweuytrquwyteruy_baducentral:eyrtqwyterqywreuytrqwuyte_baducentral',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_baducentral:rwytqrwuyrquywruyqt_baducentral", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_baducentral:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_baducentral")
AddEventHandler("ruyfwuytruyrfwyeruy_baducentral:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_baducentral",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'baducentral' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_baducentral:gsfcudyafsuydruyas_baducentral", xPlayer.source, true, xPlayer.job )
	end
end)