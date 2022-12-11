local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_robos_mafias:tooFar')
AddEventHandler('esx_robos_mafias:tooFar', function(currentrobo)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'cnp' or xPlayer.job.name == 'police' or xPlayer.job.name == 'military' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('roboxd_cancelled_at', robos[currentrobo].nameOfrobo))
			TriggerClientEvent('esx_robos_mafias:killBlip', xPlayers[i])
		end
	end

	if robbers[_source] then
		TriggerClientEvent('esx_robos_mafias:tooFar', _source)
		robbers[_source] = nil
		TriggerClientEvent('esx:showNotification', _source, _U('roboxd_cancelled_at', robos[currentrobo].nameOfrobo))
	end
end)

RegisterServerEvent('esx_robos_mafias:roboxdStarted')
AddEventHandler('esx_robos_mafias:roboxdStarted', function(currentrobo)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	if robos[currentrobo] then
		local robo = robos[currentrobo]

		if (os.time() - robo.lastRobbed) < Config.TimerBeforeNewRob and robo.lastRobbed ~= 0 then
			TriggerClientEvent('esx:showNotification', _source, _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - robo.lastRobbed)))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'cnp' then
				cops = cops + 1
			end
		end


		if not rob then
			if cops >= robos[currentrobo].numerodepolis then
				rob = true

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'cnp' or xPlayer.job.name == 'police' or xPlayer.job.name == 'military' then
						TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog', robo.nameOfrobo))
						TriggerClientEvent('esx_robos_mafias:setBlip', xPlayers[i], robos[currentrobo].position)
					end
				end

				TriggerClientEvent('esx:showNotification', _source, _U('started_to_rob', robo.nameOfrobo))
				TriggerClientEvent('esx:showNotification', _source, _U('alarm_triggered'))
				
				TriggerClientEvent('esx_robos_mafias:currentlyRobbing', _source, currentrobo)
				TriggerClientEvent('esx_robos_mafias:startTimer', _source)
				
				robos[currentrobo].lastRobbed = os.time()
				robbers[_source] = currentrobo

				SetTimeout(robo.secondsRemaining * 1000, function()
					if robbers[_source] then
						rob = false
						if xPlayer then
							TriggerClientEvent('esx_robos_mafias:roboxdComplete', _source, robo.reward)
							

							if robos[currentrobo].armas then
								xPlayer.addWeapon('weapon_assaultsmg', '250')
								xPlayer.addWeapon('weapon_advancedrifle', '250')
								xPlayer.addWeapon('weapon_heavypistol', '250')
								xPlayer.addWeapon('weapon_appistol', '250')
							end

							if robos[currentrobo].drogas then
								xPlayer.addInventoryItem('lsd', '500')
							end

							if robos[currentrobo].usb then
								xPlayer.addInventoryItem('usb', '1')
							end
							if Config.GiveBlackMoney then
								xPlayer.addAccountMoney('black_money', robo.reward)
							else
								xPlayer.addMoney(robo.reward)
							end
							
							local xPlayers, xPlayer = ESX.GetPlayers(), nil
							for i=1, #xPlayers, 1 do
								xPlayer = ESX.GetPlayerFromId(xPlayers[i])

								if xPlayer.job.name == 'police' or xPlayer.job.name == 'cnp' or xPlayer.job.name == 'military' then
									TriggerClientEvent('esx:showNotification', xPlayers[i], _U('roboxd_complete_at', robo.nameOfrobo))
									TriggerClientEvent('esx_robos_mafias:killBlip', xPlayers[i])
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('esx:showNotification', _source, _U('min_police', robos[currentrobo].numerodepolis))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('roboxd_already'))
		end
	end
end)
