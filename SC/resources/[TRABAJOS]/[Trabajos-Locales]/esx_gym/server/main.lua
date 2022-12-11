RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 75) then
		xPlayer.removeMoney(75)
			
		notification("You hired a ~g~BMX")
	else
		notification("You stole the bike because you didn't have enough ~r~money")
	end	
end)

RegisterServerEvent('esx_gym:hireCruiser')
AddEventHandler('esx_gym:hireCruiser', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 90) then
		xPlayer.removeMoney(90)
			
		notification("You hired a ~g~CRUISER")
	else
		notification("You stole the bike because you didn't have enough ~r~money")
	end	
end)

RegisterServerEvent('esx_gym:hireFixter')
AddEventHandler('esx_gym:hireFixter', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 99) then
		xPlayer.removeMoney(99)
			
		notification("You hired a ~g~FIXTER")
	else
		notification("You stole the bike because you didn't have enough ~r~money")
	end	
end)

RegisterServerEvent('esx_gym:hireScorcher')
AddEventHandler('esx_gym:hireScorcher', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 120) then
		xPlayer.removeMoney(120)
			
		notification("You hired a ~g~SCORCHER")
	else
		notification("You stole the bike because you didn't have enough ~r~money")
	end	
end)

RegisterServerEvent('esx_gym:checkChip')
AddEventHandler('esx_gym:checkChip', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local oneQuantity = xPlayer.getInventoryItem('gym_membership').count
	
	if oneQuantity > 0 then
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		TriggerClientEvent('esx_gym:falseMembership', source) -- false
	end
end)

RegisterServerEvent('esx_gym:comprobartarjeta')
AddEventHandler('esx_gym:comprobartarjeta', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM sociosgym WHERE identifier=@identifier',{['@identifier'] = xPlayer.identifier}, function(result) 
				if result[1] then
			if os.time(os.date("!*t")) < tonumber(result[1].hasta) then
				TriggerClientEvent('esx_gym:trueMembership', xPlayer.source) -- true
			else
				MySQL.Async.execute("DELETE  FROM `sociosgym` WHERE `identifier` = '"..xPlayer.identifier.."'")
			end
		end
	end)
end)

RegisterServerEvent('esx_gym:buyBandage')
AddEventHandler('esx_gym:buyBandage', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 350) then
		xPlayer.removeMoney(350)
		
		xPlayer.addInventoryItem('bandage', 1)		
		notification("Has comprado un ~g~bandage")
	else
		notification("No tienes  ~r~money")
	end	
end)

RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 240) then
		xPlayer.removeMoney(240)
		
		xPlayer.addInventoryItem('gym_membership', 1)		
		notification("Has comprado un ~g~membership")
		
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		notification("No tienes  ~r~money")
	end	
end)

RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 160) then
		xPlayer.removeMoney(160)
		
		xPlayer.addInventoryItem('protein_shake', 1)
		
		notification("Has comprado un ~g~protein shake")
	else
		notification("No tienes  ~r~money")
	end	
end)

ESX.RegisterUsableItem('protein_shake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('protein_shake', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Has bebido un  ~g~Batido Shake')

end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 90) then
		xPlayer.removeMoney(90)
		
		xPlayer.addInventoryItem('water', 1)
		
		notification("Has comprado ~g~agua")
	else
		notification("No tienes  ~r~money")
	end		
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 160) then
		xPlayer.removeMoney(160)
		
		xPlayer.addInventoryItem('sportlunch', 1)
		
		notification("Has comprado un ~g~Desayuno Deportivo")
	else
		notification("No tienes  ~r~money")
	end		
end)

ESX.RegisterUsableItem('sportlunch', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sportlunch', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'You ate a ~g~sportlunch')

end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 300) then
		xPlayer.removeMoney(300)
		
		xPlayer.addInventoryItem('powerade', 1)
		
		notification("Has comprado un ~g~powerade")
	else
		notification("No tienes  ~r~money")
	end		
end)

-- FUNCTIONS IN THE FUTURE (COMING SOON...)

--RegisterServerEvent('esx_gym:trainArms')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainChins')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainPushups')
--AddEventHandler('esx_gym:trainPushups', function()
	
--end)

--RegisterServerEvent('esx_gym:trainYoga')
--AddEventHandler('esx_gym:trainYoga', function()
	
--end)

--RegisterServerEvent('esx_gym:trainSitups')
--AddEventHandler('esx_gym:trainSitups', function()
	
--end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end