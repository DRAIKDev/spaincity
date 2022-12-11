local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)



local mp_pointing = false
local keyPressed = false

function spaincityfunt()
Citizen.CreateThread(function()while true do 
    Citizen.Wait(0)
    if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
        if not IsPedOnFoot(PlayerPedId()) then
            stopPointing()

        else
            local ped = GetPlayerPed(-1)
            local camPitch = GetGameplayCamRelativePitch()
            if camPitch < -70.0 then
                camPitch = -70.0
            elseif camPitch > 42.0 then
                camPitch = 42.0
            end
            camPitch = (camPitch + 70.0) / 112.0

            local camHeading = GetGameplayCamRelativeHeading()
            local cosCamHeading = Cos(camHeading)
            local sinCamHeading = Sin(camHeading)
            if camHeading < -180.0 then
                camHeading = -180.0
            elseif camHeading > 180.0 then
                camHeading = 180.0
            end
            camHeading = (camHeading + 180.0) / 360.0

            local blocked = 0
            local nn = 0

            local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
            local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
            nn,blocked,coords,coords = GetRaycastResult(ray)

            Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
            Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
            Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
            Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

        end
    end
    if apunta == false then
        return
    end 
end
end)
end


function startPointing()
    apunta = true
    spaincityfunt()
    ssss = true
    Citizen.CreateThread(function()while ssss do 
        Citizen.Wait(0)
        if apunta == false then
            return
        end 
   
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
    ssss= false
end end)
end

function stopPointing()
    apunta = false
    
    sasdsad =true
    Citizen.CreateThread(function()while sasdsad do 
        Citizen.Wait(0)
        if stop == false then 
            return
        end 
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
    sasdsad=false
end end)
end


local once = true

RegisterCommand('apuntardedo', function() 
    if once then
        once = false
    end
    if not keyPressed then
        if IsPedOnFoot(PlayerPedId()) then
            Wait(200)
            
                keyPressed = true
                startPointing()
                mp_pointing = true
        end
    else
        if  IsPedOnFoot(PlayerPedId()) then
        stopPointing()
        keyPressed = false
        end
    end
    
    
    
    
end)


RegisterKeyMapping('apuntardedo', 'Señalar con el dedo', 'keyboard', 'B' )
local crouched = false

RegisterCommand('agacharse', function() 
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

        if ( not IsPauseMenuActive() ) then 
            --if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                RequestAnimSet( "move_ped_crouched" )

                while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                    Citizen.Wait( 100 )
                end 

                if ( crouched == true ) then 
                    ResetPedMovementClipset( ped, 0 )
                    crouched = false 
                elseif ( crouched == false ) then
                    SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                    crouched = true 
                end 
            --end
        end 
    else
        Citizen.Wait(3000)
    end 
end)

RegisterKeyMapping('agacharse', 'Agacharte', 'keyboard', 'LCONTROL' )
