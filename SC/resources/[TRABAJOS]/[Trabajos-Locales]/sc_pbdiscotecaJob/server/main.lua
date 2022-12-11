webhookurl = 'https://discord.com/api/webhooks/943633398101078076/tGPIhujsAEUN4D2smz4uTYc34zlj75QEL0kko8gQsr4Gee9_hJqyibAI2Co2GwCTbYYP' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'pbdiscoteca', 'pbdiscoteca', 'society_pbdiscoteca', 'society_pbdiscoteca', 'society_pbdiscoteca', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'pbdiscoteca' then
		return true
	end
end

RegisterServerEvent('esx_pbdiscotecajob:getStockItem')
AddEventHandler('esx_pbdiscotecajob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "pbdiscoteca" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbdiscoteca', function(inventory)

      local item = inventory.getItem(itemName)

      if item.count >= count then
        inventory.removeItem(itemName, count)
        xPlayer.addInventoryItem(itemName, count)
        sendDiscord('Seguridad Discoteca', 'Discoteca | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
  end
end)

ESX.RegisterServerCallback('esx_pbdiscotecajob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "pbdiscoteca" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbdiscoteca', function(inventory)
    cb(inventory.items)
  end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")
  end
end)

RegisterServerEvent('esx_pbdiscotecajob:putStockItems')
AddEventHandler('esx_pbdiscotecajob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "pbdiscoteca" then 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pbdiscoteca', function(inventory)

      local item = inventory.getItem(itemName)
      local playerItemCount = xPlayer.getInventoryItem(itemName).count

      if item.count >= 0 and count <= playerItemCount then
        xPlayer.removeInventoryItem(itemName, count)
        inventory.addItem(itemName, count)
        sendDiscord('Seguridad Discoteca',
        'Discoteca | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
      else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
      end

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

    end)
  else
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
  end
end)

ESX.RegisterServerCallback('esx_pbdiscotecajob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_pbdiscotecajob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_pbdiscotecajob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_pbdiscoteca:eyrtqwyterqywreuytrqwuyte_pbdiscoteca')
AddEventHandler('yueqweuytrquwyteruy_pbdiscoteca:eyrtqwyterqywreuytrqwuyte_pbdiscoteca',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_pbdiscoteca:rwytqrwuyrquywruyqt_pbdiscoteca", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_pbdiscoteca:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_pbdiscoteca")
AddEventHandler("ruyfwuytruyrfwyeruy_pbdiscoteca:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_pbdiscoteca",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'pbdiscoteca' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_pbdiscoteca:gsfcudyafsuydruyas_pbdiscoteca", xPlayer.source, true, xPlayer.job )
	end
end)