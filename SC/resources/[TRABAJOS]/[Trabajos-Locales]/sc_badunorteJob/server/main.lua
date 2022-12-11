webhookurl = 'https://discord.com/api/webhooks/943655346491232266/cQ36soPVCTr7G32amYo2YZKk8qWU0P_Iz9W15keqQeZs7x5M6-fmlJ8rUkKXXadN_22n' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'badunorte', 'badunorte', 'society_badunorte', 'society_badunorte', 'society_badunorte', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'badunorte' then
		return true
	end
end

RegisterServerEvent('esx_badunortejob:getStockItem')
AddEventHandler('esx_badunortejob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "badunorte" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_badunorte', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Badu Norte', 'Badu Norte | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_badunortejob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "badunorte" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_badunorte', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_badunortejob:putStockItems')
AddEventHandler('esx_badunortejob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "badunorte" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_badunorte', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad Badu Norte',
        'Badu Norte | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_badunortejob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_badunortejob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_badunortejob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_badunorte:eyrtqwyterqywreuytrqwuyte_badunorte')
AddEventHandler('yueqweuytrquwyteruy_badunorte:eyrtqwyterqywreuytrqwuyte_badunorte',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_badunorte:rwytqrwuyrquywruyqt_badunorte", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_badunorte:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_badunorte")
AddEventHandler("ruyfwuytruyrfwyeruy_badunorte:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_badunorte",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'badunorte' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_badunorte:gsfcudyafsuydruyas_badunorte", xPlayer.source, true, xPlayer.job )
	end
end)