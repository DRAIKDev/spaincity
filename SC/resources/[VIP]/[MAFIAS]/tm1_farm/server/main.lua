ESX = nil
PLANTS = {
	
}
plantidenfier = 0
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getLength()
	local i = 0
	for i,v in pairs(PLANTS) do
		i = i + 1
	end
	return i
end

RegisterServerEvent('tm1_farm:planted')
AddEventHandler('tm1_farm:planted',function(seed,x,y,z)
	local xPlayer = ESX.GetPlayerFromId(source)
	local source = source
		if xPlayer then
			local plant = MySQL.Sync.fetchAll("SELECT * FROM tm1_plants WHERE name = @name", {['@name'] = seed})

			local label = plant[1].label
			local object = plant[1].object
			local finalplant = plant[1].finalobject
			if #PLANTS < 30 then
				plantidenfier = plantidenfier + 1
				table.insert(PLANTS, {identifier = plantidenfier,finalplant = finalplant, owner = xPlayer.getIdentifier(), label = label,seed = seed,x = x, y = y, z = z,percent = 0,object = object})
				xPlayer.removeInventoryItem(seed, 1)
				TriggerClientEvent('tm1_farm:plantsuccess',source,label,object,x,y,z,source)
			else
				TriggerClientEvent('tm1_farm:sendMSG',source,'El suelo ha dejado de ser fértil.')
			end
		end	
end)

RegisterServerEvent('tm1_farm:removeplant')
AddEventHandler('tm1_farm:removeplant',function(identifier,x,y,z,object)
	local id = 0
	for i,v in pairs(PLANTS) do
		if v.identifier == identifier then
			id = i
		end
	end
	table.remove( PLANTS, id )
	TriggerClientEvent('tm1_farm:removePlanted',-1,x,y,z,object)
end)

RegisterServerEvent('tm1_farm:getSource')
AddEventHandler('tm1_farm:getSource',function()
	TriggerClientEvent('tm1_farm:setSource',source,source)
end)



RegisterServerEvent('tm1_farm:addPlant')
AddEventHandler('tm1_farm:addPlant', function(plant)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(plant,3)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(9900)
		for i,v in pairs(PLANTS) do
			v.percent = v.percent + 1
		end
		TriggerClientEvent('tm1_farm:plantupdate',-1,PLANTS)
	end
end)