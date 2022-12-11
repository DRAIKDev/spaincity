webhookurl = 'https://discord.com/api/webhooks/968458674983010334/uNJ0aj3CCIBDQbQGuwwLTIzneoDgzdMH1UGwrNeGNhA3o5Kde0T_jvyc_7fWTPZIAxL8' -- Cambiamos las XXXX por el webhooks de discord

ESX                = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


TriggerEvent('esx_society:registerSociety', 'mechanic',   'mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'mechanic01', 'mechanic01', 'society_mechanic01', 'society_mechanic01', 'society_mechanic01', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'mechanic02', 'mechanic02', 'society_mechanic02', 'society_mechanic02', 'society_mechanic02', {type = 'public'})


RegisterServerEvent('esx_mechanicjob:getStockItem')
AddEventHandler('esx_mechanicjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if not(xPlayer.job.name == "mechanic" or xPlayer.job.name == "mechanic01" or xPlayer.job.name == "mechanic02") then 
	    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",xPlayer.source, "NOTMECHANIC")
		return 
	end
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job.name..'', function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification(_U('have_withdrawn', count, item.label))
				sendDiscord('Seguridad Mecanicos',''..xPlayer.job.name..' | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de coger, Nombre Objeto: '.. item.label .. ' - Cantidad: ' ..count)
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			xPlayer.showNotification(_U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_mechanicjob:getStockItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = 'society_'..xPlayer.job.name..''
	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_mechanicjob:putStockItems')
AddEventHandler('esx_mechanicjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if not(xPlayer.job.name == "mechanic" or xPlayer.job.name == "mechanic01" or xPlayer.job.name == "mechanic02") then 
	    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",xPlayer.source, "NOTMECHANIC")
		return 
	end
	local society = 'society_'..xPlayer.job.name..''
	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			sendDiscord('Seguridad Mecanicos',''..xPlayer.job.name..' | Steam ID: '..xPlayer.name..' | Mensaje:  Acaba de depositar, Nombre Objeto: '..item.label..' - Cantidad: '..count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, item.label))
	end)

end)

RegisterServerEvent('hdkasjdjahskj:djhaksjdhals')
AddEventHandler('hdkasjdjahskj:djhaksjdhals', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	if xPlayer.job.name == "mechanic" or xPlayer.job.name == "mechanic01" or xPlayer.job.name == "mechanic02" then 
		TriggerClientEvent("JHDAKSHDADHJA:IDKASJDIIOAID7898Y",_source)
	end
end)
 
ESX.RegisterServerCallback('esx_mechanicjob:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({items = items})
end)

function sendDiscord(name, message)
	PerformHttpRequest(webhookurl,
  function(err, text, headers)
  end, 'POST', json.encode({username = name,
      content = message}),
       { ['Content-Type'] = 'application/json' }) 
	end
ESX.RegisterServerCallback('esx_mechanicjob:getPlayerDressing', function(source, cb)
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
  
ESX.RegisterServerCallback('esx_mechanicjob:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)


RegisterServerEvent('esx_mechanicjob:viewVehicles')
AddEventHandler('esx_mechanicjob:viewVehicles', function(coords, heading, garage)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local vehicles = {}
   	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_mechanic WHERE owner = @identifier',
	{
		['@identifier'] = xPlayer.job.name
	}, function(result)
        for k, v in pairs(result) do
            table.insert(vehicles, v)
        end
        if #vehicles >= 1 then
            if json.decode(vehicles[1].vehicle).model then
                TriggerClientEvent('esx_mechanicjob:view', src, vehicles, coords, heading)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'No tienes ningun vehículo en el garage'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'No tienes ningun vehículo en el garage'})
        end
	end)
end)

RegisterServerEvent('esx_mechanicjob:takeOut')
AddEventHandler('esx_mechanicjob:takeOut', function(vehicleInfo, spawnpoint, heading2)
    local xPlayer = ESX.GetPlayerFromId(source)
	
	if not(xPlayer.job.name == "mechanic" or xPlayer.job.name == "mechanic01" or xPlayer.job.name == "mechanic02") then 
	    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",xPlayer.source, "NOTMECHANIC")
		return 
	end
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=false WHERE plate=@plate",{['@plate'] = vehicleInfo.plate})
    TriggerClientEvent('esx_mechanicjob:spawnVehicle', xPlayer.source, vehicleInfo, spawnpoint, heading2)
end)

function trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function coche(vendedor,comprador,matr,price,name)
	local xPlayervend = ESX.GetPlayerFromId(vendedor)
	local xPlayercomp = ESX.GetPlayerFromId(comprador)
	
	local data = MySQL.Sync.fetchAll('SELECT * FROM `owned_vehicles_mechanic` WHERE owner=@identifier AND plate=@plate ',
	{
		['@identifier'] = xPlayervend.job.name,
		['@plate'] = ""..tostring(matr)..""
	})
	
	MySQL.Async.execute('INSERT INTO `owned_vehicles` (owner, plate, vehicle, type, job, stored, damages, state, garage) VALUES (@owner, @plate, @vehicle, @type, @job, @stored, @damages, @state, @garage)',
		{
			['@owner'] 		= xPlayercomp.identifier,
			['@plate'] 		= tostring(data[1].plate),
			['@vehicle'] 	= data[1].vehicle, 
			['@type'] 		= data[1].type,
			['@job'] 		= data[1].job,
			['@stored'] 	= data[1].stored,
			['@damages'] 	= data[1].damages,
			['@state'] 		= data[1].state,
			['@garage'] 	= data[1].garage
		})

	MySQL.Async.execute('DELETE FROM `owned_vehicles_mechanic` WHERE owner=@identifier AND plate=@plate ',
	{
		['@identifier'] = xPlayervend.job.name,
		['@plate'] = ""..tostring(matr)..""
	})

	registerDB(GetPlayerIdentifiers(vendedor)[1], GetPlayerIdentifiers(comprador)[1], matr, price, name)
	TriggerClientEvent('chatMessage', comprador, "Vendedor", {255, 0, 0}, "Ahora el coche te pertenece!")
	TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "Bien, has vendido el coche!")

	TriggerEvent('esx_addonaccount:getSharedAccount', "society_"..xPlayervend.job.name.."", function(account)
		xPlayercomp.removeMoney(price)
		account.addMoney(price)
	end)

	
end

function cocheCompra(comprador,vendedor,matr,price,name)
	local xPlayervend = ESX.GetPlayerFromId(vendedor)
	local xPlayercomp = ESX.GetPlayerFromId(comprador)
	print(xPlayervend.identifier)
	local data = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND `plate`=@plate ',
	{
		['@identifier'] = xPlayervend.identifier,
		['@plate'] = ""..matr..""
	})	
		MySQL.Async.execute('INSERT INTO `owned_vehicles_mechanic` (owner, plate, vehicle, type, job, stored, damages, state, garage) VALUES (@owner, @plate, @vehicle, @type, @job, @stored, @damages, @state, @garage)',
		{
			['@owner'] 		= xPlayercomp.job.name,
			['@plate'] 		= tostring(matr),
			['@vehicle'] 	= data[1].vehicle, 
			['@type'] 		= data[1].type,
			['@job'] 		= data[1].job,
			['@stored'] 	= data[1].stored,
			['@damages'] 	= data[1].damages,
			['@state'] 		= data[1].state,
			['@garage'] 	= data[1].garage
		})

	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE owner=@identifier AND `plate`=@plate ',
	{
		['@identifier'] = xPlayervend.identifier,
		['@plate'] = ""..tostring(matr)..""
	})	

	registerDB(GetPlayerIdentifiers(vendedor)[1], GetPlayerIdentifiers(comprador)[1], matr, price, name)
	TriggerClientEvent('chatMessage', comprador, "Vendedor", {255, 0, 0}, "Ahora el coche te pertenece!")
	TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "Bien, has vendido el coche!")

	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..xPlayercomp.job.name..'', function(account)
		account.removeMoney(price)
		xPlayervend.addMoney(price)
	end)
	
end

function registerDB(vendedor, comprador, matr, price, name)
	local hour = os.time()
	local tiempo = os.date('%c',hour)
	MySQL.Async.execute("INSERT INTO dk_vender (`seller`,`buyer`,`car`,`hour`,`price`,`name`) VALUES (@vendedor,@comprador,@matr,@hour,@price,@name)",
	{
		vendedor = vendedor,
		comprador = comprador,
		matr = matr,
		hour = tiempo,
		price = price,
		name = name
	})
end

RegisterServerEvent('vender:esmicoche')
AddEventHandler('vender:esmicoche',function(matr,id,price,car,name)
	local source = source
	local var = false
	local xPlayer = ESX.GetPlayerFromId(source)

	
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles_mechanic WHERE owner=@identifier",
				{
					['@identifier'] = xPlayer.job.name
				})
	if data[1] then
		for i=1,#data,1 do
			local vehicle = json.decode(data[i].vehicle)
			if trim(tostring(vehicle.plate)) == trim(tostring(matr)) then
				var = true
				break
			end
		end
	end
	TriggerClientEvent('vender:esmicochecallback',source,var,id,price,matr,car,name)
end)

RegisterServerEvent('vender:esmicocheCompra')
AddEventHandler('vender:esmicocheCompra',function(matr,id,price,car,name)
	local source = source
	local var = false
	local xPlayer = ESX.GetPlayerFromId(id)
	
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",
				{
					['@identifier'] = xPlayer.identifier
				})
	if data[1] then
		for i=1,#data,1 do
			local vehicle = json.decode(data[i].vehicle)
			if trim(tostring(vehicle.plate)) == trim(tostring(matr)) then
				var = true
				break
			end
		end
	end
	TriggerClientEvent('vender:esmicochecallbackCompra',source,var,id,price,matr,car,name)
end)

RegisterServerEvent('vender:vendococheser')
AddEventHandler('vender:vendococheser',function(id,precio,matr,car,name)
	TriggerClientEvent('vender:vendocoche',id,precio,source,matr,car,name)
end)

RegisterServerEvent('vender:vendococheserCompra')
AddEventHandler('vender:vendococheserCompra',function(id,precio,matr,car,name)
	TriggerClientEvent('vender:vendococheCompra',id,precio,source,matr,car,name)
end)

RegisterServerEvent('vender:handleroferta')
AddEventHandler('vender:handleroferta',function(var,vendedor,matr,price,name)
	if var == true then
		local xPlayer = ESX.GetPlayerFromId(source)
		if price <= xPlayer.getMoney() then
			TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "Han aceptado tu oferta!")
			TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "Has aceptado la oferta!")
			coche(vendedor,source,matr,price,name)
		else
			TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "No tiene suficiente dinero!")
			TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "No tienes suficiente dinero!")
		end
	else
		TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "Han rechazado tu oferta!")
		TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "Has rechazado la oferta!")

	end
end)

RegisterServerEvent('vender:handlerofertaCompra')
AddEventHandler('vender:handlerofertaCompra',function(var,vendedor,matr,price,name)
	if var == true then
		local xPlayer = ESX.GetPlayerFromId(vendedor)
		local job = xPlayer.job.name
		--print('society_'..job..'')
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..job..'', function(account)
			--print(''..account.money..'')
			if price <= account.money then
				TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "Han aceptado tu oferta!")
				TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "Has aceptado la oferta!")
				cocheCompra(vendedor,source,matr,price,name)
			else
				TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "No tiene suficiente dinero!")
				TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "No tienes suficiente dinero!")
			end
		end)

	else
		TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "Han rechazado tu oferta!")
		TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "Has rechazado la oferta!")

	end
end)


RegisterServerEvent('vender:vendercoche')
AddEventHandler('vender:vendercoche', function(id, precio, user)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if not(xPlayer.job.name == "mechanic" or xPlayer.job.name == "mechanic01" or xPlayer.job.name == "mechanic02") then 
	    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",xPlayer.source, "NOTMECHANICCOMPRACOCHE")
		return 
	end
	if GetPlayerName(tostring(id)) then--and tonumber(precio) ~= source then
		local _id = tonumber(id)
		local _precio = tonumber(precio)
		if _precio <= 5000 then
			TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "El precio no es válido. Debe ser mayor a 5000!")
			return 0
		end
		TriggerClientEvent("vender:compruebocoche",source, _id, _precio)

	else
		TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "La ID es incorrecta!")
	end
end)


RegisterServerEvent('vender:comprarcoche')
AddEventHandler('vender:comprarcoche', function(id, precio, user)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if not(xPlayer.job.name == "mechanic" or xPlayer.job.name == "mechanic01" or xPlayer.job.name == "mechanic02") then 
	    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",xPlayer.source, "NOTMECHANICCOMPRACOCHE")
		return 
	end
	if GetPlayerName(tostring(id)) then--and tonumber(precio) ~= source then
		local _id = tonumber(id)
		local _precio = tonumber(precio)
		if _precio <= 5000 then
			TriggerClientEvent('chatMessage', source, "Comprador", {255, 0, 0}, "El precio no es válido. Debe ser mayor a 5000!")
			return 0
		end
		TriggerClientEvent("vender:compruebococheCompra",source, _id, _precio)

	else
		TriggerClientEvent('chatMessage', source, "Comprador", {255, 0, 0}, "La ID es incorrecta!")
	end
end)

RegisterServerEvent('fiuytrhgy:dtreytdtydtchj')
AddEventHandler('fiuytrhgy:dtreytdtydtchj', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("renzu_customs:openmenu", xPlayer.source)
end)
