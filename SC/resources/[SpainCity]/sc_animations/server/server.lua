ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(id)
	local xPlayer = ESX.GetPlayerFromId(id)
	local identifier = xPlayer.identifier

	-- Get favorite animation
	local result = MySQL.Sync.fetchScalar("SELECT * FROM favoriteanimation WHERE identifier = @identifier", {['@identifier'] = identifier})
    if not result then
		MySQL.Sync.execute("INSERT INTO favoriteanimation (`identifier`) VALUES (@identifier)",{['@identifier'] = identifier})
	end	
	
	-- Get favorite attitude
	local resultAttitude = MySQL.Sync.fetchScalar("SELECT * FROM favoriteattitude WHERE identifier = @identifier", {['@identifier'] = identifier})
    if not resultAttitude then
		MySQL.Sync.execute("INSERT INTO favoriteattitude (`identifier`) VALUES (@identifier)",{['@identifier'] = identifier})
	end
	
end)

RegisterServerEvent('esx_animations:newFavorite')
AddEventHandler('esx_animations:newFavorite', function(lib, dict, scenario)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	
	MySQL.Async.execute("UPDATE favoriteanimation SET lib=@lib,animation=@animation,scenario=@scenario WHERE identifier = @identifier", 
		{
			['@identifier'] = identifier, ['@lib'] = lib, ['@animation'] = dict, ['@scenario'] = scenario
		}
	)
end)

RegisterServerEvent('esx_animations:newFavoriteAttitude')
AddEventHandler('esx_animations:newFavoriteAttitude', function(lib, dict)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	
	MySQL.Async.execute("UPDATE favoriteattitude SET lib=@lib,anim=@animation WHERE identifier = @identifier", 
		{
			['@identifier'] = identifier, ['@lib'] = lib, ['@animation'] = dict
		}
	)
end)

ESX.RegisterServerCallback('esx_animations:getFavorite', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	MySQL.Async.fetchAll("SELECT * FROM `favoriteanimation` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	}, function(result)
		local data = {
		lib			= result[1].lib,
		animation	= result[1].animation,
		scenario 	= result[1].scenario
	}
	cb(data)
	end)
end)

ESX.RegisterServerCallback('esx_animations:getFavoriteAttitude', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	MySQL.Async.fetchAll("SELECT * FROM `favoriteattitude` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	}, function(result)
		local data = {
		lib			= result[1].lib,
		anim		= result[1].anim,
	}
	cb(data)
	end)
end)

RegisterServerEvent('esx_animations:sync')
AddEventHandler('esx_animations:sync', function(target, animationLib, animation, animation2, distans, distans2, height)
	local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('esx_animations:syncTarget', targetPlayer.source, source, animationLib, animation2, distans, distans2, height, spin)
	TriggerClientEvent('esx_animations:syncMe', source, animationLib, animation, distans, distans2)
end)


----------------------------------------------------------------
RegisterServerEvent('yisus_animations:syncAccepted')
AddEventHandler('yisus_animations:syncAccepted', function(requester, id, menu)
    local accepted = source
    
    TriggerClientEvent('yisus_animations:playSynced', accepted, requester, id, 'Accepter', menu)
    TriggerClientEvent('yisus_animations:playSynced', requester, accepted, id, 'Requester', menu)
end)

RegisterServerEvent('yisus_animations:requestSynced')
AddEventHandler('yisus_animations:requestSynced', function(target, id, menu)
    local requester = source
    local xPlayer = ESX['GetPlayerFromId'](requester)
    
    MySQL['Async']['fetchScalar']("SELECT firstname FROM users WHERE identifier=@identifier", {['@identifier'] = xPlayer['identifier']}, function(firstname)
        TriggerClientEvent('yisus_animations:syncRequest', target, requester, id, firstname, menu)
    end)
end)