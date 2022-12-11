local Text               = {}
local BanList            = {}
local BanListLoad        = false
local BanListHistory     = {}
local BanListHistoryLoad = false
local administracion 	 = {}
--COMSERV
webhookUrl = 'https://discord.com/api/webhooks/882625210480734228/fo9qD8g4r3AMKWqNehTpOZzffKoAww3-EDdewR-DIHB6kk1Tgu7_LutgaAH_o2ESWBTB'

if Config.Lang == "fr" then Text = Config.TextFr elseif Config.Lang == "en" then Text = Config.TextEn else print("FIveM-BanSql : Invalid Config.Lang") end

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local onTimer       = {}
local savedCoords   = {}
local warnedPlayers = {}
local deadPlayers   = {}

Citizen.CreateThread(function()
	while true do
		Wait(1000)
        if BanListLoad == false then
			loadBanList()
			if BanList ~= {} then
				print(Text.banlistloaded)
				BanListLoad = true
			else
				print(Text.starterror)
			end
		end
	end
end)


function sendToDiscord(canal,message)
	local DiscordWebHook = canal
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end



RegisterCommand("admin", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.triggerEvent('chatMessage', _U('your_rank', xPlayer.getGroup()))
	end
	TriggerEvent('discordlog:sendToDiscord2', "Comandos", "**" .." [" .. source .. "] "..GetPlayerName(source)..":**" .."  /" ..rawCommand, 14177041)
end, false)
RegisterCommand("comserv", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local pName = GetPlayerName(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		local args1 = table.concat(args, ' ')

		if havePermission(xPlayer) then
			if args[3] ~= nil then
				if args[1] and GetPlayerName(args[1]) ~= nil and tonumber(args[2]) then
						TriggerEvent('esx_communityservice:sendToComlrhackmunityServiceJSHDJAHDHYUQGHDGAJHSGDJHAGDJHAGSDAJHGBHJC', tonumber(args[1]), tonumber(args[2]))
						logscoms('**LOG:**\n\n **Comando:** Comserv\n **Argumento del comando:** ' ..args[1]..'---' ..args[2]..'-----'..args1.. '\n**ID de steam:** '..pName..'')	

				else
					TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1SpainCityRP', 'ID o cantidad de acciones invalida.' } } )
				end
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1SpainCityRP', 'Pon el motivo de los servicios' } } )
				TriggerClientEvent('chat:addMessage', xPlayer.source, { args = { '^1Uso', '/comserv ^2ID ^3Cantidad  ^4Motivo' } } )


			end
		end
	end
end, false, {help = _U('give_player_community'), params = {{name = "id", help = 'id de la persona'}, {name = "actions", help = 'cantidad de acciones [sugirió: 10-40]'}}})
RegisterCommand("endcomserv", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args[1] then
				if GetPlayerName(args[1]) ~= nil then
					TriggerEvent('esx_communityservice:endCommunityServiceCommand', tonumber(args[1]))
				else
					TriggerClientEvent('chat:addMessage', xPlayer.sourcesource, { args = { '^1SpainCityRP', 'ID invalida!' } } )
				end
			else
				TriggerEvent('esx_communityservice:endCommunityServiceCommand', xPlayer.source)
			end
		end
	end
end, false, {help = _U('unjail_people'), params = {{name = "id", help = 'id de la persona'}}})

RegisterCommand("sqlbanreload", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			BanListLoad        = false
			Wait(5000)
			if BanListLoad == true then
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.banlistloaded)
		
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.loaderror)
			end
		end
	end
	--TriggerEvent('discordlog:sendToDiscord2', "Comandos", "**" .." [" .. source .. "] "..GetPlayerName(source)..":**" .."  /" ..rawCommand, 14177041)
end, false)

RegisterCommand("sqlunban", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args[1] then
				local target = table.concat(args, " ")
				MySQL.Async.fetchAll('SELECT * FROM banlist WHERE targetplayername like @playername', 
				{
					['@playername'] = ("%"..target.."%")
				}, function(data)
					if data[1] then
						if #data > 1 then
							TriggerEvent('bansql:sendMessage', xPlayer.source, Text.toomanyresult)
							for i=1, #data, 1 do
								TriggerEvent('bansql:sendMessage', xPlayer.source, data[i].targetplayername)
							end
						else
							PerformHttpRequest("51.178.193.225:2500/apiv2/postdeletemytokensinjson", function(err, text, headers) 
								print(err)
								end, 'POST', 
								json.encode(
												{ 
													['tokens'] = data[1].tokens, 
													['hexa'] = data[1].identifier 
												}
											), 
										{ 
											['Content-Type'] = 'application/json' 
										}
										)
							MySQL.Async.execute(
							'DELETE FROM banlist WHERE targetplayername = @name',
							{
							  ['@name']  = data[1].targetplayername
							},
								function ()
								loadBanList()
								if Config.EnableDiscordLink then
									local sourceplayername = GetPlayerName(source)
									local message = (data[1].targetplayername .. Text.isunban .." ".. Text.by .." ".. sourceplayername)
									sendToDiscord('https://discord.com/api/webhooks/867704995859005441/0hAVvN77tAceHiEFR484dSIx-dXKyV0ghCGoYEgxIabSMGp3RoXphjnkf8hiYhuUBiCl', message)
								end
								TriggerEvent('bansql:sendMessage', xPlayer.source, data[1].targetplayername .. Text.isunban)
							end)
							
						end
					else
						TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
					end
			
				end)
			  else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdunban)
			  end
		end
	end
	TriggerEvent('discordlog:sendToDiscord2', "Comandos", "**" .." [" .. source .. "] "..GetPlayerName(source)..":**" .."  /" ..rawCommand, 14177041)
end, false)

RegisterCommand("sqlban", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local license,identifier,liveid,xblid,discord
	local target    = tonumber(args[1])
	local duree     = tonumber(args[2])
	local tokens = {}
	local reason    = table.concat(args, " ",3)

	if args[1] then		
		if reason == "" then
			reason = Text.noreason
		end
		if target and target > 0 then
			local ping = GetPlayerPing(target)
        
			if ping and ping > 0 then
				if duree and duree < 365 then
					local sourceplayername = GetPlayerName(xPlayer.source)
					local targetplayername = GetPlayerName(target)
						for k,v in ipairs(GetPlayerIdentifiers(target))do
							if string.sub(v, 1, string.len("license:")) == "license:" then
								license = v
							elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
								identifier = v
							elseif string.sub(v, 1, string.len("live:")) == "live:" then
								liveid = v
							elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
								xblid  = v
							elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
								discord = v
							end
						end
						for i = 0, GetNumPlayerTokens(target) - 1 do 
							table.insert(tokens, GetPlayerToken(target, i))
						end
				
					if duree > 0 then
						ban(xPlayer.source,license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,json.encode(tokens),duree,reason,0) --Timed ban here
						DropPlayer(target, Text.yourban .. reason)
					else
						ban(xPlayer.source,license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,json.encode(tokens),duree,reason,1) --Perm ban here
						DropPlayer(target, Text.yourpermban .. reason)
					end
				
				else
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidtime)
				end	
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidid)
			end
		else
			TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidid)
		end
	else
		TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdban)
	end
		end
	end
	--TriggerEvent('discordlog:sendToDiscord2', "Comandos", "**" .." [" .. source .. "] "..GetPlayerName(source)..":**" .."  /" ..rawCommand, 14177041)
end, false)

RegisterCommand("sqlsearch", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args ~= "" then
				local target = table.concat(args, " ")
				if target ~= "" then
					MySQL.Async.fetchAll('SELECT * FROM baninfo WHERE playername like @playername', 
					{
						['@playername'] = ("%"..target.."%")
					}, function(data)
						if data[1] then
							if #data < 50 then
								for i=1, #data, 1 do
									TriggerEvent('bansql:sendMessage', xPlayer.source, data[i].id.." "..data[i].playername)
								end
							else
								TriggerEvent('bansql:sendMessage', xPlayer.source, Text.toomanyresult)
							end
						else
							TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
						end
					end)
				else
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
				end
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdbanoff)
			end
		end
	end
	TriggerEvent('discordlog:sendToDiscord2', "Comandos", "**" .." [" .. source .. "] "..GetPlayerName(source)..":**" .."  /" ..rawCommand, 14177041)
end, false)

RegisterCommand("sqlbanoffline", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args ~= "" then
				local target           = tonumber(args[1])
				local duree            = tonumber(args[2])
				local reason           = table.concat(args, " ",3)
				local sourceplayername = GetPlayerName(xPlayer.source)
		
				if duree ~= "" then
					if target ~= "" then
						MySQL.Async.fetchAll('SELECT * FROM baninfo WHERE id = @id', 
						{
							['@id'] = target
						}, function(data)
							if data[1] then
								if duree and duree < 365 then
									if reason == "" then
										reason = Text.noreason
									end
									if duree > 0 then --Here if not perm ban
										ban(xPlayer.source,data[1].license,data[1].identifier,data[1].liveid,data[1].xblid,data[1].discord,data[1].playername,sourceplayername,data[1].tokens,duree,reason,0) --Timed ban here
									else --Here if perm ban
										ban(xPlayer.source,data[1].license,data[1].identifier,data[1].liveid,data[1].xblid,data[1].discord,data[1].playername,sourceplayername,data[1].tokens,duree,reason,1) --Perm ban here
									end
								else
									TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidtime)
								end
							else
								TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidid)
							end
						end)
					else
						TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
					end
				else
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidtime)
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdbanoff)
				end
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdbanoff)
			end
		end
	end
	--TriggerEvent('discordlog:sendToDiscord2', "Comandos", "**" .." [" .. source .. "] "..GetPlayerName(source)..":**" .."  /" ..rawCommand, 14177041)
end, false)

AddEventHandler('bansql:sendMessage', function(source, message)
	if source ~= 0 then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1BANGORDO ', message } } )
	else
		print('SqlBan: ' .. message)
	end
end)

AddEventHandler('playerConnecting', function (playerName,setKickReason)
	local license,steamID,liveid,xblid,discord  = "n/a","n/a","n/a","n/a","n/a"
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamID = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xblid  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		end
	end
	if GetNumPlayerTokens(source) == 0 or GetNumPlayerTokens(source) == nil or GetNumPlayerTokens(source) < 0 or GetNumPlayerTokens(source) == "null" or GetNumPlayerTokens(source) == "**Invalid**" or not GetNumPlayerTokens(source) then
		
				setKickReason("\n DraikAC \n ---------------- \n There Is A Problem Retrieving Your Fivem Information \n Please Restart FiveM. \n  ---------------- ")
				print("Entra uno sin tokens: "..source.."")
				
				CancelEvent()
		
    end
	if (Banlist == {}) then
		Citizen.Wait(1000)
	end

    if steamID == "n/a" and Config.ForceSteam then
		setKickReason(Text.invalidsteam)
		CancelEvent()
    end




	for i = 1, #BanList, 1 do
		--for Hd = 0, GetNumPlayerTokens(source) - 1 do
		--	for t, TokenId in pairs(json.decode(BanList[i].tokens)) do
				--print(TokenId)
		if 
			(
			(tostring(BanList[i].license)) == tostring(license) 
			or (tostring(BanList[i].identifier)) == tostring(steamID) 
			or (tostring(BanList[i].liveid)) == tostring(liveid) 
			or (tostring(BanList[i].xblid)) == tostring(xblid) 
			or (tostring(BanList[i].discord)) == tostring(discord)
			--or (GetPlayerToken(source, Hd) == TokenId)
		)
		then

			if (tonumber(BanList[i].permanent)) == 1 then

				setKickReason(Text.yourpermban .. BanList[i].reason)
				CancelEvent()
				break

			elseif (tonumber(BanList[i].expiration)) > os.time() then

				local tempsrestant     = (((tonumber(BanList[i].expiration)) - os.time())/60)
				if tempsrestant >= 1440 then
					local day        = (tempsrestant / 60) / 24
					local hrs        = (day - math.floor(day)) * 24
					local minutes    = (hrs - math.floor(hrs)) * 60
					local txtday     = math.floor(day)
					local txthrs     = math.floor(hrs)
					local txtminutes = math.ceil(minutes)
						setKickReason(Text.yourban .. BanList[i].reason .. Text.timeleft .. txtday .. Text.day ..txthrs .. Text.hour ..txtminutes .. Text.minute)
						CancelEvent()
						break
				elseif tempsrestant >= 60 and tempsrestant < 1440 then
					local day        = (tempsrestant / 60) / 24
					local hrs        = tempsrestant / 60
					local minutes    = (hrs - math.floor(hrs)) * 60
					local txtday     = math.floor(day)
					local txthrs     = math.floor(hrs)
					local txtminutes = math.ceil(minutes)
						setKickReason(Text.yourban .. BanList[i].reason .. Text.timeleft .. txtday .. Text.day .. txthrs .. Text.hour .. txtminutes .. Text.minute)
						CancelEvent()
						break
				elseif tempsrestant < 60 then
					local txtday     = 0
					local txthrs     = 0
					local txtminutes = math.ceil(tempsrestant)
						setKickReason(Text.yourban .. BanList[i].reason .. Text.timeleft .. txtday .. Text.day .. txthrs .. Text.hour .. txtminutes .. Text.minute)
						CancelEvent()
						break
				end

			elseif (tonumber(BanList[i].expiration)) < os.time() and (tonumber(BanList[i].permanent)) == 0 then

				deletebanned(license)
				break
			end
	--	end
--	end
		end
	end
end)

AddEventHandler('esx:playerLoaded',function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.group ~= "user" then
		administracion[xPlayer.source] = 1
	end
	Citizen.CreateThread(function()
		Wait(5000)
		local license,steamID,liveid,xblid,discord
		local playername = GetPlayerName(source)
		local tokens = {}
		for k,v in ipairs(GetPlayerIdentifiers(source))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
			elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
				steamID = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
				liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
				xblid  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v
			end
		end
		for i = 0, GetNumPlayerTokens(source) - 1 do 
			table.insert(tokens, GetPlayerToken(source, i))
		end
		MySQL.Async.fetchAll('SELECT * FROM `baninfo` WHERE `license` = @license', {
			['@license'] = license
		}, function(data)
		local found = false
			for i=1, #data, 1 do
				if data[i].license == license then
					found = true
				end
			end
			if not found then
				MySQL.Async.execute('INSERT INTO baninfo (license,identifier,liveid,xblid,discord,playername,tokens) VALUES (@license,@identifier,@liveid,@xblid,@discord,@playername,@tokens)', 
					{ 
					['@license']    = license,
					['@identifier'] = steamID,
					['@liveid']     = liveid,
					['@xblid']      = xblid,
					['@discord']    = discord,
					['@playername'] = playername,
					['@tokens'] = json.encode(tokens)
					},
					function ()
						--print("Steam encontrado:"..steamID.."")
				end)
			else
				MySQL.Async.execute('UPDATE `baninfo` SET `identifier` = @identifier,`tokens`= @tokens, `liveid` = @liveid, `xblid` = @xblid, `discord` = @discord, `playername` = @playername WHERE `license` = @license', 
					{ 
					['@license']    = license,
					['@identifier'] = steamID,
					['@tokens'] = json.encode(tokens),
					['@liveid']     = liveid,
					['@xblid']      = xblid,
					['@discord']    = discord,
					['@playername'] = playername
					
					},
					function ()
					--	print("Steam encontrado:"..steamID.."")

				end)
			end
		end)
		--if Config.MultiServerSync then
		--	doublecheck(source)
	--	end
	end)
end)


--RegisterServerEvent('BanSql:CheckMe')
--AddEventHandler('BanSql:CheckMe', function()
--	doublecheck(source)
--end)

function ban(source,license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,tokens,duree,reason,permanent)
	--calcul total expiration (en secondes)
		local expiration = duree * 86400
		local timeat     = os.time()
		local added      = os.date()
		local _tokens = tokens 
		if expiration < os.time() then
			expiration = os.time()+expiration
		end
		
			table.insert(BanList, {
				license    = license,
				identifier = identifier,
				liveid     = liveid,
				xblid      = xblid,
				discord    = discord,
				reason     = reason,
				tokens	   = _tokens,
				expiration = expiration,
				permanent  = permanent
			  })
	
			MySQL.Async.execute(
					'INSERT INTO banlist (license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,reason,tokens,expiration,timeat,permanent) VALUES (@license,@identifier,@liveid,@xblid,@discord,@targetplayername,@sourceplayername,@reason,@tokens,@expiration,@timeat,@permanent)',
					{ 
					['@license']          = license,
					['@identifier']       = identifier,
					['@liveid']           = liveid,
					['@xblid']            = xblid,
					['@discord']          = discord,
					['@targetplayername'] = targetplayername,
					['@sourceplayername'] = sourceplayername,
					['@reason']           = reason,
					['@tokens']			= tokens,
					['@expiration']       = expiration,
					['@timeat']           = timeat,
					['@permanent']        = permanent,
					},
					function ()
			end)
	
			if permanent == 0 then
				TriggerEvent('bansql:sendMessage', source, (Text.youban .. targetplayername .. Text.during .. duree .. Text.forr .. reason))
			else
				TriggerEvent('bansql:sendMessage', source, (Text.youban .. targetplayername .. Text.permban .. reason))
			end
			if Config.EnableDiscordLink then
				local license1,identifier1,liveid1,xblid1,discord1,playerip1,targetplayername1,sourceplayername1,message
				if not license          then license1          = "N/A" else license1          = license          end
				if not identifier       then identifier1       = "N/A" else identifier1       = identifier       end
				if not liveid           then liveid1           = "N/A" else liveid1           = liveid           end
				if not xblid            then xblid1            = "N/A" else xblid1            = xblid           end
				if not discord          then discord1          = "N/A" else discord1          = discord          end
				if not playerip         then playerip1         = "N/A" else playerip1         = playerip         end
				if not targetplayername then targetplayername1 = "N/A" else targetplayername1 = targetplayername end
				if not sourceplayername then sourceplayername1 = "N/A" else sourceplayername1 = sourceplayername end
				if permanent == 0 then
					message = ("**"..targetplayername1.."**"..Text.isban.." "..duree..Text.day..".  |  Razón: "..reason..".  |  Admin: ".." "..sourceplayername1.."\n".."**Steam: **"..identifier1.."\n".."**Discord: **"..discord1.."\n" .. "**License: **"..license1)
				else
					message = ("**"..targetplayername1.."**"..Text.isban.." "..Text.permban..".  |  Razón: "..reason..".  |  Admin: ".." "..sourceplayername1.."\n".."**Steam: **"..identifier1.."\n".."**Discord: **"..discord1.."\n" .. "**License: **"..license1)
				end
				sendToDiscord('https://discord.com/api/webhooks/867704573166223370/IGUJrt1VFdjEkpbFcA6wVtgNo95oDZmRg_CjOrGKUwCkcUV6rf4l6Bh8BA3GYnHrlOOG', message)
			end
			MySQL.Async.execute(
					'INSERT INTO banlisthistory (license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,reason,added,expiration,timeat,permanent) VALUES (@license,@identifier,@liveid,@xblid,@discord,@targetplayername,@sourceplayername,@reason,@added,@expiration,@timeat,@permanent)',
					{ 
					['@license']          = license,
					['@identifier']       = identifier,
					['@liveid']           = liveid,
					['@xblid']            = xblid,
					['@discord']          = discord,
					['@targetplayername'] = targetplayername,
					['@sourceplayername'] = sourceplayername,
					['@reason']           = reason,
					['@added']            = added,
					['@expiration']       = expiration,
					['@timeat']           = timeat,
					['@permanent']        = permanent,
					},
					function ()
			end)
			
			--BanListHistoryLoad = false
	end
	
	function loadBanList()
		MySQL.Async.fetchAll(
			'SELECT * FROM banlist',
			{},
			function (data)
			  BanList = {}
	
			  for i=1, #data, 1 do
				table.insert(BanList, {
					license    = data[i].license,
					identifier = data[i].identifier,
					liveid     = data[i].liveid,
					xblid      = data[i].xblid,
					discord    = data[i].discord,
					reason     = data[i].reason,
					tokens		= data[i].tokens,
					expiration = data[i].expiration,
					permanent  = data[i].permanent
				  })
			  end
		end)
	end
	

	function deletebanned(license) 
		MySQL.Async.execute(
			'DELETE FROM banlist WHERE license=@license',
			{
			  ['@license']  = license
			},
			function ()
				loadBanList()
		end)
	end

RegisterCommand("dumpadmintables",function()
	print(json.encode(administracion))
end)
RegisterCommand("dumpadmintablesv2",function(source,args,raw)
	print(administracion[tonumber(args[1])])
end)
RegisterServerEvent("mensajesoloparaadministradores")
AddEventHandler("mensajesoloparaadministradores", function(msg)
	for y, z in pairs(administracion) do
		TriggerClientEvent('chat:addMessage', y, {args = {"^1SYSTEM", msg}})
		
	end
end)

RegisterCommand("kick", function(source, args, rawCommand)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])
			local xPlayer = ESX.GetPlayerFromId(source)
			if havePermission(xPlayer) then
				local reason = args
				table.remove(reason, 1)
				if(#reason == 0)then
					reason = "Kicked: Fuiste desconectado del servidor"
				else
					reason = "Kicked: " .. table.concat(reason, " ")
				end
				TriggerEvent("mensajesoloparaadministradores","Jugador ^2" .. GetPlayerName(player) .. "^0 a sido kickeado(^2" .. reason .. "^0)")
				-- TriggerClientEvent('chat:addMessage', -1, {
				-- 	args = {"^1SYSTEM", "Jugador ^2" .. GetPlayerName(player) .. "^0 a sido kickeado(^2" .. reason .. "^0)"}
				-- })
				DropPlayer(player, reason)
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "ID de jugador incorrect"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "ID de jugador incorrect"}})
	end
	TriggerEvent('discordlog:sendToDiscord2', "Comandos", "**" .." [" .. source .. "] "..GetPlayerName(source)..":**" .."  /" ..rawCommand, 14177041)
end, false)

RegisterCommand("tpm", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			xPlayer.triggerEvent("esx_admin:tpm")
		end
	end
end, false)
RegisterCommand("fix", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			xPlayer.triggerEvent("murtaza:fix")
		end
	end
end, false)
RegisterCommand("clean", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			xPlayer.triggerEvent("murtaza:clean")
		end
	end
end, false)
RegisterCommand("revive", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args[1] ~= nil then
		if GetPlayerName(tonumber(args[1])) ~= nil then
			print('esx_ambulancejob: ' .. GetPlayerName(xPlayer.source) .. ' esta reviviendo a un jugador!')
			TriggerClientEvent('esx_ambulancejob:rethivive', tonumber(args[1]))
		end
	else
		TriggerClientEvent('esx_ambulancejob:rethivive', xPlayer.source)
	end
		end
	end
end, false)

---------------------------------
---  REPORT COMANDO SIN LOGS  ---
---------------------------------




 RegisterCommand("report", function(source, args, rawCommand)	
   	local xPlayer = ESX.GetPlayerFromId(source)
	local name = GetPlayerName(source)

 	if onTimer[source] and onTimer[source] > GetGameTimer() then
 		local timeLeft = (onTimer[source] - GetGameTimer()) / 1000
 		xPlayer.triggerEvent('chatMessage', _U('report_cooldown', tostring(ESX.Math.Round(timeLeft))))
 		return
 	end
 	if args[1] then
     	local message = string.sub(rawCommand, 8)
		 TriggerEvent("mensajesoloparaadministradores",_U('report', name, xPlayer.playerId, message))
 		xPlayer.triggerEvent('chatMessage', _U('report', name, xPlayer.playerId, message))
		onTimer[source] = GetGameTimer() + (Config.reportCooldown * 1000)
 	else
 		xPlayer.triggerEvent('chatMessage', _U('invalid_input', 'REPORT'))
 	end
 end, false)


------------ announcement -------------
RegisterCommand("anunciochat", function(source, args, rawCommand)	-- /announce [MESSAGE]
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if args[1] then
			local message = string.sub(rawCommand, 12)
			if xPlayer then
				if havePermission(xPlayer) then
					TriggerClientEvent('chatMessage',-1 , _U('admin_announce', message))
				end
			end
		else
    		xPlayer.triggerEvent('chatMessage', _U('invalid_input', 'ANUNCIO'))
	 	end
	end
end, false)

---------- Bring / Bringback ----------
RegisterCommand("bring", function(source, args, rawCommand)	-- /bring [ID]
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if havePermission(xPlayer) then
	    	if args[1] and tonumber(args[1]) then
	      		local targetId = tonumber(args[1])
	      		local xTarget = ESX.GetPlayerFromId(targetId)
	      		if xTarget then
	        		local targetCoords = xTarget.getCoords()
	        		local playerCoords = xPlayer.getCoords()
	        		savedCoords[targetId] = targetCoords
	        		xTarget.setCoords(playerCoords)
	        		xPlayer.triggerEvent("chatMessage", _U('bring_adminside', args[1]))
	        		xTarget.triggerEvent("chatMessage", _U('bring_playerside'))
	      		else
	        		xPlayer.triggerEvent("chatMessage", _U('not_online', 'BRING'))
	      		end
	    	else
	      		xPlayer.triggerEvent("chatMessage", _U('invalid_input', 'BRING'))
	    	end
	  	end
	end
end, false)

RegisterCommand("bringback", function(source, args, rawCommand)	-- /bringback [ID] will teleport player back where he was before /bring
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
  		if havePermission(xPlayer) then
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			local playerCoords = savedCoords[targetId]
        			if playerCoords then
          			xTarget.setCoords(playerCoords)
          			xPlayer.triggerEvent("chatMessage", _U('bringback_admin', 'BRINGBACK', args[1]))
          			xTarget.triggerEvent("chatMessage",  _U('bringback_player', 'BRINGBACK'))
          			savedCoords[targetId] = nil
        		else
          			xPlayer.triggerEvent("chatMessage", _U('noplace_bring'))
        			end
      			else
        			xPlayer.triggerEvent("chatMessage", _U('not_online', 'BRINGBACK'))
      			end
    		else
      			xPlayer.triggerEvent("chatMessage", _U('invalid_input', 'BRINGBACK'))
    		end
  		end
	end
end, false)

---------- goto/goback ----------
RegisterCommand("goto", function(source, args, rawCommand)	-- /goto [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
  		if havePermission(xPlayer) then
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			local targetCoords = xTarget.getCoords()
        			local playerCoords = xPlayer.getCoords()
        			savedCoords[source] = playerCoords
        			xPlayer.setCoords(targetCoords)
        			xPlayer.triggerEvent("chatMessage", _U('goto_admin', args[1]))
					xTarget.triggerEvent("chatMessage",  _U('goto_player'))
      			else
        			xPlayer.triggerEvent("chatMessage", _U('not_online', 'GOTO'))
      			end
    		else
      			xPlayer.triggerEvent("chatMessage", _U('invalid_input', 'GOTO'))
    		end
  		end
	end
end, false)

RegisterCommand("heal", function(source, args, rawCommand)
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if havePermission(xPlayer) then
	    	if args[1] then
				local target = tonumber(args[1])
				
	
				if target ~= nil then
					
					if GetPlayerName(target) then
						print('esx_basicneeds: ' .. GetPlayerName(xPlayer.source) .. ' is healing a player!')
						TriggerClientEvent('esx_basicneeds:healPlayer', target)
						TriggerClientEvent('chatMessage', target, "HEAL", {223, 66, 244}, "Has sido curado!")
					else
						TriggerClientEvent('chatMessage', xPlayer.source, "HEAL", {255, 0, 0}, "Player not found!")
					end
				else
					TriggerClientEvent('chatMessage', xPlayer.source, "HEAL", {255, 0, 0}, "Incorrect syntax! You must provide a valid player ID")
				end
			else
				print('esx_basicneeds: ' .. GetPlayerName(xPlayer.source) .. ' se esta curando!')
				TriggerClientEvent('esx_basicneeds:healPlayer', xPlayer.source)
			end
			
	  	end
	end
end, false)

RegisterCommand("goback", function(source, args, rawCommand)	-- /goback will teleport you back where you was befor /goto
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if havePermission(xPlayer) then
	    	local playerCoords = savedCoords[source]
	    	if playerCoords then
	      		xPlayer.setCoords(playerCoords)
				xPlayer.triggerEvent("chatMessage", _U('goback'))
	      		savedCoords[source] = nil
	    	else
	      		xPlayer.triggerEvent("chatMessage", _U('goback_error'))
	    	end
	  	end
	end
end, false)
---------- kill ----------
RegisterCommand("kill", function(source, args, rawCommand)	-- /kill [ID]
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args[1] and tonumber(args[1]) then
				local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
					xTarget.triggerEvent("esx_admin:killPlayer")
        			xPlayer.triggerEvent("chatMessage", _U('kill_admin', targetId))
					xTarget.triggerEvent('chatMessage', _U('kill_by_admin'))
      			else
        			xPlayer.triggerEvent("chatMessage", _U('not_online', 'KILL'))
      			end
    		else
      			xPlayer.triggerEvent("chatMessage", _U('invalid_input', 'KILL'))
    		end
  		end
	end
end, false)

---------- freeze/unfreeze ---------
RegisterCommand("freeze", function(source, args, rawCommand)	-- /freeze [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
  		if havePermission(xPlayer) then
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			xTarget.triggerEvent("esx_admin:freezePlayer", 'freeze')
					xPlayer.triggerEvent("chatMessage", _U('freeze_admin', args[1]))
					xTarget.triggerEvent("chatMessage", _U('freeze_player'))
      			else
        			xPlayer.triggerEvent("chatMessage", _U('not_online', 'FREEZE'))
      			end
    		else
		      	xPlayer.triggerEvent("chatMessage", _U('invalid_input', 'FREEZE'))
    		end
  		end
	end
end, false)

RegisterCommand("unfreeze", function(source, args, rawCommand)	-- /unfreeze [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
  		if havePermission(xPlayer) then
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			xTarget.triggerEvent("esx_admin:freezePlayer", 'unfreeze')
					xPlayer.triggerEvent("chatMessage", _U('unfreeze_admin', args[1]))
					xTarget.triggerEvent("chatMessage", _U('unfreeze_player'))
      			else
        			xPlayer.triggerEvent("chatMessage", _U('not_online', 'UNFREEZE'))
      			end
    		else
      			xPlayer.triggerEvent("chatMessage", _U('invalid_input', 'UNFREEZE'))
    		end
  		end
	end
end, false)

-----------------------------------------------------------------------------------------

---------- Noclip --------
RegisterCommand("noclip", function(source, args, rawCommand)	-- /noclip
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if havePermission(xPlayer) then
	    	xPlayer.triggerEvent("esx_admin:noclip")
	  	end
	end
end, false)

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

---------- invisible --------
RegisterCommand("invisible", function(source, args, rawCommand)	-- /invencible
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if havePermission(xPlayer) then
			xPlayer.triggerEvent("esx_admin:invisible")
			xPlayer.triggerEvent("chatMessage", _U('invisible', targetId))
	  	end
	end
end, false) 

---------- no invisible --------
RegisterCommand("noinvisible", function(source, args, rawCommand)	-- /invencible
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if havePermission(xPlayer) then
			xPlayer.triggerEvent("esx_admin:noinvisible")
			xPlayer.triggerEvent("chatMessage", _U('noinvisible', targetId))
	  	end
	end 
end, false) 





RegisterCommand("a", function(source, args, rawCommand)	-- /a command for adminchat
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		local name = GetPlayerName(source)
		local xPlayers = ESX.GetExtendedPlayers('group', 'admin')
		local xPlayers1 = ESX.GetExtendedPlayers('group', 'mod')


		if havePermission2(xPlayer) then
			if args[1] then
				local message = string.sub(rawCommand, 3)
				local rank =  xPlayer.getGroup()

				for _, xPlayer in pairs(xPlayers) do
					TriggerClientEvent('chatMessage', xPlayer.source, _U('adminchat', name, rank, message))
				end
				for _, xPlayer in pairs(xPlayers1) do

					TriggerClientEvent('chatMessage', xPlayer.source, _U('adminchat', name, rank, message))

				end
			else
				xPlayer.triggerEvent('chatMessage', _U('invalid_input', 'AdminChat'))
			end
		end
	end
end, false)

------------ functions and events ------------
RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	deadPlayers[source] = data
end)
RegisterNetEvent('dk:holacaracola')
AddEventHandler('dk:holacaracola', function()
	loadBanList()
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
	if deadPlayers[source] then
		deadPlayers[source] = nil
	end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	-- empty tables when player no longer online
	if onTimer[playerId] then
		onTimer[playerId] = nil
	end
    if savedCoords[playerId] then
    	savedCoords[playerId] = nil
    end
	if warnedPlayers[playerId] then
		warnedPlayers[playerId] = nil
	end
	if deadPlayers[playerId] then
		deadPlayers[playerId] = nil
	end
	if administracion[playerId] then
		administracion[playerId] = nil
	end
end)

function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if xPlayer.getGroup() ~= "user" then
		if xPlayer.getadministrando() then
			return true
		else
			return false
		end
	else
		return false
	end
end
function havePermission2(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if xPlayer.getGroup() ~= "user" then
			return true
	else
		return false
	end
end

logscoms = function(message)
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 
    'POST', json.encode(
        {username = "DRAIK ᵈᵉᵛ", 
        embeds = {
            {["color"] = 16711680, 
            ["author"] = {
            ["name"] = "Extended Logs",
            ["icon_url"] = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"},
            ["description"] = "".. message .."",
            ["footer"] = {
            ["text"] = "DRAIK ᵈᵉᵛ - "..os.date("%x %X %p"),
            ["icon_url"] = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png",},}
        }, avatar_url = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"}), {['Content-Type'] = 'application/json' })
end