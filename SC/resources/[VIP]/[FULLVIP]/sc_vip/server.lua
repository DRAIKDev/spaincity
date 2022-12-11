-- ===================================================
-- 	                      E S X
-- ===================================================

ESX = nil
DiscordWebhook             = 'https://discord.com/api/webhooks/788877960329166859/FA6HtxeyCrWSl5upXrndHRW3Z286nqMlBBcEu80Xze_XhjfZeajgfieF7FhIPxggYqkb'

vipslist       = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local desde = os.date("%Y-%m-%d")

function purgeVips(cb)


	MySQL.Async.fetchAll('DELETE FROM vip WHERE hasta < CURRENT_DATE()', {}, function (datos)
	end)
end


function loadVips(cb)
    vipslist       = {}
            -- SELECT v.identifier, v.id_grado, v.packfundador, vg.* FROM vips as v INNER JOIN vips_grados as vg ON v.id_grado = vg.id
	MySQL.Async.fetchAll('SELECT * FROM vip', {}, function (datos)
        for i=1, #datos, 1 do

            vipslist[datos[i].identifier] = {
                id_grado = datos[i].rango,
            }
		end

		if cb ~= nil then
			cb()
		end
	end)
end

MySQL.ready(function()
    purgeVips()
	loadVips()
end)



-- ===================================================
-- 	    F U N C I O N E S    G E N E R A L E S
-- ===================================================

-- CONVERTIR FORMATO DE FECHAS
function convertDate(vardate)
    local y,m,d = string.match(vardate, '(%d+)-(%d+)-(%d+)')
    return string.format('%s-%s-%s ', d,m,y)
end
-- FIN CONVERTIR FORMATO DE FECHAS

		-- CHARSETS
			local NumberCharset = {}
			local Charset = {}

			for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

			for i = 65,  90 do table.insert(Charset, string.char(i)) end
			for i = 97, 122 do table.insert(Charset, string.char(i)) end
		-- FIN CHARSETS

		-- RANDOM NUMBER
			function GetRandomNumber(length)
				Citizen.Wait(1)
				math.randomseed(GetGameTimer())
				if length > 0 then
					return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
				else
					return ''
				end
			end
		-- FIN RANDOM NUMBER

		-- RANDOM LETTER
			function GetRandomLetter(length)
				Citizen.Wait(1)
				math.randomseed(GetGameTimer())
				if length > 0 then
					return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
				else
					return ''
				end
			end
		-- FIN RANDOM LETTER

-- USER GROUP
function GetUserGroup(source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})
	return result[1].group
end
-- FIN USER GROUP

-- CHECK PLATE
function CheckPlate(patente)
	local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = patente
	})
	if result[1] ~= nil then
		return true
	else
		return false
	end
end
-- FIN CHECK PLATE



-- ===================================================
-- 	   F U N C I O N E S    E S P E C I A L E S
-- ===================================================

	-- DAR DONADOR 
	function DarDonador(xPlayer, usuario, nivel, source)
		for rangos in pairs(Config.Rangos) do
			if rangos == nivel then
				for tipo in pairs(Config.Rangos[rangos]) do
					if  tipo == 'dinero' then
						for id in pairs(Config.Rangos[rangos][tipo]) do
							local account = Config.Rangos[rangos][tipo][id]['cuenta']
							local amount = Config.Rangos[rangos][tipo][id]['cantidad']
							xPlayer.addAccountMoney(account, amount)
							TriggerClientEvent('esx:showNotification', usuario, _U('notif_dinero')..amount)
						end

					elseif tipo == 'casa' then
						for id in pairs(Config.Rangos[rangos][tipo]) do
							casa = Config.Rangos[rangos][tipo][id]['casa']
							local identifier = GetPlayerIdentifiers(usuario)
							SetPropertyOwned(casa, identifier[1])
							TriggerClientEvent('esx:showNotification', usuario, _U('notif_casa'))
						end
						
					elseif tipo == 'item' then
						for id in pairs(Config.Rangos[rangos][tipo]) do
							local item = Config.Rangos[rangos][tipo][id]['nombre']
							local count = Config.Rangos[rangos][tipo][id]['cantidad']
							xPlayer.addInventoryItem(item, count)
						end
					end
				end
			end
		end
	end
	-- FIN DAR DONADOR 


-- DAR AUTO AL USUARIO
function GiveCarCode(patente, xPlayer, codigo, source)
	local codigo = codigo:gsub( "AAA 111", patente)
		
	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, state, plate, vehicle) VALUES (@owner, 1, @plate, @vehicle)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = patente,
		['@vehicle'] = codigo
	}, function (rowsChanged)
		
	end)
end
-- FIN DAR AUTO AL USUARIO

-- SET PROPERY OWNED
function SetPropertyOwned(name, owner)
	
	MySQL.Async.fetchAll('SELECT name as name FROM properties', {}, function(properties)
		for i=1, #properties, 1 do
			if properties[i].name == name then

	MySQL.Async.execute('INSERT INTO owned_properties (name, price, rented, owner) VALUES (@name, @price, @rented, @owner)',
	{
		['@name']   = name,
		['@price']  = 0,
		['@rented'] = 0,


		['@owner']  = owner
	}, function(rowsChanged)
		local xPlayer = ESX.GetPlayerFromIdentifier(owner)	

		if xPlayer then
			TriggerClientEvent('esx_property:setPropertyOwned', xPlayer.source, name, true)
					end
				end)
			end
		end
	end)
end
-- FIN SET PROPERY OWNED

-- INSERTAR VIP
function sqlvip(usuario, nivel, admin , desde, hasta)
	local user = GetPlayerIdentifiers(usuario)
	local administrador = GetPlayerIdentifiers(admin)

	MySQL.Async.execute('INSERT INTO vip (identifier, rango, admin, desde, hasta) VALUES (@identifier, @rango, @admin, @desde, @hasta)',
	{
		['@identifier']   = user[1],
		['@rango']  = nivel,
		['@admin'] = administrador[1],
		['@desde'] = desde,
		['@hasta']  = hasta
	})
end 
-- FIN INSERTAR VIP

-- CHEQUEAR VIP
function chkvip(usuario, source)
	local user = GetPlayerIdentifiers(usuario)
	local hoy = os.date("%Y-%m-%d")
	local nombre = GetPlayerName(usuario)
																										
	local result = MySQL.Sync.fetchAll('SELECT rango, hasta FROM vip WHERE identifier = @identifier AND desde <= @hoy AND hasta >= @hoy', {
		['@identifier'] = user[1], 
		['@hoy'] = hoy
	})
	if result[1] then
		fecha = convertDate(result[1].hasta)
		TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('ya_tiene', nombre, result[1].rango, fecha) } })
		TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('ya_tiene_2')} })
		return result[1]
	end
end
-- FIN CHEQUEAR VIP

-- CREAR LOG
function setLog(source, usuario, case, file, extra)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local name_u = GetPlayerName(usuario)
	local identifier_u = GetPlayerIdentifiers(usuario)

	if case == 'rango' then 
		data = '(' .. time .. ') ' .. name .. ' - ' .. identifier[1] .. ' | Le dio rango de donador ' .. nivel .. ' a ' .. name_u .. ' - ' .. identifier_u[1] .. ' hasta ' .. extra
		color, titulo, descripcion = 1435136, 'VIP', "\n**Administrador:** \nNombre: ".. name .."\n Steam: " .. identifier[1] .. "\n\n **Usuario:** \n Nombre: ".. name_u .."\n Steam: " .. identifier_u[1] .. '\n\n**Rango:** \n Nivel:`' .. nivel .. "`" .. '\nHasta: `' .. extra .. "`"
	elseif case == 'auto' then 
		data = '(' .. time .. ') ' .. name .. ' - ' .. identifier[1] .. ' | Le dio un auto a (' .. extra .. ') '.. name_u .. ' - ' .. identifier_u[1]
		color, titulo, descripcion = 52945, 'Auto', "\n**Administrador:** \nNombre: ".. name .."\n Steam: " .. identifier[1] .. "\n\n **Usuario:** \n Nombre: ".. name_u .."\n Steam: " .. identifier_u[1] .. '\n\n**Auto:** \n Patente: `' .. extra .. "`"		
	elseif case == 'caja' then 
		data = '(' .. time .. ') ' .. name_u .. ' - ' .. identifier_u[1] .. ' | recibio ' .. extra
		color, titulo, descripcion = 14329120, 'Caja', "\n**Usuario:** \nNombre: ".. name_u .."\n Steam:" .. identifier_u[1] .."\nPremio: " .. extra .."\n"
	elseif case == 'casa' then 
		data = '(' .. time .. ') ' .. name .. ' - ' .. identifier[1] .. ' | Le dio una casa (' .. extra .. ') a ' .. name_u .. ' - ' .. identifier_u[1]
		color, titulo, descripcion = 18163, 'Casa', "\n**Administrador:** \nNombre: ".. name .."\n Steam: " .. identifier[1] .. "\n\n **Usuario:** \n Nombre: ".. name_u .."\n Steam: " .. identifier_u[1] .. '\n\n**Casa:** \n Nombre: `' .. extra .. "`"		
	elseif case == 'c_rango' then 
		data = '(' .. time .. ') ' .. name .. ' - ' .. identifier[1] .. ' | Cancelo el rango (' .. extra .. ') de ' .. name_u .. ' - ' .. identifier_u[1]
		color, titulo, descripcion = 15431169, 'Cancelar VIP', "\n**Administrador:** \nNombre: ".. name .."\n Steam: " .. identifier[1] .. "\n\n **Usuario:** \n Nombre: ".. name_u .."\n Steam: " .. identifier_u[1] .. '\n\n**Rango:** \n Nivel: `' .. extra .. "`"
	elseif case == 'd_rango' then 
		data = '(' .. time .. ') ' .. name .. ' - ' .. identifier[1] .. ' | Elimino el rango (' .. extra .. ') de ' .. name_u .. ' - ' .. identifier_u[1]
		color, titulo, descripcion = 15335424, 'Eliminar VIP', "\n**Administrador:** \nNombre: ".. name .."\n Steam: " .. identifier[1] .. "\n\n **Usuario:** \n Nombre: ".. name_u .."\n Steam: " .. identifier_u[1] .. '\n\n**Rango:** \n Nivel: `' .. extra .. "`"
	end
	local content = LoadResourceFile(GetCurrentResourceName(), file)
	local newContent = content .. '\r\n' .. data
	SaveResourceFile(GetCurrentResourceName(), file, newContent, -1)	

	local embed = {
        {
            ["color"] = color,
            ["title"] = titulo,
            ["description"] = descripcion,
            ["footer"] = {
                ["text"] = "SpainVIP | " .. time,
            },
        }
    }

  PerformHttpRequest(DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'SpainCity', embeds = embed}), { ['Content-Type'] = 'application/json' })

end
-- FIN CREAR LOG





-- ===================================================
-- 	                C O M A N D O S
-- ===================================================

RegisterCommand("vipgivecar", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local vehicleModel = args[2]
  			TriggerClientEvent('rpproject:vip:giveCar', args[1], args[2])
			  local name = GetPlayerName(args[1])

			  sendDiscord('VIP Draik', ' ID: ' .. name ..'| Acaba de recibir '..args[2]..' entregado por'..xPlayer.identifier..'.')


		end
	end
end, false, {help = 'Vender vehículo a VIP',params = {{name = "id", help = 'Id del jugador'},{name = "model", help = 'Vehículo'}}})

RegisterCommand("vipgiveboat", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local vehicleModel = args[2]
  			TriggerClientEvent('KASJ81O2JE', args[1], args[2])
			  sendDiscord('VIP Draik', ' ID: ' .. args[1] ..'| Acaba de recibir '..args[2]..' entregado po'..xPlayer.identifier..'.')

		end
	end
end, false, {help = 'Dar boat a VIP',params = {{name = "id", help = 'Id del jugador'},{name = "model", help = 'Vehículo'}}})

RegisterCommand("vipgiveair", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local vehicleModel = args[2]
  			TriggerClientEvent('HDSAJ71', args[1], args[2])
			  sendDiscord('VIP Draik', ' ID: ' .. args[1] ..'| Acaba de recibir '..args[2]..' entregado po'..xPlayer.identifier..'.')

		end
	end
end, false, {help = 'Dar AIRCRAFT a VIP',params = {{name = "id", help = 'Id del jugador'},{name = "model", help = 'Vehículo'}}})

webhookurl = 'https://discord.com/api/webhooks/862682048219840542/rwNlHsaCjT6UFcnKblUtg91MKs_dKIDr5kznl0DcM8zRqdVKGQNlsI9ueW-RF1qZ7Vmy' -- Cambiamos las XXXX por el webhooks de discord


function sendDiscord(name, message)
    PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end
RegisterCommand("cancelarvip", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local xPlayer  = ESX.GetPlayerFromId(args[1])
			local nombre = GetPlayerName(args[1])
			local nombre_admin = GetPlayerName(source)
			local user = GetPlayerIdentifiers(args[1])
			local hoy = os.date("%Y-%m-%d")

			if xPlayer ~= nil then
				local result = MySQL.Sync.fetchAll('SELECT rango, hasta FROM vip WHERE identifier = @identifier AND desde <= @hoy AND hasta >= @hoy', {
					['@identifier'] = user[1], 
					['@hoy'] = hoy
				})
				if result[1] then
					MySQL.Async.execute('UPDATE vip SET hasta = @hoy WHERE identifier = @identifier AND desde <= @hoy AND hasta >= @hoy',
					{
						['@identifier']   = user[1],
						['@hoy']  = hoy
					})
					TriggerClientEvent('chat:addMessage', args[1], { args = { _U('sistema'), _U('vip_canceled_u', nombre_admin) } })
					TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('vip_canceled', nombre) } })
					setLog(source, args[1], 'c_rango','logs/rango.txt', result[1].rango)
					TriggerEvent('gar_roles:recargar')
				else
					TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('no_vip', nombre) } })
				end
			else
				TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('usuario_no') } })
			end
		end
	end
end, false)

RegisterCommand("eliminarvip", function(source, args, rawCommand)	
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local xPlayer  = ESX.GetPlayerFromId(args[1])
			local nombre = GetPlayerName(args[1])
			local nombre_admin = GetPlayerName(source)
			local user = GetPlayerIdentifiers(args[1])
			local hoy = os.date("%Y-%m-%d")

			if xPlayer ~= nil then
				local result = MySQL.Sync.fetchAll('SELECT rango, hasta FROM vip WHERE identifier = @identifier AND desde <= @hoy AND hasta >= @hoy', {
					['@identifier'] = user[1], 
					['@hoy'] = hoy
				})
				if result[1] then
					MySQL.Async.execute('DELETE FROM vip WHERE identifier = @identifier AND desde <= @hoy AND hasta >= @hoy',
					{
						['@identifier']   = user[1],
						['@hoy']  = hoy
					})
					TriggerClientEvent('chat:addMessage', args[1], { args = { _U('sistema'), _U('vip_eliminado_u', nombre_admin) } })
					TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('vip_eliminado', nombre) } })
					setLog(source, args[1], 'd_rango','logs/rango.txt', result[1].rango)
					TriggerEvent('gar_roles:recargar')
				else
					TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('no_vip', nombre) } })
				end
			else
				TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('usuario_no') } })
			end
		end
	end
end, false)

RegisterCommand("donador", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local xPlayer  = ESX.GetPlayerFromId(args[1])
			local yo = ESX.GetPlayerFromId(source)
			local nombre = GetPlayerName(args[1])
			local usuario = args[1]
			local nivel = args[2]
			local dias = tonumber(args[3])
			if xPlayer ~= nil then
				if dias ~= nil and dias > 0 then
					
							local desde = os.date("%Y-%m-%d")														
																																											
							local date_table = os.date("*t", os.time() + dias * 86400)								
							local h_year, h_month, h_day = date_table.year, date_table.month, date_table.day		
							local hasta = string.format("%d-%d-%d",h_year , h_month, h_day)							

					if not chkvip(usuario, source) then 
						DarDonador(xPlayer, usuario, nivel, source)
						sqlvip(usuario, nivel, source , desde, hasta)
						fecha = convertDate(hasta)
						TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('don_succ', nivel, nombre, fecha) } })
						TriggerClientEvent('esx:showNotification', usuario, _U('notif_fin'))
						setLog(source, usuario, 'rango','logs/rango.txt', fecha)
						TriggerEvent('gar_roles:recargar')
					end
				else
					TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('not_use') } })
				end

			else
				print("nope")
				TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('usuario_no') } })
			end
		end
	end
end, false)

adminRanks = {
	'admin'
}
function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if exclude and type(exclude) ~= 'table' then exclude = nil;print("^3[esx_admin] ^1ERROR ^0exclude argument is not table..^0") end	-- will prevent from errors if you pass wrong argument

	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(adminRanks) do
		if v == playerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end

--RegisterCommand("casa", function(source, args, rawCommand)
--	if source ~= 0 then
--		local xPlayer = ESX.GetPlayerFromId(source)
--		if havePermission(xPlayer) then
--			local xPlayer  = ESX.GetPlayerFromId(args[1])
--			local usuario = args[1]
--			local casa = args[2]
--			if xPlayer ~= nil then
--				local identifier = GetPlayerIdentifiers(usuario)
--				SetPropertyOwned(casa, identifier[1])
--				TriggerClientEvent('esx:showNotification', usuario, _U('notif_casa'))
--				setLog(source, args[1], 'casa', 'logs/casa.txt', args[2])
--			else
--				TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('usuario_no') } })
--			end
--		end
--	end
--end, false)
--
--RegisterCommand("autodonador", function(source, args, rawCommand)
--	if source ~= 0 then
--		local xPlayer = ESX.GetPlayerFromId(source)
--		if havePermission(xPlayer) then
--			local xPlayer  = ESX.GetPlayerFromId(args[1])
--			local auto = args[2]
--			for autos in pairs(Config.Autos) do
--				if autos == auto then
--					codigo = Config.Autos[autos]['codigo'][1]
--				end
--			end	
--			if xPlayer ~= nil then
--				patente = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))
--				while CheckPlate(patente) do
--					Citizen.Wait(500)
--					patente = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))
--				end 
--					GiveCarCode(patente, xPlayer, codigo, source)
--					TriggerClientEvent('esx:showNotification', args[1], _U('vehiculo_pertenece'))
--					setLog(source, args[1], 'auto','logs/auto.txt', patente)
--			else
--				TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('usuario_no') } })
--			end
--		end
--	end
--end, false)

RegisterCommand("vips", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local estado = tonumber(args[1])
			hoy = os.date("%Y-%m-%d")

				if estado == 1 or estado == 0 then
					if estado == 1 then 
						TriggerClientEvent('chat:addMessage', source, { args = {'', _U('activos') } })
						result = MySQL.Sync.fetchAll('SELECT users.name as name, vip.rango as rango, vip.hasta as hasta, vip.desde as desde FROM vip LEFT JOIN users using (identifier) WHERE vip.desde <= @hoy AND vip.hasta >= @hoy', {
							['@hoy'] = hoy
						})
					else
						TriggerClientEvent('chat:addMessage', source, { args = {'', _U('inactivos') } })
						result = MySQL.Sync.fetchAll('SELECT users.name as name, vip.rango as rango, vip.hasta as hasta, vip.desde as desde FROM vip LEFT JOIN users using (identifier) WHERE @hoy > vip.desde AND vip.hasta < @hoy', {
							['@hoy'] = hoy
						})
					end
					for i=1, #result, 1 do	
						fecha_h = convertDate(os.date("%Y-%m-%d",result[i].hasta/1000))
						fecha_d = convertDate(os.date("%Y-%m-%d",result[i].desde/1000))
						TriggerClientEvent('chat:addMessage', source, { args = {'', _U('user_vip', result[i].name, result[i].rango, fecha_d, fecha_h) } })
						
					end
					TriggerClientEvent('chat:addMessage', source, { args = {'', _U('vips_fin') } })
				else
					TriggerClientEvent('chat:addMessage', source, { args = { _U('sistema'), _U('param_no') } })
				end
		end
	end
end, false)
RegisterServerEvent('rs_donations:logs')
AddEventHandler('rs_donations:logs', function(source, usuario, file)
		setLog(source, usuario, case, file, patente)
end)


RegisterServerEvent('B128AAIUDJA')
AddEventHandler('B128AAIUDJA', function (vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_boats (owner, plate, vehicle, type, stored) VALUES (@owner, @plate, @vehicle, @type, @stored)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
		['@type']   = "boat",
		['@stored'] = "1"
	}, function (rowsChanged)
		TriggerClientEvent('esx:showNotification', _source, 'Este vehiculo te pertenece', vehicleProps.plate)
	end)
end)


RegisterServerEvent('GSDH7188')
AddEventHandler('GSDH7188', function (vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_aircrafts (owner, plate, vehicle, state) VALUES (@owner, @plate, @vehicle, @state)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
		['@state'] = 1
		
		
	}, function (rowsChanged)
		TriggerClientEvent('esx:showNotification', _source, 'Este vehiculo te pertenece', vehicleProps.plate)
	end)
end)

-- ===================================================
-- 	                   I T E M S
-- ===================================================

-- CAJAS
for caja in pairs(Config.Cajas) do
	ESX.RegisterUsableItem(caja, function(source)
		TriggerClientEvent('esx:showNotification', source, _U('abriendo_caja'))
		local num = math.random(100)
		local anterior = 0 
		xPlayer  = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem(caja, 1)
		Citizen.Wait(3000)
		for item in pairs(Config.Cajas[caja]) do

			local premio = Config.Cajas[caja][item].nombre
			local label = Config.Cajas[caja][item].label
			local porcentaje = Config.Cajas[caja][item].porcentaje
			local actual = anterior + porcentaje
			local tipo = Config.Cajas[caja][item].tipo

				if num > anterior and num <= actual then
					TriggerClientEvent('esx:showNotification', source, _U('recibiste')  .. '~y~' .. label)
					setLog(source, source, 'caja', 'logs/caja.txt', label)

					if tipo == 'item' then
						local cantidad = Config.Cajas[caja][item].cantidad
						xPlayer.addInventoryItem(premio, cantidad)
					elseif tipo == 'arma' then
						xPlayer.addWeapon(premio, 250)
					elseif tipo == 'dinero' then
						local cuenta = Config.Cajas[caja][item].nombre
						local cantidad = Config.Cajas[caja][item].cantidad
						xPlayer.addAccountMoney(cuenta, cantidad)
					elseif tipo == 'rango' then
						TriggerClientEvent('esx:showNotification', source, _U('notif_rank'))
						DarDonador(xPlayer, source, premio, source)
					elseif tipo == 'casa' then
						local identifier = GetPlayerIdentifiers(source)
						SetPropertyOwned(premio, xPlayer.identifier)
					elseif tipo == 'auto' then
						patente = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))
						while CheckPlate(patente) do
							Citizen.Wait(500)
							patente = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))
						end 
							GiveCarCode(patente, xPlayer, premio, source)
					end
				end
			anterior = actual
		end
	end) 
end
-- FIN CAJAS 

-- SUMINISTROS
for suministro in pairs(Config.Suministros) do
		ESX.RegisterUsableItem(suministro, function(source)
			xPlayer  = ESX.GetPlayerFromId(source)
			xPlayer.removeInventoryItem(suministro, 1)
	for item in pairs(Config.Suministros[suministro]) do
		local arma = Config.Suministros[suministro][item].arma
		local ammo = Config.Suministros[suministro][item].municion
		xPlayer.addWeapon(arma, ammo)
	end
end) 
end
-- FIN SUMINISTROS 