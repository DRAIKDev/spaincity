ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local activity = 0
local activitySource = 0
local cooldown = 0

RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:PAITH')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:PAITH', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.addAccountMoney('black_money',tonumber(payment))
	
	--Add cooldown
	cooldown = Config.CooldownMinutes * 60000
end)

ESX.RegisterServerCallback('812UJHJHJ812EHH91EJSJQ9:anycops',function(source, cb)
  local anycops = 0
  local playerList = ESX.GetPlayers()
  for i=1, #playerList, 1 do
    local _source = playerList[i]
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerjob = xPlayer.job.name
    if playerjob == 'cnp' then
      anycops = anycops + 1
    end
  end
  cb(anycops)
end)

ESX.RegisterServerCallback('812UJHJHJ812EHH91EJSJQ9:isActive',function(source, cb)
  cb(activity, cooldown)
end)

RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:registerActivity')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:registerActivity', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'cnp' then
				TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:setcopnotification', xPlayers[i])
			end
		end
	else
		activitySource = 0
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:registerActivitym')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:registerActivitym', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'mafia' then
				TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:setcopnotification', xPlayers[i])
			end
		end
	else
		activitySource = 0
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:registerActivityg')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:registerActivityg', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'gang' then
				TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:setcopnotification', xPlayers[i])
			end
		end
	else
		activitySource = 0
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:registerActivityb')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:registerActivityb', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'biker' then
				TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:setcopnotification', xPlayers[i])
			end
		end
	else
		activitySource = 0
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:alertcopsm')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:alertcopsm', function(cx,cy,cz)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'mafia' then
			TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:setcopblip', xPlayers[i], cx,cy,cz)
		end
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:alertcops')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:alertcops', function(cx,cy,cz)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'cnp' then
			TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:setcopblip', xPlayers[i], cx,cy,cz)
		end
	end
end)

RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:stopalertcops')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:stopalertcops', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'cnp' then
			TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:removecopblip', xPlayers[i])
		end
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:stopalertcopsm')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:stopalertcopsm', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'mafia' then
			TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:removecopblip', xPlayers[i])
		end
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:stopalertcopsg')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:stopalertcopsg', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'gang' then
			TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:removecopblip', xPlayers[i])
		end
	end
end)
RegisterServerEvent('812UJHJHJ812EHH91EJSJQ9:stopalertcopsb')
AddEventHandler('812UJHJHJ812EHH91EJSJQ9:stopalertcopsb', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'biker' then
			TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:removecopblip', xPlayers[i])
		end
	end
end)

AddEventHandler('playerDropped', function ()
	local _source = source
	if _source == activitySource then
		--Remove blip for all cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'cnp' then
				TriggerClientEvent('812UJHJHJ812EHH91EJSJQ9:removecopblip', xPlayers[i])
			end
		end
		--Set activity to 0
		activity = 0
		activitySource = 0
	end
end)

--Cooldown manager
AddEventHandler('onResourceStart', function(resource)
	while true do
		Wait(5000)
		if cooldown > 0 then
			cooldown = cooldown - 5000
		end
	end
end)
