ESX = nil
local playersInJail = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	MySQL.Async.fetchAll('SELECT jail_time FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		if result[1] and result[1].jail_time > 0 then
			TriggerEvent('dkpdsa:sendToJail', xPlayer.source, result[1].jail_time, true)
		end
	end)
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	playersInJail[playerId] = nil
end)

MySQL.ready(function()
	Citizen.Wait(2000)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers do
		Citizen.Wait(100)
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		MySQL.Async.fetchAll('SELECT jail_time FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1] and result[1].jail_time > 0 then
				TriggerEvent('dkpdsa:sendToJail', xPlayer.source, result[1].jail_time, true)
			end
		end)
	end
end)

ESX.RegisterCommand('jail', 'user', function(xPlayer, args, showError)
	local name = GetPlayerName(args.playerId)
	if xPlayer.job.name == "cnp" then
	TriggerEvent('dkpdsa:sendToJail', args.playerId, args.time * 60)
	sendDiscord('Jail Draik', ' ID: ' .. name ..'| Acaba de entrar por '..args.time..' minutos mandado por (CNP): '..xPlayer.identifier..'.')
	elseif xPlayer.job.name == "military" then
		TriggerEvent('dkpdsa:sendToJail', args.playerId, args.time * 60)
		sendDiscord('Jail Draik', ' ID: ' .. name ..'| Acaba de entrar por '..args.time..' minutos mandado por (Norte): '..xPlayer.identifier..'.')
	end
end, false, {help = 'Jail a player', validate = false, arguments = {
	{name = 'playerId', help = 'player id', type = 'playerId'},
	{name = 'time', help = 'jail time in minutes', type = 'number'}
}})

ESX.RegisterCommand('jail1', 'mod', function(xPlayer, args, showError)

	if xPlayer.job.name == "cnp" then
		TriggerEvent('dkpdsa:sendToJail', args.playerId, args.time * 60)
		sendDiscord('Jail Draik', ' ID: ' .. args.playerId ..'| Acaba de entrar por '..args.time..' minutos mandado por (CNP) '..xPlayer.identifier..'.')
		elseif xPlayer.job.name == "military" then
			TriggerEvent('dkpdsa:sendToJail', args.playerId, args.time * 60)
			sendDiscord('Jail Draik', ' ID: ' .. args.playerId ..'| Acaba de entrar por '..args.time..' minutos mandado por (Norte)'..xPlayer.identifier..'.')
		end
end, false, {help = 'Jail a player', validate = false, arguments = {
	{name = 'playerId', help = 'player id', type = 'playerId'},
	{name = 'time', help = 'jail time in minutes', type = 'number'}
}})


ESX.RegisterCommand('unjail', 'user', function(xPlayer, args, showError)
	if xPlayer["job"]["name"] == "cnp" then
	unjailPlayer(args.playerId)
	else 
		xPlayer.showNotification("No eres policia")
	end
end, false, {help = 'Unjail a player', validate = false, arguments = {
	{name = 'playerId', help = 'player id', type = 'playerId'}
}})

RegisterNetEvent('dkpdsa:sendToJail')
AddEventHandler('dkpdsa:sendToJail', function(playerId, jailTime, quiet)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if not playersInJail[playerId] then
			MySQL.Async.execute('UPDATE users SET jail_time = @jail_time WHERE identifier = @identifier', {
				['@identifier'] = xPlayer.identifier,
				['@jail_time'] = jailTime
			}, function(rowsChanged)
				--xPlayer.triggerEvent('esx_policejob:unrestrain')
				xPlayer.triggerEvent('UJHSA8731IKJSAIK12HSYUDH198898U21', jailTime)
				playersInJail[playerId] = {timeRemaining = jailTime, identifier = xPlayer.getIdentifier()}

			--if not quiet then
			--	TriggerClientEvent('chat:addMessage', -1, {args = {_U('judge'), _U('jailed_msg', xPlayer.getName(), ESX.Math.Round(jailTime / 60))}, color = {147, 196, 109}})
			--end
			end)

		end
	end
end)

function unjailPlayer(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if playersInJail[playerId] then
			MySQL.Async.execute('UPDATE users SET jail_time = 0 WHERE identifier = @identifier', {
				['@identifier'] = xPlayer.identifier
			}, function(rowsChanged)
			--	TriggerClientEvent('chat:addMessage', -1, {args = {_U('judge'), _U('unjailed', xPlayer.getName())}, color = {147, 196, 109}})
				playersInJail[playerId] = nil
				xPlayer.triggerEvent('HAIUFH891UJHSIJDAY781KD8198UJDSAU912UIJ')
			end)
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		for playerId,data in pairs(playersInJail) do
			playersInJail[playerId].timeRemaining = data.timeRemaining - 1

			if data.timeRemaining < 1 then
				unjailPlayer(playerId, false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.JailTimeSyncInterval)
		local tasks = {}

		for playerId,data in pairs(playersInJail) do
			local task = function(cb)
				MySQL.Async.execute('UPDATE users SET jail_time = @time_remaining WHERE identifier = @identifier', {
					['@identifier'] = data.identifier,
					['@time_remaining'] = data.timeRemaining
				}, function(rowsChanged)
					cb(rowsChanged)
				end)
			end

			table.insert(tasks, task)
		end

		Async.parallelLimit(tasks, 4, function(results) end)
	end
end)

webhookurl = 'https://discord.com/api/webhooks/880037888484577300/ZDMi_b2x2-yMrCiLY1348mAmRsZkTni994TFhRLdjjJ1S9eab3sqw5mr9RSuxHrxXRCT'


function sendDiscord(name, message)
    PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = "FEDERAL SPAINCITY", content = message}), { ['Content-Type'] = 'application/json' })
end
