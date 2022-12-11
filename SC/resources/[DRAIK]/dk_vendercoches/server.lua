ESX                = nil
local banned = {}


function trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
  end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('vender:cochesbanned', function(source, cb)

	cb(banned)
  
  end)
  
function coche(vendedor,comprador,matr,price,name)
	local xPlayervend = ESX.GetPlayerFromId(vendedor)
	local xPlayercomp = ESX.GetPlayerFromId(comprador)
	MySQL.Async.execute(
		'UPDATE `owned_vehicles` SET `owner` = @owner WHERE `owner` = @ownerantiguo AND`vehicle` LIKE "%' .. trim(matr) .. '%"',
		{
			['@owner'] =  GetPlayerIdentifiers(comprador)[1],
			['@ownerantiguo'] = GetPlayerIdentifiers(vendedor)[1]
		}
	)

	registerDB(GetPlayerIdentifiers(vendedor)[1], GetPlayerIdentifiers(comprador)[1], matr, price, name)
	TriggerClientEvent('chatMessage', comprador, "Vendedor", {255, 0, 0}, "Ahora el coche te pertenece!")
	TriggerClientEvent('chatMessage', vendedor, "Vendedor", {255, 0, 0}, "Bien, has vendido el coche!")

	xPlayercomp.removeMoney(price)
	xPlayervend.addMoney(price)
end

RegisterServerEvent('vender:esmicoche')
AddEventHandler('vender:esmicoche',function(matr,id,price,car,name)
	local source = source
	local var = false
	local ident = GetPlayerIdentifiers(source)[1]
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = ident})	
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

RegisterServerEvent('vender:vendococheser')
AddEventHandler('vender:vendococheser',function(id,precio,matr,car,name)
	TriggerClientEvent('vender:vendocoche',id,precio,source,matr,car,name)


end)

function registerDB(vendedor, comprador, matr, price, name)
local hour = os.time()
local tiempo = os.date('%c',hour)
MySQL.Async.execute("INSERT INTO dk_vender (`seller`,`buyer`,`car`,`hour`,`price`,`name`) VALUES (@vendedor,@comprador,@matr,@hour,@price,@name)", {vendedor = vendedor,comprador = comprador,matr = matr,hour = tiempo,price = price,name = name})
end

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
RegisterCommand( 'vendercoche', function(source, args, user)
	local source = source
	if #args == 1 then
		TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "Debes poner un precio!")
	else
		
			if GetPlayerName(tostring(args[1])) then--and tonumber(args[2]) ~= source then
				local id1 = tonumber(args[1])
				local precio = tonumber(args[2])
				if precio <= 5000 then TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "El precio no es válido. Debe ser mayor a 5000!") return 0 end

				TriggerClientEvent("vender:compruebocoche",source,id1,precio)

			else
				TriggerClientEvent('chatMessage', source, "Vendedor", {255, 0, 0}, "La ID es incorrecta!")
			end
	end
end)
