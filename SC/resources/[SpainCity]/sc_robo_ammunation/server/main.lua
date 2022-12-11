local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_robo_ammunation:tooFar')
AddEventHandler('esx_robo_ammunation:tooFar', function(currentArmory)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'cnp' or xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at', Armories[currentArmory].nameOfArmory))
			TriggerClientEvent('esx_robo_ammunation:killBlip', xPlayers[i])
		end
	end

	if robbers[_source] then
		TriggerClientEvent('esx_robo_ammunation:tooFar', _source)
		robbers[_source] = nil
		TriggerClientEvent('esx:showNotification', _source, _U('robbery_cancelled_at', Armories[currentArmory].nameOfArmory))
	end
end)

RegisterServerEvent('esx_robo_ammunation:robberyStarted')
AddEventHandler('esx_robo_ammunation:robberyStarted', function(currentArmory)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local dps  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	local hour = os.time()
	local tiempo = os.date('%c',hour)

	if Armories[currentArmory] then
		local Armory = Armories[currentArmory]

		if (os.time() - Armory.lastRobbed) < Config.TimerBeforeNewRob and Armory.lastRobbed ~= 0 then
			TriggerClientEvent('esx:showNotification', _source, _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - Armory.lastRobbed)))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'cnp' then
				cops = cops + 1
			end
		end
	--	MySQL.Async.execute("INSERT INTO ammu_logs (`position`,`id`,`hour`,`reward`) VALUES (@position,@identifier,@hour,@reward)", {position = Armories[currentArmory].nameOfArmory,identifier = dps.identifier,hour = tiempo,reward=Armories[currentArmory].reward})


		if not rob then
			if cops >= Config.PoliceNumberRequired then
				rob = true

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'cnp' or xPlayer.job.name == 'police' then
						TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog', Armory.nameOfArmory))
						TriggerClientEvent('esx_robo_ammunation:setBlip', xPlayers[i], Armories[currentArmory].position)
					end
				end

				TriggerClientEvent('esx:showNotification', _source, _U('started_to_rob', Armory.nameOfArmory))
				TriggerClientEvent('esx:showNotification', _source, _U('alarm_triggered'))
				
				TriggerClientEvent('esx_robo_ammunation:currentlyRobbing', _source, currentArmory)
				TriggerClientEvent('esx_robo_ammunation:startTimer', _source)
				
				Armories[currentArmory].lastRobbed = os.time()
				robbers[_source] = currentArmory

				SetTimeout(Armory.secondsRemaining * 1000, function()
					if robbers[_source] then
						rob = false
						if xPlayer then
							TriggerClientEvent('esx_robo_ammunation:robberyComplete', _source, Armory.reward)
							xPlayer.addWeapon('weapon_microsmg', '250')
							xPlayer.addWeapon('weapon_machete', '250')
							xPlayer.addWeapon('weapon_heavypistol', '250')

							if Config.GiveBlackMoney then
								xPlayer.addAccountMoney('black_money', Armory.reward)
							else
								xPlayer.addMoney(Armory.reward)
							end
							
							local xPlayers, xPlayer = ESX.GetPlayers(), nil
							for i=1, #xPlayers, 1 do
								xPlayer = ESX.GetPlayerFromId(xPlayers[i])

								if xPlayer.job.name == 'police' or xPlayer.job.name == 'cnp' then
									TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at', Armory.nameOfArmory))
									TriggerClientEvent('esx_robo_ammunation:killBlip', xPlayers[i])
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('esx:showNotification', _source, _U('min_police', Config.PoliceNumberRequired))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('robbery_already'))
		end
	end
end)
