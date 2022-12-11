local standardVolumeOutput = 1.0;

RegisterNetEvent('InteractSound_CL:PlayOnOne')
AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)
--[[
RegisterNetEvent('InteractSound_CL:PlayOnAll')
AddEventHandler('InteractSound_CL:PlayOnAll', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)]]

-- RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
-- AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
--     local lCoords = GetEntityCoords(GetPlayerPed(-1))
--     local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
--     local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
--     if(distIs <= maxDistance) then
--         SendNUIMessage({
--             transactionType     = 'playSound',
--             transactionFile     = soundFile,
--             transactionVolume   = soundVolume
--         })
--     end
-- end)
RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerId, distance, soundFile, soundVolume)
	local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    local distance = GetDistanceBetweenCoords(sourceCoords, targetCoords, true)
    if target == source then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    elseif distance < 20 and distance ~= 0 and distance > 0.1 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

Citizen.CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        s = 1000
        if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) or GetHashKey(vehicle) == 'police2' and 'police3' and 'police4' and 'police5' and 'police6' and 'police7' and 'riot' and 'policeb' and 'police' then
            s = 0
            if IsControlJustPressed(1, 157) then -- 1
                TriggerServerEvent("InteractSound_SV:PlaylrhackWithinDistance", 50, "aviso1", 0.35,	securityToken)
                Citizen.Wait(5000) -- espero a que pase el audio
            end
        end
        Citizen.Wait(s)
    end
end)

Citizen.CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        s = 1000
        if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) or GetHashKey(vehicle) == 'police2' and 'police3' and 'police4' and 'police5' and 'police6' and 'police7' and 'riot' and 'policeb' and 'police' then
            s = 0
            if IsControlJustPressed(1, 158) then -- 1
                TriggerServerEvent("InteractSound_SV:PlaylrhackWithinDistance", 50, "aviso2", 0.35,	securityToken)  
                Citizen.Wait(5000) -- espero a que pase el audio
            end
        end
        Citizen.Wait(s)
    end
end)

Citizen.CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        s = 1000
        if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) or GetHashKey(vehicle) == 'police2' and 'police3' and 'police4' and 'police5' and 'police6' and 'police7' and 'riot' and 'policeb' and 'police' then
            s = 0
            if IsControlJustPressed(1, 160) then -- 1
                TriggerServerEvent("InteractSound_SV:PlaylrhackWithinDistance", 50, "aviso3", 0.35,	securityToken)
                Citizen.Wait(5000) -- espero a que pase el audio
            end
        end
        Citizen.Wait(s)
    end
end)
