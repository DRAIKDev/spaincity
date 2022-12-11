webhookUrl = 'https://discord.com/api/webhooks/881561852629377075/kZ2Ez-3csZOTg-hmLe9ALYuEZ9WguUXzSWQEHBtOS9mw8JzylnXCukWtYzHbcTE2jnrp'
webhookUrl1 = 'https://discord.com/api/webhooks/882022997496578169/P417oMSlWr-Xe3f_86lntUkfx2XpchLMomc0K2A5Ng_SbFGSPSt7impGydbkPAbTKE4l'

ESX.RegisterCommand('setcoords', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	xPlayer.setCoords({x = args.x, y = args.y, z = args.z})
	end
end, false, {help = _U('command_setcoords'), validate = true, arguments = {
	{name = 'x', help = _U('command_setcoords_x'), type = 'number'},
	{name = 'y', help = _U('command_setcoords_y'), type = 'number'},
	{name = 'z', help = _U('command_setcoords_z'), type = 'number'}
}})

ESX.RegisterCommand('tp', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local x = tonumber(args[1])
	local y = tonumber(args[2])
	local z = tonumber(args[3])

	if x and y and z then
		TriggerClientEvent('esx:teleport', xPlayer.source, {
			x = x,
			y = y,
			z = z
		})
	else
		TriggerClientEvent('chatMessage', xPlayer.source, 'SYSTEM', {255, 0, 0}, 'Coords no validas!')
	end
end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, false, {help = 'Tp a las coordenadas', validate = true, arguments = {
	{name = 'x', help = 'X coords'},
	{name = 'y', help = 'Y coords'},
	{name = 'z', help = 'Z coords'}
}})



ESX.RegisterCommand('setjob', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local pName = GetPlayerName(xPlayer.source)

	if ESX.DoesJobExist(args.job, args.grade)  then
		args.playerId.setJob(args.job, args.grade)
		logslegacy('**LOG:**\n\n **Comando:** SetJob\n **Argumento del comando:** ' ..args.job..''.. args.grade.. '\n**ID de steam:** '..pName..  '')	

	else
		showError(_U('command_setjob_invalid'))
	end
	end
end, true, {help = _U('command_setjob'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'job', help = _U('command_setjob_job'), type = 'string'},
	{name = 'grade', help = _U('command_setjob_grade'), type = 'number'},

}})



ESX.RegisterCommand('car', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local pName = GetPlayerName(xPlayer.source)
	xPlayer.triggerEvent('esx:spawnVehicle', args.car)
	logslegacy('**LOG:**\n\n **Comando:** Car\n **Argumento del comando:** ' ..args.car..'\n**ID de steam:** '..pName..  '')	
	end
end, false, {help = _U('command_car'), validate = false, arguments = {
	{name = 'car', help = _U('command_car_car'), type = 'any'},

}})

ESX.RegisterCommand({'cardel', 'dv'}, 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	xPlayer.triggerEvent('esx:deleteVehicle', args.radius)
	end
end, false, {help = _U('command_cardel'), validate = false, arguments = {
	{name = 'radius', help = _U('command_cardel_radius'), type = 'any'}
}})

ESX.RegisterCommand({'cardel', 'dv'}, 'mod', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	xPlayer.triggerEvent('esx:deleteVehicle', args.radius)
	end
end, false, {help = _U('command_cardel'), validate = false, arguments = {
	{name = 'radius', help = _U('command_cardel_radius'), type = 'any'}
}})

ESX.RegisterCommand('setaccountmoney', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local pName = GetPlayerName(xPlayer.source)

	if args.playerId.getAccount(args.account) then
		args.playerId.setAccountMoney(args.account, args.amount)
		logslegacy('**LOG:**\n\n **Comando:** setaccountmoney\n **Argumento del comando:** ' ..args.account..'---'..args.amount..'\n**ID de steam:** '..pName..  '')	

	else
		showError(_U('command_giveaccountmoney_invalid'))
	end
end
end, true, {help = _U('command_setaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_giveaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_setaccountmoney_amount'), type = 'number'}
}})

ESX.RegisterCommand('giveaccountmoney', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local pName = GetPlayerName(xPlayer.source)

	if args.playerId.getAccount(args.account) then
		args.playerId.addAccountMoney(args.account, args.amount)
		logslegacy('**LOG:**\n\n **Comando:** Giveaccountmoney\n **Argumento del comando:** ' ..args.account..'---'..args.amount..'\n**ID de steam:** '..pName..  '')	

	else
		showError(_U('command_giveaccountmoney_invalid'))
	end
	end
end, true, {help = _U('command_giveaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_giveaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_giveaccountmoney_amount'), type = 'number'}
}})

ESX.RegisterCommand('giveitem', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local pName = GetPlayerName(xPlayer.source)

	args.playerId.addInventoryItem(args.item, args.count)
	logslegacy('**LOG:**\n\n **Comando:** giveitem\n **Argumento del comando:** ' ..args.item..'---'..args.count..'\n**ID de steam:** '..pName..  '')	
	end

end, true, {help = _U('command_giveitem'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'item', help = _U('command_giveitem_item'), type = 'item'},
	{name = 'count', help = _U('command_giveitem_count'), type = 'number'}
}})

ESX.RegisterCommand('giveweapon', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local pName = GetPlayerName(xPlayer.source)

	if args.playerId.hasWeapon(args.weapon) then
		showError(_U('command_giveweapon_hasalready'))
	else
		xPlayer.addWeapon(args.weapon, args.ammo)
		logslegacy('**LOG:**\n\n **Comando:** Giveweapon\n **Argumento del comando:** ' ..args.weapon..'---'..args.ammo..'\n**ID de steam:** '..pName..  '')	

	end
end
end, true, {help = _U('command_giveweapon'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'weapon', help = _U('command_giveweapon_weapon'), type = 'weapon'},
	{name = 'ammo', help = _U('command_giveweapon_ammo'), type = 'number'}
}})

ESX.RegisterCommand('giveweaponcomponent', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	if args.playerId.hasWeapon(args.weaponName) then
		local component = ESX.GetWeaponComponent(args.weaponName, args.componentName)

		if component then
			if xPlayer.hasWeaponComponent(args.weaponName, args.componentName) then
				showError(_U('command_giveweaponcomponent_hasalready'))
			else
				xPlayer.addWeaponComponent(args.weaponName, args.componentName)
			end
		else
			showError(_U('command_giveweaponcomponent_invalid'))
		end
	else
		showError(_U('command_giveweaponcomponent_missingweapon'))
	end
end
end, true, {help = _U('command_giveweaponcomponent'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'weaponName', help = _U('command_giveweapon_weapon'), type = 'weapon'},
	{name = 'componentName', help = _U('command_giveweaponcomponent_component'), type = 'string'}
}})
ESX.RegisterCommand('darskin', 'mod', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	local pName = GetPlayerName(xPlayer.source)
	logslegacy('**LOG:**\n\n **Comando:** Darskin\n **Acaba de otorgar a un usuario un skin:** ID de steam:** '..pName..  '')	
    args.playerId.triggerEvent('esx_skin:openSaveableMenu')
    args.playerId.triggerEvent('chat:addMessage', {args = {'[^1AVISO^0]', 'Un administrador te dio el skin menu.'}})
	end
end, true, {help = 'Dale el menu de la skin al jugador o a ti mismo con "/giveskinmenu me"', validate = true, arguments = {
    {name = 'playerId', help = 'ID', type = 'player'}
}})


ESX.RegisterCommand({'clear', 'cls'}, 'user', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	xPlayer.triggerEvent('chat:clear')
	end
end, false, {help = _U('command_clear')})

ESX.RegisterCommand({'clear', 'cls'}, 'mod', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
		xPlayer.triggerEvent('chat:clear')
		end
	end, false, {help = _U('command_clear')})

ESX.RegisterCommand({'clearall', 'clsall'}, 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then

	TriggerClientEvent('chat:clear', -1)
	end
end, false, {help = _U('command_clearall')})

ESX.RegisterCommand('clearinventory', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then

	for k,v in ipairs(args.playerId.inventory) do
		if v.count > 0 then
			args.playerId.setInventoryItem(v.name, 0)
		end
	end
end
end, true, {help = _U('command_clearinventory'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('clearloadout', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	for k,v in ipairs(args.playerId.loadout) do
		args.playerId.removeWeapon(v.name)
	end
	end
end, true, {help = _U('command_clearloadout'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('setgroup', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then
	args.playerId.setGroup(args.group)
	end
end, true, {help = _U('command_setgroup'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'group', help = _U('command_setgroup_group'), type = 'string'},
}})

ESX.RegisterCommand('save', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then

	ESX.SavePlayer(args.playerId)
	end
end, true, {help = _U('command_save'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('saveall', 'admin', function(xPlayer, args, showError)
	if xPlayer.getadministrando then

	ESX.SavePlayers()
	end
end, true, {help = _U('command_saveall')})

ESX.RegisterCommand('players', "admin", function(xPlayer, args, showError)
	if xPlayer.getadministrando then

	local xAll = ESX.GetExtendedPlayers()
	print("^5"..#xAll.." ^2online player(s)^0")
	end
end, true)


RegisterCommand("administrar",function(a)
	local xPlayer = ESX.GetPlayerFromId(a)
	local status = xPlayer.getadministrando()
	local group = xPlayer.getGroup()
	local discord = "n/a"
	for k,v in ipairs(GetPlayerIdentifiers(a))do
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v:gsub("discord:", "")
		end
	end
	if group ~= "user" then 
		if discord == "n/a" then
			xPlayer.showNotification("Para administrar tienes que tener la cuenta de discord vinculada.")
		else
		if not status then
			xPlayer.setadministrando(true)
			TriggerClientEvent("cambiarlogoadmdsahdkjas",a,true)
			xPlayer.showNotification("Has entrado a administrar")
					PerformHttpRequest("51.178.193.225:2500/apiv2/administrador", function(err, text, headers) 
						end, 'POST', 
						json.encode(
									{ 
										['data'] = "entrada", 
										['steam'] = xPlayer.identifier, 
										['discord'] = discord, 
										['steamname'] = GetPlayerName(a), 
										['rango'] = group 
									}
								), 
							{ 
								['Content-Type'] = 'application/json' 
							}
					)
					
				
		else
			xPlayer.setadministrando(false)
			TriggerClientEvent("cambiarlogoadmdsahdkjas",a,false)
				if status then 
					xPlayer.showNotification("Has salido de administrar")

					PerformHttpRequest("51.178.193.225:2500/apiv2/administrador", function(err, text, headers) 
	
						end, 'POST', 
						json.encode(
									{ 
										['data'] = "salida", 
										['steam'] = xPlayer.identifier, 
										['discord'] = discord, 
										['steamname'] = GetPlayerName(a), 
										['rango'] = group 
									}
								), 
							{ 
								['Content-Type'] = 'application/json' 
							}
					)
				end	
			
		end
	end
	end
	end)

	AddEventHandler('esx:playerDropped', function(a)
		local xPlayer = ESX.GetPlayerFromId(a)
		local status = xPlayer.getadministrando()
		local discord = "NULL"
		for k,v in ipairs(GetPlayerIdentifiers(a))do
			if string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v:gsub("discord:", "")
			end
		end
			if status then 
				PerformHttpRequest("51.178.193.225:2500/apiv2/administrador", function(err, text, headers) 
					end, 'POST', 
					json.encode(
								{ 
									['data'] = "salida", 
									['steam'] = xPlayer.identifier, 
									['discord'] = discord, 
									['steamname'] = GetPlayerName(a), 
									['rango'] = xPlayer.getGroup() 
								}
							), 
						{ 
							['Content-Type'] = 'application/json' 
						}
						)
			end	
		
		
	end)


RegisterNetEvent('telogeoporquemesaledelapolla')
AddEventHandler('telogeoporquemesaledelapolla', function()
	local pName = GetPlayerName(source)
	logeodee('**LOG:**\n\n **TIRAR DE E**\n **Argumento:* TRUE, HA TIRADO DE CABLE \n**ID de steam:** '..pName..'')	
end)


logeodee = function(message)
		PerformHttpRequest(webhookUrl1, function(err, text, headers) end, 
		'POST', json.encode(
			{username = "DRAIK ᵈᵉᵛ", 
			embeds = {
				{["color"] = color, 
				["author"] = {
				["name"] = "Tirar Logs",
				["icon_url"] = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"},
				["description"] = "".. message .."",
				["footer"] = {
				["text"] = "DRAIK ᵈᵉᵛ - "..os.date("%x %X %p"),
				["icon_url"] = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png",},}
			}, avatar_url = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"}), {['Content-Type'] = 'application/json' })
end
	
	
logslegacy = function(message)
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 
    'POST', json.encode(
        {username = "DRAIK ᵈᵉᵛ", 
        embeds = {
            {["color"] = color, 
            ["author"] = {
            ["name"] = "Extended Logs",
            ["icon_url"] = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"},
            ["description"] = "".. message .."",
            ["footer"] = {
            ["text"] = "DRAIK ᵈᵉᵛ - "..os.date("%x %X %p"),
            ["icon_url"] = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png",},}
        }, avatar_url = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"}), {['Content-Type'] = 'application/json' })
end
--[[
RegisterCommand("administrarv2",function(a)
	local xPlayer = ESX.GetPlayerFromId(a)
	local status = xPlayer.getadministrando()
	local group = xPlayer.getGroup()
	local discord = "n/a"

	if IsPlayerAceAllowed(a, "DRAIKESUNBELLEZONTOCHO") then

	for k,v in ipairs(GetPlayerIdentifiers(a))do
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v:gsub("discord:", "")
		end
	end
	if group ~= "user" then 
		if discord == "n/a" then
			xPlayer.showNotification("Para administrar tienes que tener la cuenta de discord vinculada.")
		else
		if not status then
			xPlayer.setadministrando(true)
			TriggerClientEvent("cambiarlogoadmdsahdkjas",a,true)
			xPlayer.showNotification("Has entrado a administrar")
					PerformHttpRequest("51.178.193.225:2500/apiv2/administradorv2", function(err, text, headers) 
						end, 'POST', 
						json.encode(
									{ 
										['data'] = "entrada", 
										['encargo'] = "SI", 
										['steam'] = xPlayer.identifier, 
										['discord'] = discord, 
										['steamname'] = GetPlayerName(a), 
										['rango'] = group 
									}
								), 
							{ 
								['Content-Type'] = 'application/json' 
							}
					)
					
				
		else
			xPlayer.setadministrando(false)
			TriggerClientEvent("cambiarlogoadmdsahdkjas",a,false)
				if status then 
					xPlayer.showNotification("Has salido de administrar")

					PerformHttpRequest("51.178.193.225:2500/apiv2/administradorv2", function(err, text, headers) 
	
						end, 'POST', 
						json.encode(
									{ 
										['data'] = "salida", 
										['encargo'] = "SI", 
										['steam'] = xPlayer.identifier, 
										['discord'] = discord, 
										['steamname'] = GetPlayerName(a), 
										['rango'] = group 
									}
								), 
							{ 
								['Content-Type'] = 'application/json' 
							}
					)
				end	
			
		end
	end
	end
end
	end)

	AddEventHandler('esx:playerDropped', function(a)
		local xPlayer = ESX.GetPlayerFromId(a)
		local status = xPlayer.getadministrando()
		local discord = "NULL"
		for k,v in ipairs(GetPlayerIdentifiers(a))do
			if string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v:gsub("discord:", "")
			end
		end
			if status then 
				PerformHttpRequest("51.178.193.225:2500/apiv2/administradorv2", function(err, text, headers) 
					end, 'POST', 
					json.encode(
								{ 
									['data'] = "salida", 
									['encargo'] = "SI", 

									['steam'] = xPlayer.identifier, 
									['discord'] = discord, 
									['steamname'] = GetPlayerName(a), 
									['rango'] = xPlayer.getGroup() 
								}
							), 
						{ 
							['Content-Type'] = 'application/json' 
						}
						)
			end	
		
		
	end)
]]