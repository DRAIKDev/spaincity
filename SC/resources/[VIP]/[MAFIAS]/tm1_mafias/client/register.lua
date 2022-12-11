--===============================================
--==                 VARIABLES                 ==
--===============================================


--===============================================
--==           REGISTERS AND EVENTS            ==
--===============================================

--===============================================
--==                 THREADING                 ==
--===============================================


Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown

            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
            Citizen.Wait(0)
        else
            Citizen.Wait(100)
        end
    end
end)

--===============================================
--==                 FUNCTIONS                 ==
--===============================================
function EnableGui(enable)
    SetNuiFocus(enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end