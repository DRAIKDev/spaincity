ESX.StartPayCheck = function()
	function payCheck()
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local job     = xPlayer.job.grade_name
			local salary  = xPlayer.job.grade_salary

			if salary > 0 then
				if job == 'unemployed' then -- unemployed
					xPlayer.addAccountMoney('bank', salary)
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_BANK_MAZE', 9)
				elseif job == 'mechanic' or job == 'mechanic01' or job == 'mechanic02' then
					TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
						if society ~= nil then -- verified society
							TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
								if account.money >= salary then -- does the society money to pay its employees?
									xPlayer.addAccountMoney('bank', salary)
									account.removeMoney(salary)

									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
								else
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', _U('company_nomoney'), 'CHAR_BANK_MAZE', 1)
								end
							end)
						else -- not a society
							xPlayer.addAccountMoney('bank', salary)
							TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
						end
					end)
				else -- generic job
					xPlayer.addAccountMoney('bank', salary)
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
				end
			end

		end

		SetTimeout(Config.PaycheckInterval, payCheck)
	end

	SetTimeout(Config.PaycheckInterval, payCheck)
end
ESX.StartVipPayCheck = function()
	function payCheckVip()
		print('^2 Entregando Salarios VIP... ^0')
		local xPlayers = ESX.GetPlayers()
		local vips = {}

		local result = MySQL.Sync.fetchAll('SELECT identifier as id, rango as rango FROM vip', {
		})

		for i=1, #result, 1 do
			if result[i].rango == 'basico' then
				table.insert(vips, {result[i].id, 150}) 
			elseif result[i].rango == 'oro' then
				table.insert(vips, {result[i].id, 300}) 
			elseif result[i].rango == 'premium' then
				table.insert(vips, {result[i].id, 450}) 
			elseif result[i].rango == 'deluxe' then
				table.insert(vips, {result[i].id, 750}) 
			elseif result[i].rango == 'fundador' then
				table.insert(vips, {result[i].id, 1500}) 
			end
		end
		SetTimeout(Config.PaycheckIntervalVIP, payCheckVip)

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local identifier = xPlayer.identifier
			if vips[1] then 
				for k=1, #vips, 1 do
					if identifier == vips[k][1] then 
						xPlayer.addAccountMoney('bank', vips[k][2])
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, '~y~Sistema VIP~w~', 'Recibiste tu salario ~y~VIP~w~', _U('received_help', vips[k][2] ), 'CHAR_MP_STRIPCLUB_PR', 9)
					end
				end
			end 
		end
		print('^2 Salarios entregados ^0')
	end
	SetTimeout(Config.PaycheckIntervalVIP, payCheckVip)
	print('^2 Salarios entregados ^0')
end
