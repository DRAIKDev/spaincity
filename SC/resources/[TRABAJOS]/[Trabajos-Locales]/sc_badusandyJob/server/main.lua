webhookurl = 'https://discord.com/api/webhooks/948744363620577402/6T3kvSf49mHF5z8vVFwvFCwiU_eJdh92ZA04twCAYmLoWvY_yYSBEc8P3N003Pu8YiTB' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'badusandy', 'badusandy', 'society_badusandy', 'society_badusandy', 'society_badusandy', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'badusandy' then
		return true
	end
end

RegisterServerEvent('esx_badusandyjob:getStockItem')
AddEventHandler('esx_badusandyjob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "badusandy" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_badusandy', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Badu Sandy', 'Badu Sandy | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_badusandyjob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "badusandy" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_badusandy', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_badusandyjob:putStockItems')
AddEventHandler('esx_badusandyjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "badusandy" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_badusandy', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad Badu Sandy',
        'Badu Sandy | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_badusandyjob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_badusandyjob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_badusandyjob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_badusandy:eyrtqwyterqywreuytrqwuyte_badusandy')
AddEventHandler('yueqweuytrquwyteruy_badusandy:eyrtqwyterqywreuytrqwuyte_badusandy',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_badusandy:rwytqrwuyrquywruyqt_badusandy", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_badusandy:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_badusandy")
AddEventHandler("ruyfwuytruyrfwyeruy_badusandy:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_badusandy",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'badusandy' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_badusandy:gsfcudyafsuydruyas_badusandy", xPlayer.source, true, xPlayer.job )
	end
end)