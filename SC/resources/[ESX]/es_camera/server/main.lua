local Spectating = {}

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('es_camera:requestSpectating')
AddEventHandler('es_camera:requestSpectating', function()
	TriggerClientEvent('es_camera:onSpectate', source, Spectating)
end)

ESX.RegisterCommand('spectate', 'admin', function(xPlayer, args, showError)
	
	local target = -1

	if args[2] ~= nil then
		target = tonumber(args[2])
	end

	if target == -1 then

		for i=1, #Spectating, 1 do
			if Spectating[i] == source then
				Spectating[i] = nil
				break
			end
		end

		TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
		TriggerClientEvent('es_camera:spectate', source, target)

	elseif target == source then
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Vous ne pouvez pas vous spec vous-même !")
	else

		local found = false

		for i=1, #Spectating, 1 do
			if Spectating[i] == source then
				found = true
				break
			end
		end

		if not found then
			table.insert(Spectating, source)
		end

		TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
		TriggerClientEvent('es_camera:spectate', source, target)
	end
end, false, {help = 'Spectate', params = {{name = 'id'}}})

AddEventHandler('playerDropped', function()
	for i=1, #Spectating, 1 do
		if Spectating[i] == source then
			Spectating[i] = nil
			break
		end
	end
end)
