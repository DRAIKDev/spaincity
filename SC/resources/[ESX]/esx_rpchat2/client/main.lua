ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageDo')
AddEventHandler('esx_rpchat:sendProximityMessageDo', function(playerId, title, message, color)
    local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    local distance = GetDistanceBetweenCoords(sourceCoords, targetCoords, true)
    if target == source then
        TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
    elseif distance < 20 and distance ~= 0 and distance > 0.1 then
        TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
    end
end)
RegisterNetEvent('esx_rpchat:sendProximityMessageME')
AddEventHandler('esx_rpchat:sendProximityMessageME', function(playerId, title, message, color)
    local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    local distance = GetDistanceBetweenCoords(sourceCoords, targetCoords, true)
    if target == source then
        TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
    elseif distance < 20 and distance ~= 0 and distance > 0.1 then
        TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
    end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageOOP')
AddEventHandler('esx_rpchat:sendProximityMessageOOP', function(playerId, title, message, color)
	local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    local distance = GetDistanceBetweenCoords(sourceCoords, targetCoords, true)
    if target == source then
        TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
    elseif distance < 20 and distance ~= 0 and distance > 0.1 then
        TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
    end
end)
Citizen.CreateThread(function()
	--TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/comunidad',  _U('ayuda_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/anon',  _U('anon_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/news', _U('news_help'), { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/ooc', 'Comando para hablar por OOC, Recuerda solo lo leerán los de tu entorno', { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
		TriggerEvent('chat:removeSuggestion', '/anon')
		TriggerEvent('chat:removeSuggestion', '/news')
        TriggerEvent('chat:removeSuggestion', '/oop')
	end
end)



local font = 0 -- Font of the text
local time = 350 -- Duration of the display of the text : 500 ~= 13sec
local msgQueue = {}

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end
function DrawText3D(x,y,z, text, color)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

RegisterNetEvent('JobChatRadioBufas')
AddEventHandler('JobChatRadioBufas', function(id, name, message, xPlayer)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)

	if ESX.PlayerData.job.name == 'police' then

		if pid == myId then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0RADIO POLICÍA^4] ^r^4 " .. name .."  "..": ^0" .. message)
		elseif ESX.PlayerData.job.name == xPlayer.job.name then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0RADIO POLICÍA^4] ^r^4 " .. name .."  "..": ^0" .. message)
		end
	  
    elseif ESX.PlayerData.job.name == 'ambulance' then
        
		if pid == myId then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^8[^*^0RADIO EMS^8] ^r^8 " .. name .." :^0 " .. message)
		elseif ESX.PlayerData.job.name == xPlayer.job.name then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^8[^*^0RADIO EMS^8] ^r^8 " .. name .." :^0 " .. message)
        end
        
    elseif ESX.PlayerData.job.name == 'taxi' then
        
		if pid == myId then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^3[^*^0RADIO TAXISTAS^3] ^r^3" .. name .." :^0 " .. message)
		elseif PlayerData.job.name == xPlayer.job.name then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^3[^*^0RADIO TAXISTAS^3] ^r^3" .. name .." :^0 " ..message)
        end
        
    elseif ESX.PlayerData.job.name == 'military' then

        if pid == myId then
            TriggerEvent('chatMessage', "", {255, 0, 0}, "^2[^*^0RADIO GC^2] ^r^2" .. name .." :^0 " .. message)
        elseif PlayerData.job.name == xPlayer.job.name then
            TriggerEvent('chatMessage', "", {255, 0, 0}, "^2[^*^0RADIO GC^2] ^r^2" .. name .." :^0 " ..message)
        end

end
	  
end)

RegisterNetEvent('sendGCFAS')
AddEventHandler('sendGCFAS', function(id, name, message, xPlayer)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)

	if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'military' then

		if pid == myId then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Guardia Civil - GC ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		elseif ESX.PlayerData.job.name == xPlayer.job.name then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Guardia Civil - GC ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		end
	  
end
	  
end)

RegisterNetEvent('RadioGC')
AddEventHandler('RadioGC', function(id, name, message, xPlayer)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)

	if ESX.PlayerData.job.name == 'police' then

		if pid == myId then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Radio - Guardia Civil ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		elseif ESX.PlayerData.job.name == xPlayer.job.name then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Radio - Guardia Civil ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		end
	  
end
end)

RegisterNetEvent('RadioCNP')
AddEventHandler('RadioCNP', function(id, name, message, xPlayer)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)

	if ESX.PlayerData.job.name == 'cnp' then

		if pid == myId then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Radio - Policía Nacional ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		elseif ESX.PlayerData.job.name == xPlayer.job.name then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Radio - Policía Nacional ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		end
	  
end
end)

RegisterNetEvent('RadioMilitares')
AddEventHandler('RadioMilitares', function(id, name, message, xPlayer)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)

	if ESX.PlayerData.job.name == 'military' then

		if pid == myId then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Radio - Guardia Civil ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		elseif ESX.PlayerData.job.name == xPlayer.job.name then
			TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Radio - Guardia Civil ^4] ^r^4 " .. name .."  "..": ^0" .. message)
		end
	  
end
  
end)