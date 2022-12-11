webhookurl = 'https://discord.com/api/webhooks/943654851278143580/88amTIhVo1PYuxeywde7qXnIpgk2pe_9UKnlWNI1LD8m_SjWgqJxo_Dmu5AuebFau4zJ' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'pbyellow', 'pbyellow', 'society_pbyellow', 'society_pbyellow', 'society_pbyellow', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'pbyellow' then
		return true
	end
end

RegisterServerEvent('esx_pbyellowjob:getStockItem')
AddEventHandler('esx_pbyellowjob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "pbyellow" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbyellow', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Yellow Jack', 'Yellow Jack | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_pbyellowjob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "pbyellow" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbyellow', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_pbyellowjob:putStockItems')
AddEventHandler('esx_pbyellowjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "pbyellow" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbyellow', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad Yellow Jack',
        'Yellow Jack | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_pbyellowjob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_pbyellowjob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_pbyellowjob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_pbyellow:eyrtqwyterqywreuytrqwuyte_pbyellow')
AddEventHandler('yueqweuytrquwyteruy_pbyellow:eyrtqwyterqywreuytrqwuyte_pbyellow',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_pbyellow:rwytqrwuyrquywruyqt_pbyellow", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_pbyellow:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_pbyellow")
AddEventHandler("ruyfwuytruyrfwyeruy_pbyellow:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_pbyellow",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'pbyellow' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_pbyellow:gsfcudyafsuydruyas_pbyellow", xPlayer.source, true, xPlayer.job )
	end
end)