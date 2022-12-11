ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		--TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', '['..source..']'), message }, color = { 128, 128, 128 } })
		TriggerClientEvent('chatMessage', source, 'Error', {236, 255, 0}, "El chat ooc global ha sido desactivado, para solicitar ayuda, use /report y por último para enviar un mensaje OOC local usa /ooc")

	end
end)

 RegisterCommand('comunidad', function(source, args, rawCommand)
 	if source == 0 then
 		print('esx_rpchat: you can\'t use this command from rcon!')
 		return
 	end

 	args = table.concat(args, ' ')
 	local name = GetPlayerName(source)
 	if Config.EnableESXIdentity then name = GetPlayerName(source) end

 	TriggerClientEvent('chat:addMessage', -1, { args = { _U('help_prefix', '[' ..source.. '] '..name), args }, color = { 128, 128, 128 } })
 	--print(('%s: %s'):format(name, args))
 end, false)


 
 RegisterCommand('poli', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('pregpoli', '[' ..source.. '] '..name), args }, color = { 128, 128, 128 } })
end, false)



RegisterCommand('taxi', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "taxi" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('taxi_prefix', '['..source..']'), args }, color = { 255, 227, 51 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

	----		-- LOCALES --		----

RegisterCommand('baducentral', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "baducentral" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('baducentral_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('badupaleto', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "badunorte" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('badunorte_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('badusandy', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "badusandy" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('badusandy_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('bahamas', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "bahamas" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('bahamas_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('gym', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "gymjob" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('gymjob_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('abogado', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "abogado" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('abogado_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('pearls', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "citypearls" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('citypearls_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('cyber', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "cyber" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('cyber_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('galaxy', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "galaxy" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('galaxy_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)


RegisterCommand('tequila', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "tequila" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('tequila_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('vanilla', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "vanilla" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('vanilla_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)


RegisterCommand('cafeteriapaleto', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "pbcafeteria" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('pbcafeteria_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('henhouse', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "pbdiscoteca" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('pbdiscoteca_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('yellow', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "pbyellow" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('pbyellow_prefix', '['..source..']'), args }, color = { 255, 0, 0 } })
--print(('%s: %s'):format(name, args))
	end
end, false)



-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


----- 		---- TALLERES ----		-----


RegisterCommand('meca', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('meca_prefix', '['..source..']'), args }, color = { 155, 0, 255 } })
--print(('%s: %s'):format(name, args))
	end
end, false)


RegisterCommand('mecapaleto', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic01" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('mechanic01_prefix', '['..source..']'), args }, color = { 155, 0, 255 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

RegisterCommand('mecamesa', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic02" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('mechanic02_prefix', '['..source..']'), args }, color = { 155, 0, 255 } })
--print(('%s: %s'):format(name, args))
	end
end, false)





-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------



RegisterCommand('mosso', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "police" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('pol_prefix', '['..source..']'), args }, color = { 94, 161, 224 } })
--print(('%s: %s'):format(name, args))
	end
end, false)
RegisterCommand('cnp', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "cnp" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('cnp_prefix', '['..source..']'), args }, color = { 94, 161, 224 } })
--print(('%s: %s'):format(name, args))
	end
end, false)
RegisterCommand('agc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "military" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('fas_prefix', '['..source..']'), args }, color = { 13, 137, 30 } })
--print(('%s: %s'):format(name, args))
	end
end, false)
RegisterCommand('ems', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "ambulance" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ems_prefix', '['..source..']'), args }, color = { 255, 51, 51 } })
--print(('%s: %s'):format(name, args))
	end
end, false)

-- RegisterCommand('news', function(source, args, rawCommand)
-- 	rawCommand = string.sub(rawCommand, 5)
-- 	local name = GetPlayerName(source)
-- 	if Config.EnableESXIdentity then name = GetCharacterName(source) end

-- 	TriggerClientEvent('chat:addMessage', -1, { args = { _U('news_prefix', '['..source..'] '), rawCommand }, color = { 249, 166, 0 } })
-- end, false)

RegisterCommand('twt', function(source, args, rawCommand)
	TriggerClientEvent('chatMessage', source, 'Error', {236, 30, 0}, "El twitter se encuentra en el movil.")

	--if source == 0 then
	--	print('esx_rpchat: you can\'t use this command from rcon!')
	--	return
	--end
--
	--args = table.concat(args, ' ')
	--local name = GetPlayerName(source)
	--if Config.EnableESXIdentity then name = GetCharacterName(source) end
--
	--TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', '['..source..']'), args }, color = { 0, 153, 204 } })
	----print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('anon', function(source, args, rawCommand)
	TriggerClientEvent('chatMessage', source, 'Error', {236, 30, 0}, "El chat anonimo ha sido retirado, para hacer conversaciones ilicitas usa otra herramienta.")

	-- if source == 0 then
	-- 	print('esx_rpchat: you can\'t use this command from rcon!')
	-- 	return
	-- end

	-- args = table.concat(args, ' ')
	-- local name = GetPlayerName(source)
	-- if Config.EnableESXIdentity then name = GetCharacterName(source) end

	-- TriggerClientEvent('chat:addMessage', -1, { args = { _U('anon_prefix', '['..source..'] '), args }, color = { 255, 0, 0 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('me', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local id = source
	local name = GetPlayerName(source)
	-- TriggerClientEvent('esx_rpchat:sendProximityMessageME', -1, source, _U('me_prefix', "["..id.."] "..name), args, { 255, 50, 0 })

	TriggerClientEvent('esx_rpchat:sendProximityMessageME', -1, source, _U('me_prefix', "["..id.."] "), args, { 255, 50, 0 })
	--print(('%s: %s'):format(name, args))
end, false, {help = '/me', arguments = {name = 'msg', help = 'Pon un mensaje', type = 'player'}})

RegisterCommand('do', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local id = source
	local name = GetPlayerName(source)
	TriggerClientEvent('esx_rpchat:sendProximityMessageDo', -1, source, _U('do_prefix',"["..id.."]"), args, { 0, 191, 255 })

	-- TriggerClientEvent('esx_rpchat:sendProximityMessageDo', -1, source, _U('do_prefix',"["..id.."] "..name), args, { 0, 191, 255 })
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	

	args = table.concat(args, ' ')
	local id = source
	local name = GetPlayerName(source)
	TriggerClientEvent('esx_rpchat:sendProximityMessageOOP', -1, source, _U('oop_prefix',"["..id.."] "..name), args, { 255, 255, 255 })
end, false)
RegisterCommand('JHSDJAHDJAKDHJSDHUHNJHNLSHJDA', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	

	args = table.concat(args, ' ')
	local id = source
	local name = GetPlayerName(source)
	TriggerClientEvent('esx_rpchat:sendProximityMessageOOP', -1, source, _U('oop2_prefix',"["..id.."] "), args, { 255, 255, 255 })
end, false)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
local logEnabled = true


RegisterCommand('policia', function(source, args, user)
local xPlayer = ESX.GetPlayerFromId(source)
	local args = table.concat(args, " ")
	local xPlayers = ESX.GetExtendedPlayers('job', 'cnp')
	local playerName = GetCharacterName(source)
	if xPlayer.job.name == 'cnp' then
		if string.gsub(args, "%s$", "") ~= '' then
			for _, xPlayer in pairs(xPlayers) do
				TriggerClientEvent('chatMessage', xPlayer.source,"", {255, 0, 0}, "^4[^*^0 Radio - Policía Nacional ^4] ^r^4 " .. playerName .."  "..": ^0" .. args)
			end
		end
	end
end,false)

RegisterCommand('radiomosso', function(source, args, user)
local xPlayer = ESX.GetPlayerFromId(source)
	local args = table.concat(args, " ")
	local xPlayers = ESX.GetExtendedPlayers('job', 'cnp')
	local playerName = GetCharacterName(source)
	if xPlayer.job.name == 'police' then
		if string.gsub(args, "%s$", "") ~= '' then
			for _, xPlayer in pairs(xPlayers) do
				TriggerClientEvent('chatMessage', xPlayer.source,"", {255, 0, 0}, "^4[^*^0 Radio - MOSSOS ^4] ^r^4 " .. playerName .."  "..": ^0" .. args)
			end
		end
	end
end,false)

RegisterCommand('gc', function(source, args, user)
	local args = table.concat(args, " ")
	if string.gsub(args, "%s$", "") ~= '' then
		local playerName = GetCharacterName(source)

		TriggerClientEvent("RadioMilitares", -1, source, playerName, args, ESX.GetPlayerFromId(source))
	end
end,false)

RegisterCommand('radio', function(source, args, user)
	local args = table.concat(args, " ")
	if string.gsub(args, "%s$", "") ~= '' then
		local playerName = GetCharacterName(source)

		TriggerClientEvent("sendGCFAS", -1, source, playerName, args, ESX.GetPlayerFromId(source))
	end
end,false)


function GetGroup(source)
	local identifier = GetPlayerIdentifiers(source)[2]
	if string.match(identifier, 'license:') then
        identifier = string.sub(identifier, 9)
    end
	local result = MySQL.Sync.fetchAll("SELECT `group` FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			group = identity['group']
		}
	else
		return nil
	end
end

RegisterServerEvent("esx_rpchat:getGroup")
AddEventHandler("esx_rpchat:getGroup", function(toggle)
	TriggerClientEvent("esx_rpchat:getGroup", -1, source, toggle)
end)


ESX.RegisterServerCallback('esx_rpchat:getPlayerData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source).getGroup()
	cb(xPlayer)
end)




RegisterCommand('dados', function(source, args, user)
    local name = GetPlayerName(source)
	local args = math.random(1, 6)
	local id = source
	TriggerClientEvent('esx_rpchat:sendProximityMessageME', -1, source, ("Dados ["..id.."] " ..name), args, { 0, 255, 0 })

    -- TriggerClientEvent("esx_rpchat:sendProximityMessageME", -1, source, name, num, table.concat(args, " "))
  end, false)
  
  --- STRING SPLIT FUNCTION ---
  function stringsplit(inputstr, sep)
      if sep == nil then
          sep = "%s"
      end
      local t={} ; i=1
      for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          t[i] = str
          i = i + 1
      end
      return t
  end