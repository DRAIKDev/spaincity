ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_washmoney:walrhacksh")
AddEventHandler('esx_washmoney:walrhacksh', function()
	
	local xPlayer = ESX.GetPlayerFromId(source) -- Gets the players data

			if xPlayer.getAccount('black_money').money > 0 and xPlayer.job.name == 'mafia03' then
				if tonumber(xPlayer.job.grade) == 4  or tonumber(xPlayer.job.grade) == 3 then 
				local black_money_amount = xPlayer.getAccount('black_money').money
			
				xPlayer.removeAccountMoney('black_money', xPlayer.getAccount('black_money').money) -- Removes Dirty Money
			
				xPlayer.addMoney(black_money_amount) -- Adds the normal money
				TriggerClientEvent('esx:showNotification', source, "Ya tienes el dinero negro!")
				else
					TriggerClientEvent('esx:showNotification', source, "No puedes usar esto.")

				end
			else 
				TriggerClientEvent('esx:showNotification', source, "No puedes usar esto.")
			end

end)