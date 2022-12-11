
--┌≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈┐
--│                                                       │
--│  #     Noqueado                                       │
--│                                                       │
--│                                                       │
--│  Efecto Noqueado {When knocked out,                   │ 
--│                                                       │
--│                                                       │
--│               			                              │ 
--│  @ Modificado By Chino Sousa                          │
--│                                                       │
--│             					                      │
--│                                                       │
--└≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈┘

local knockedOut = false
local wait = 15
local count = 60


Citizen.CreateThread(function()
	while true do
		Wait(1)
        local myPed = GetPlayerPed(-1)
        -- Con arma cuerpo a cuerpo o solo desarmado
        if IsPedInMeleeCombat(myPed) then
            -- Sin ningún tipo de arma {SIN ARMAS}
            if (HasPedBeenDamagedByWeapon(myPed, GetHashKey("WEAPON_UNARMED"), 0) )then
                -- Salud para ser noqueado
                if GetEntityHealth(myPed) < 145 then
                    SetPlayerInvincible(PlayerId(), false)
                    -- Position taken by your Ped
					SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
					ShowNotification("~r~Has sido noqueado!")
					--  Efecto
					--ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 2.5)
					-- tiempo a esperar
                    wait = 25
                    --** añade barra de progreso si desea **--
					knockedOut = true
					-- La salud después del noqueado preferiblemente no la hagas más de 150 (50 %) porque la gente abusará de ella {No hay necesidad de ir al hospital más o menos}
					SetEntityHealth(myPed, 130)
				end
			end
		end

		
		if knockedOut == true then		
			-- Tu ped es capaz de morir
			SetPlayerInvincible(PlayerId(), false)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			-- Red Cam
			--SetTimecycleModifier("REDMIST")
			-- Cam vibration
			--ShakeGameplayCam("VIBRATE_SHAKE", 1.0)
			if wait >= 0 then
				count = count - 1
                if count == 0 then
                    
					count = 60
					wait = wait - 1
					--- in case bark
                    if GetEntityHealth(myPed) <= 50 then
                        -- Ped healing 
						SetEntityHealth(myPed, GetEntityHealth(myPed)+2)
						
					end
				end
            else
                -- Remove red cam
				--SetTimecycleModifier("")
                --SetTransitionTimecycleModifier("")		
                -- Ped Able to die again
				SetPlayerInvincible(PlayerId(), false)
				knockedOut = false
			end
		end

	end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end