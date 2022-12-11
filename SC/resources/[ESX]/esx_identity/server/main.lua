ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier	= result[1].identifier,
				firstname	= result[1].firstname,
				lastname	= result[1].lastname,
				dateofbirth	= result[1].dateofbirth,
				sex			= result[1].sex,
				height		= result[1].height
			}

			callback(data)
		else
			local data = {
				identifier	= '',
				firstname	= '',
				lastname	= '',
				dateofbirth	= '',
				sex			= '',
				height		= ''
			}

			callback(data)
		end
	end)
end

function getCharacters(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `characters` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] and result[2] and result[3] then

			local data = {
				identifier		= result[1].identifier,
				firstname1		= result[1].firstname,
				lastname1		= result[1].lastname,
				dateofbirth1	= result[1].dateofbirth,
				sex1			= result[1].sex,
				height1			= result[1].height,
				firstname2		= result[2].firstname,
				lastname2		= result[2].lastname,
				dateofbirth2	= result[2].dateofbirth,
				sex2			= result[2].sex,
				height2			= result[2].height,
				firstname3		= result[3].firstname,
				lastname3		= result[3].lastname,
				dateofbirth3	= result[3].dateofbirth,
				sex3			= result[3].sex,
				height3			= result[3].height
			}

			callback(data)

		elseif result[1] and result[2] and not result[3] then

			local data = {
				identifier		= result[1].identifier,
				firstname1		= result[1].firstname,
				lastname1		= result[1].lastname,
				dateofbirth1	= result[1].dateofbirth,
				sex1			= result[1].sex,
				height1			= result[1].height,
				firstname2		= result[2].firstname,
				lastname2		= result[2].lastname,
				dateofbirth2	= result[2].dateofbirth,
				sex2			= result[2].sex,
				height2			= result[2].height,
				firstname3		= '',
				lastname3		= '',
				dateofbirth3	= '',
				sex3			= '',
				height3			= ''
			}

			callback(data)

		elseif result[1] and not result[2] and not result[3] then

			local data = {
				identifier		= result[1].identifier,
				firstname1		= result[1].firstname,
				lastname1		= result[1].lastname,
				dateofbirth1	= result[1].dateofbirth,
				sex1			= result[1].sex,
				height1			= result[1].height,
				firstname2		= '',
				lastname2		= '',
				dateofbirth2	= '',
				sex2			= '',
				height2			= '',
				firstname3		= '',
				lastname3		= '',
				dateofbirth3	= '',
				sex3			= '',
				height3			= ''
			}

			callback(data)

		else

			local data = {
				identifier		= '',
				firstname1		= '',
				lastname1		= '',
				dateofbirth1	= '',
				sex1			= '',
				height1			= '',
				firstname2		= '',
				lastname2		= '',
				dateofbirth2	= '',
				sex2			= '',
				height2			= '',
				firstname3		= '',
				lastname3		= '',
				dateofbirth3	= '',
				sex3			= '',
				height3			= ''
			}

			callback(data)

		end
	end)
end

function setIdentity(identifier, data, callback)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)

	MySQL.Async.execute('INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height)', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	})
end

function updateIdentity(identifier, data, callback)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

function deleteIdentity(identifier, data, callback)
	MySQL.Async.execute('DELETE FROM `characters` WHERE identifier = @identifier AND firstname = @firstname AND lastname = @lastname AND dateofbirth = @dateofbirth AND sex = @sex AND height = @height', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

RegisterServerEvent('esx_identity:setlrhackIdentity')
AddEventHandler('esx_identity:setlrhackIdentity', function(data, myIdentifiers)
	setIdentity(myIdentifiers.steamid, data, function(callback)
		if callback then
			TriggerClientEvent('esx_identity:identityCheck', myIdentifiers.playerid, true)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^[IDENTIDAD]', 'Error al crear identidad, intenta nuevamente!' } })
		end
	end)
end)

AddEventHandler('esx:playerLoaded', function(source)
	local myID = {
		steamid = GetPlayerIdentifiers(source)[1],
		playerid = source
	}

	TriggerClientEvent('esx_identity:saveID', source, myID)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('esx_identity:identityCheck', source, false)
			TriggerClientEvent('esx_identity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx_identity:identityCheck', source, true)
			Citizen.Wait(3700)
			TriggerClientEvent('srp-spawn:setNui', source)
		end
	end)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(3000)

		-- Set all the client side variables for connected users one new time
		local xPlayers, xPlayer = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			xPlayer = ESX.GetPlayerFromId(xPlayers[i])

			local myID = {
				steamid  = xPlayer.identifier,
				playerid = xPlayer.source
			}

			TriggerClientEvent('esx_identity:saveID', xPlayer.source, myID)

			getIdentity(xPlayer.source, function(data)
				if data.firstname == '' then
					TriggerClientEvent('esx_identity:identityCheck', xPlayer.source, false)
					TriggerClientEvent('esx_identity:showRegisterIdentity', xPlayer.source)
				else
					TriggerClientEvent('esx_identity:identityCheck', xPlayer.source, true)
				end
			end)
		end
	end
end)
ESX.RegisterCommand('register', 'user', function(xPlayer, args, showError)
	getCharacters(xPlayer.source, function(data)
		if data.firstname3 ~= '' then
			TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^[IDENTIDAD]', 'Solo podes tener hasta 3 registros. Usa ^3/chardel^0  para borrar los actuales. Recuerda que necesitas permiso de un administrador, esto quedara registrado.' } })
		else
			TriggerClientEvent('esx_identity:showRegisterIdentity', xPlayer.source, {})
		end
	end)
end, false, {help = "Register a new character"})

ESX.RegisterCommand('char', 'user', function(xPlayer, args, showError)
	getIdentity(xPlayer.source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'No tenes un personaje activo!' } })
		else
			TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Personaje activo: ^2' .. data.firstname .. ' ' .. data.lastname } })
		end
	end)
end, false, {help = "Lista de personajes"})



ESX.RegisterCommand('charlist', 'user', function(xPlayer, args, showError)
	getCharacters(source, function(data)
		if data.firstname1 ~= '' then
			TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD] Personaje 1:', data.firstname1 .. ' ' .. data.lastname1 } })
			
			if data.firstname2 ~= '' then
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD] Personaje 2:', data.firstname2 .. ' ' .. data.lastname2 } })
				
				if data.firstname3 ~= '' then
					TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD] Personaje 3:', data.firstname3 .. ' ' .. data.lastname3 } })
				end
			end
		else
			TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^[IDENTIDAD]', 'No tenes personajes registrados. Usa ^3/register^0 (SE REQUIERE AUTORIZACION ADMINISTRATIVA, ESTO QUEDA REGISTRADO).' } })
		end
	end)
end, false, {help = "Lista de tus personajes registrados"})



ESX.RegisterCommand('charselect', 'user', function(xPlayer, args, showError)
	local charNumber = tonumber(args[1])

	if charNumber == nil or charNumber > 3 or charNumber < 1 then
		TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^[IDENTIDAD]', 'Ese personaje es invalido!' } })
		return
	end

	getCharacters(xPlayer.source, function(data)
		if charNumber == 1 then
			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname1,
				lastname	= data.lastname1,
				dateofbirth	= data.dateofbirth1,
				sex			= data.sex1,
				height		= data.height1
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(xPlayer.source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Actualizado tu personaje a ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'No tenes personaje en el espacio 1!' } })
			end
		elseif charNumber == 2 then

			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname2,
				lastname	= data.lastname2,
				dateofbirth	= data.dateofbirth2,
				sex			= data.sex2,
				height		= data.height2
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(xPlayer.source)[1], data, function(callback)

					if callback then
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Actualizado tu personaje a ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'No tenes personaje en el espacio 2!' } })
			end
		elseif charNumber == 3 then

			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname3,
				lastname	= data.lastname3,
				dateofbirth	= data.dateofbirth3,
				sex			= data.sex3,
				height		= data.height3
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(xPlayer.source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Actualizado tu personaje a ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'No tenes personaje en el espacio 3!' } })
			end
		else
			TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Failed to update your identity, try again later or contact the server admin!' } })
		end

	end)
end, false,{help = "Switch between character", params = {{name = "char", help = "El rango de registro es de 1-3"}}})


ESX.RegisterCommand('chardel', 'user', function(xPlayer, args, showError)
	local charNumber = tonumber(args[1])

	if charNumber == nil or charNumber > 3 or charNumber < 1 then
		TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^[IDENTIDAD]', 'That\'s an invalid character!' } })
		return
	end

	getCharacters(xPlayer.source, function(data)

		if charNumber == 1 then

			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname1,
				lastname	= data.lastname1,
				dateofbirth	= data.dateofbirth1,
				sex			= data.sex1,
				height		= data.height1
			}

			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(xPlayer.source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Has removido ^1' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'No tienes nada en 1!' } })
			end

		elseif charNumber == 2 then

			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname2,
				lastname	= data.lastname2,
				dateofbirth	= data.dateofbirth2,
				sex 		= data.sex2,
				height		= data.height2
			}

			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(xPlayer.source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Has removido ^1' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'No tienes nada en 2!' } })
			end

		elseif charNumber == 3 then

			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname3,
				lastname	= data.lastname3,
				dateofbirth	= data.dateofbirth3,
				sex			= data.sex3,
				height		= data.height3
			}

			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(xPlayer.source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Has removido ^1' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'No tienes nada en 3!' } })
			end
		else
			TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1[IDENTIDAD]', 'Error al borrar personaje, intenta nuevamente!' } })
		end
	end)
end, false, {help = "Delete a registered character", params = {{name = "char", help = "El rango de registro es de 1-3"}}})
