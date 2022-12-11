S = {}
local attached, brancard, layed = false, nil, false

-- Functions
S.GetTable = function(table, callback)
    for k,v in pairs(table) do
        callback(v)
    end
end

S.Draw = function(text, x, y, z)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

S.CheckBrancard = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local veh = 0

    for k,v in pairs(Config.VehiclesBrancard) do
        veh = GetClosestVehicle(pedC.x, pedC.y, pedC.z, 7.5, GetHashKey(v), 70)

        if veh ~= 0 then
            return false
        end
    end

    return veh
end

S.Attach = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)

    local playerPos = GetEntityCoords(player)

    if brancard ~= nil then
        if brancard == -1 then

            NetworkRequestControlOfEntity(brancard)
            LoadAnim("anim@heists@box_carry@")
            TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)

            SetTimeout(150, function()
                AttachEntityToEntity(brancard, ped, GetPedBoneIndex(ped, 28422), 0.0, -1.0, -1.0, 195.0, 180.0, 180.0, 90.0, false, false, true, false, 2, true)
            end)

            FreezeEntityPosition(object, false)
        else

            NetworkRequestControlOfEntity(brancard)

            while not HasAnimDictLoaded("anim@heists@box_carry@") do
                RequestAnimDict("anim@heists@box_carry@")

                Citizen.Wait(1)
            end
            TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)

            SetTimeout(150, function()
                AttachEntityToEntity(brancard, ped, GetPedBoneIndex(ped, 28422), 0.0, -1.0, -1.0, 195.0, 180.0, 180.0, 90.0, false, false, true, false, 2, true)
            end)

            FreezeEntityPosition(object, false)
        end
    end
end

S.Detach = function()
    local ped = PlayerPedId()

    DetachEntity(brancard, false, true)
    ClearPedTasks(ped)
    attached = false
end

S.SetClosest = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local object = GetClosestObjectOfType(pedC.x, pedC.y, pedC.z, 10.0, GetHashKey("prop_ld_binbag_01"), false, false, false)

    if object ~= 0 then
        brancard = object
    end
end

S.GetBrancard = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local veh = S.CheckBrancard()

    if veh ~= 0 then
        local VehCoords = GetOffsetFromEntityInWorldCoords(PlayerPed, 0, 0.75, 0)

        while not HasModelLoaded('prop_ld_binbag_01') do
            RequestModel('prop_ld_binbag_01')

            Citizen.Wait(1)
        end

        object = CreateObject(GetHashKey('prop_ld_binbag_01'), pedC, true)
        if object ~= nil or object ~= 0 then

            SetEntityRotation(object, 0.0, 0.0, GetEntityHeading(Vehicle), false, false)
            FreezeEntityPosition(object, true)
            PlaceObjectOnGroundProperly(object)
            brancard = object

            SetTimeout(200, function()
                S.Attach()
                attached = true
            end)
        end
    else
        ESX.ShowNotification('No estás cerca de una ambulancia')
    end
end

S.Lay = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local obj = GetClosestObjectOfType(pedC.x, pedC.y, pedC.z, 3.0, GetHashKey('prop_ld_binbag_01'), false, false, false)
    local player, distance = ESX.Game.GetClosestPlayer()

    if player == -1 then
        while not HasAnimDictLoaded("anim@gangops@morgue@table@") do
            RequestAnimDict("anim@gangops@morgue@table@")

            Citizen.Wait(1)
        end

        if obj ~= nil or obj ~= 0 then
            TaskPlayAnim(PlayerPedId(), "anim@gangops@morgue@table@", "ko_front", 8.0, 8.0, -1, 69, 1, false, false, false)
            AttachEntityToEntity(ped, obj, 0, 0, 0.0, 1.6, 0.0, 0.0, 360.0, 0.0, false, false, false, false, 2, true)

            layed = true
        end
    else
        while not HasAnimDictLoaded("anim@gangops@morgue@table@") do
            RequestAnimDict("anim@gangops@morgue@table@")

            Citizen.Wait(1)
        end

        if obj ~= nil or obj ~= 0 then
            TaskPlayAnim(PlayerPedId(), "anim@gangops@morgue@table@", "ko_front", 8.0, 8.0, -1, 69, 1, false, false, false)
            AttachEntityToEntity(ped, obj, 0, 0, 0.0, 1.6, 0.0, 0.0, 360.0, 0.0, false, false, false, false, 2, true)

            layed = true
        end
    end
end

S.GetOff = function()
    local ped = PlayerPedId()
    local pedC = GetEntityCoords(ped)
    local coords = GetOffsetFromEntityInWorldCoords(brancard, 0.85, 0.0, 0)

    ClearPedTasks(ped)
    DetachEntity(ped, false, true)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)

    layed = false
end

-- END Functions

-- Threads

Citizen.CreateThread(function()
    while true do
        local s = 500

        local ped = PlayerPedId()

        S.SetClosest()

        if attached then
            s = 0

            for k,v in pairs(Config.DetachKeys) do
                if IsControlJustPressed(0, v) or IsDisabledControlJustPressed(0, v) then
                    S.Detach()
                end
            end

            if IsPedShooting(ped) or IsPlayerFreeAiming(PlayerId()) or IsPedInMeleeCombat(ped) then
                S.Detach()
            end

            if IsPedDeadOrDying(ped, false) then
                S.Detach()
            end

            if IsPedRagdoll(ped) then
                S.Detach()
            end
        end

        Citizen.Wait(s)
    end
end)

Citizen.CreateThread(function()
    while true do
        local s = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)

        if brancard ~= nil then
            local objectC = GetEntityCoords(brancard)
            local offset = GetOffsetFromEntityInWorldCoords(brancard, 0, 0.85, 0)

            local dist = #(pedC - vector3(offset.x, offset.y, offset.z))

            if dist <= 2 then
                s = 0

                if not layed then
                    if not attached then
                        S.Draw('~h~~b~COGER CAMILLA', offset.x, offset.y, offset.z + 1.5)
                        S.Draw('Pulsa la H', offset.x, offset.y, offset.z + 1.35)
                        S.Draw('~h~~b~CONGELAR CAMILLA', offset.x, offset.y, offset.z + 1.15)
                        S.Draw('Pulsa la G', offset.x, offset.y, offset.z + 1.0)

                        if IsControlJustPressed(0, 74) then
                            S.Attach()

                            attached = true
                        end

                        if IsControlJustPressed(0, 58) then
                            FreezeEntityPosition(brancard, true)
                        end
                    else
                        S.Draw('~h~~b~DEJAR CAMILLA', offset.x, offset.y, offset.z + 1.15)
                        S.Draw('Pulsa la H', offset.x, offset.y, offset.z + 1.0)

                        if IsControlJustPressed(0, 74) then
                            S.Detach()

                            attached = false
                        end
                    end
                end

                if not layed then
                    if not attached then
                        S.Draw('~h~~b~SUBIRTE', offset.x, offset.y, offset.z + 0.85)
                        S.Draw('Pulsa la Y', offset.x, offset.y, offset.z + 0.70)

                        if IsControlJustPressed(0, 246) or IsDisabledControlJustPressed(0, 246) then
                            S.Lay()
                        end
                    end
                else
                    if not attached then
                        S.Draw('~h~~b~BAJARTE', offset.x, offset.y, offset.z + 1.0)
                        S.Draw('Pulsa la Y', offset.x, offset.y, offset.z + 0.85)

                        if IsControlJustPressed(0, 246) or IsDisabledControlJustPressed(0, 246) then
                            S.GetOff()
                        end
                    end
                end
            end
        end

        Citizen.Wait(s)
    end
end)

RegisterCommand('borrarcamilla', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)

        local obj = GetClosestObjectOfType(pedC.x, pedC.y, pedC.z, 3.0, GetHashKey('prop_ld_binbag_01'), false, false, false)
        if obj ~= nil or obj ~= 0 then
            S.Detach()
    
            DeleteObject(brancard)
            ClearPedTasks(PlayerPedId())
        else
            ESX.ShowNotification('No hay ningúna camilla cerca')
        end
    else
        ESX.ShowNotification('No eres EMS para utilizar este comando')
    end
end)

RegisterCommand('camilla', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
        S.GetBrancard()
    else
        ESX.ShowNotification('No eres EMS para utilizar este comando')
    end
end)

-- END Threads

-- Events

AddEventHandler('onResourceStop', function()
    if brancard ~= nil then
        S.Detach()

        DeleteObject(brancard)
        ClearPedTasks(PlayerPedId())
    end
end)

-- END Events