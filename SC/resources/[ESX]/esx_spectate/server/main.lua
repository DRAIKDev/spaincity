ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)

RegisterServerEvent('es_expectate:getgroup')
AddEventHandler('es_expectate:getgroup', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer == nil then return end
    TriggerClientEvent('es_expectate:setgroup', source, xPlayer.getGroup())
end)


ESX.RegisterCommand('spec', 'mod', function(xPlayer, args, user)
    TriggerClientEvent('esx_spectate:spectate', xPlayer.source, target)
end, {help = "Espectea a jugadores."})

ESX.RegisterServerCallback('esx_spectate:getPlayerData', function(source, cb, id)
    local xPlayer = ESX.GetPlayerFromId(id)
    if xPlayer ~= nil then
        cb(xPlayer)
    end
end)

RegisterServerEvent('esx_spectate:kick')
AddEventHandler('esx_spectate:kick', function(target, msg)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getGroup() ~= 'user' then
		DropPlayer(target, msg)
	else
		print(('esx_spectate: %s attempted to kick a player!'):format(xPlayer.identifier))
		DropPlayer(source, "esx_spectate: you're not authorized to kick people dummy.")
	end
end)

ESX.RegisterServerCallback('aklsdaklsjdaklsdjaklsdjsad', function(source, cb, target)
        
        local xPlayer = ESX.GetPlayerFromId(target)
        if xPlayer ~= nil then
            local identifier = GetPlayerIdentifiers(target)[1]
            
            local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
                ['@identifier'] = identifier
            })
            
            local user = result[1]
            local firstname = user['firstname']
            local lastname = user['lastname']
            local sex = user['sex']
            local dob = user['dateofbirth']
            local height = user['height'] .. " Centimetri"
            local money = user['money']
            local bank = user['bank']
            
            local data = {
                name = GetPlayerName(target),
                job = xPlayer.job,
                inventory = xPlayer.inventory,
                accounts = xPlayer.accounts,
                weapons = xPlayer.loadout,
                firstname = firstname,
                lastname = lastname,
                sex = sex,
                dob = dob,
                height = height,
                money = money,
                bank = bank
            }
            
            TriggerEvent('esx_license:getLicenses', target, function(licenses)
                data.licenses = licenses
                cb(data)
            end)
        end
end)


local savedPlayers = {}
local lastSaved = 0
local function UpdatePlayerList()
    local ts = os.time(os.date("!*t"))
    if lastSaved == 0 or lastSaved < ts then
        lastSaved = ts + 10

        local tempPlayers = {}
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local _data = {id = xPlayers[i], name = GetPlayerName(xPlayers[i])}
            table.insert(tempPlayers, _data)
        end
        savedPlayers = tempPlayers
    end
    return savedPlayers
end

ESX.RegisterServerCallback('EnekoGetPlayersToSpect', function(source, cb)
	cb(UpdatePlayerList())
end)
AddEventHandler('playerDropped', function (reason)
    UpdatePlayerList()
end)

local PlayerRequest = {}
RegisterServerEvent('TomaMisCC')
AddEventHandler('TomaMisCC', function(coods)
    if PlayerRequest[source] ~= nil then
        TriggerClientEvent("SetLocation", PlayerRequest[source], coods)
        PlayerRequest[source] = nil
    end
end)

RegisterServerEvent('GetPlayerPos')
AddEventHandler('GetPlayerPos', function(target)
    if target ~= nil then
        if PlayerRequest == nil then PlayerRequest = {} end
        if PlayerRequest[target] ~= nil then PlayerRequest[target] = nil end
        PlayerRequest[target] = source
        TriggerClientEvent("GetLocation", target)
    else
        print("Spectate: target = nil")
    end
end)