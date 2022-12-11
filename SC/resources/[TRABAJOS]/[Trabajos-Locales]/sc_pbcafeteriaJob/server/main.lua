webhookurl = 'https://discord.com/api/webhooks/943655088206012456/WFmDbjSlqYUmAiMbKOP8YKdo0YypS6sDUfAB3UyE9rgSSHXkJ7TKlXF1HazgPwGwiV5t' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'pbcafeteria', 'pbcafeteria', 'society_pbcafeteria', 'society_pbcafeteria', 'society_pbcafeteria', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'pbcafeteria' then
		return true
	end
end

RegisterServerEvent('esx_pbcafeteriajob:getStockItem')
AddEventHandler('esx_pbcafeteriajob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "pbcafeteria" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbcafeteria', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Cafeteria', 'Cafeteria | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_pbcafeteriajob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "pbcafeteria" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbcafeteria', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_pbcafeteriajob:putStockItems')
AddEventHandler('esx_pbcafeteriajob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "pbcafeteria" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbcafeteria', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad Cafeteria',
        'Cafeteria | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_pbcafeteriajob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_pbcafeteriajob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_pbcafeteriajob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_pbcafeteria:eyrtqwyterqywreuytrqwuyte_pbcafeteria')
AddEventHandler('yueqweuytrquwyteruy_pbcafeteria:eyrtqwyterqywreuytrqwuyte_pbcafeteria',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_pbcafeteria:rwytqrwuyrquywruyqt_pbcafeteria", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_pbcafeteria:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_pbcafeteria")
AddEventHandler("ruyfwuytruyrfwyeruy_pbcafeteria:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_pbcafeteria",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'pbcafeteria' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_pbcafeteria:gsfcudyafsuydruyas_pbcafeteria", xPlayer.source, true, xPlayer.job )
	end
end)