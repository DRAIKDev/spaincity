webhookurl = 'https://discord.com/api/webhooks/950158083798212731/yWp7qBmf2CLXG--pv6vav9Qs1OVTFO4V4PZCd1oGXSUjJuCBHBfYYw8wsUdNziodB7ka' -- Cambiamos las XXXX por el webhooks de discord

TriggerEvent('esx_society:registerSociety', 'gymjob', 'gymjob', 'society_gymjob', 'society_gymjob', 'society_gymjob', {type = 'private'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'gymjob' then
		return true
	end
end

RegisterServerEvent('esx_gymjob:getStockItem')
AddEventHandler('esx_gymjob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
if xPlayer.job.name == "gymjob" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gymjob', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
      sendDiscord('Seguridad Gym', 'Gym | Steam ID: ' .. xPlayer.name .. ' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)
else
  TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER1")
end
end)

ESX.RegisterServerCallback('esx_gymjob:getStockItems', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.job.name == "gymjob" then 
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gymjob', function(inventory)
    cb(inventory.items)
  end)
else
  TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER2")

end
end)

RegisterServerEvent('esx_gymjob:putStockItems')
AddEventHandler('esx_gymjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "gymjob" then 

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gymjob', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
      sendDiscord('Seguridad Gym',
      'Gym | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)
else
  TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "LOCALESTRIGGER3")
end
end)

ESX.RegisterServerCallback('esx_gymjob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterServerCallback('esx_gymjob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_gymjob:getPlayerOutfit', function(source, cb, num)
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
RegisterServerEvent('yueqweuytrquwyteruy_gymjob:eyrtqwyterqywreuytrqwuyte_gymjob')
AddEventHandler('yueqweuytrquwyteruy_gymjob:eyrtqwyterqywreuytrqwuyte_gymjob',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	    TriggerClientEvent("wtuqtwiuyqtwutqiuw_gymjob:rwytqrwuyrquywruyqt_gymjob", xPlayer.source)
	end
end)

RegisterServerEvent("ruyfwuytruyrfwyeruy_gymjob:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_gymjob")
AddEventHandler("ruyfwuytruyrfwyeruy_gymjob:feyiqhvisytfrd8yqfgiufiwiufiy7tfiy_gymjob",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'gymjob' then
		TriggerClientEvent("feuytqwreuyfrquwyterqy_gymjob:gsfcudyafsuydruyas_gymjob", xPlayer.source, true, xPlayer.job )
	end
end)

-- Dar licencias Gym Serverside --
RegisterCommand("dartarjetagym", function(source, args, rawCommand)	-- /dartarjetagym [ID]
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if xPlayer.job.name == 'gymjob' then
	    	if (args[1] and tonumber(args[1])) and (args[2] and tonumber(args[2])) then
	      		local targetId = tonumber(args[1])
				local dias 	   = tonumber(args[2])
	      		local xTarget = ESX.GetPlayerFromId(targetId)
	      		if xTarget and not(dias == nil) then
					local fecha_actual = os.time(os.date("!*t"))
					local fecha 	   = (dias * 86400) + fecha_actual
	        		MySQL.Async.execute('INSERT INTO `sociosgym` (identifier, vendedor, hasta) VALUES (@identifier, @vendedor, @hasta)',
					{
						['@identifier'] = xTarget.identifier,
						['@vendedor'] 	= xPlayer.identifier,
						['@hasta'] 		= fecha
					})
	        		TriggerClientEvent("chatMessage", xPlayer.source, _U('tarjeta_gym', args[1]))
	        		TriggerClientEvent("chatMessage", xTarget.source, _U('tarjeta_gym_cliente', args[2]))
					TriggerClientEvent("esx_gym:darMembership", xTarget.source)
	      		else

	        		TriggerClientEvent("chatMessage", xPlayer.source, _U('not_online', 'Dar Tarjeta'))

	      		end
	    	else

	      		TriggerClientEvent("chatMessage", xPlayer.source, _U('invalid_input', 'Dar Tarjeta'))

	    	end
		else
			TriggerClientEvent("chatMessage", xPlayer.source, _U('not_job', 'Dar Tarjeta'))
		end
		
	end
end, false)