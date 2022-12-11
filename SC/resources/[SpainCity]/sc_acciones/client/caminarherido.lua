local hurt = false
Citizen.CreateThread(function()
    while true do
        Wait(200)
        Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~t~ ~y~SpainCity.es ~t~| ~w~ID: ' .. GetPlayerServerId(PlayerId()) .. ' ~t~| ~b~Nombre: ~b~' .. GetPlayerName(PlayerId()) ..  "")
        if GetEntityHealth(GetPlayerPed(-1)) <= 150 then
            setHurt()
        elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 150 then
            setNotHurt()
        end
    end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(GetPlayerPed(-1))
    ResetPedWeaponMovementClipset(GetPlayerPed(-1))
    ResetPedStrafeClipset(GetPlayerPed(-1))
end