ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



RegisterNetEvent("draik:textsent")
AddEventHandler('draik:textsent', function(tPID, names2,textmsg)
  TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Mensaje para: "..tPID.."^4] ^r^4 " .. names2 .."  "..": ^0" .. textmsg)
end)

RegisterNetEvent("draik:textmsg")
AddEventHandler('draik:textmsg', function(source, textmsg, names2, names3 )

  TriggerEvent('chatMessage', "", {255, 0, 0}, "^4[^*^0 Mensaje de: "..source.."^4] ^r^4 " .. names3 .."  "..": ^0" .. textmsg)

end)


--BAJAR DAÑO PORRA, PUÑOS y LINTERNA
----------------------------------------------------------------------------
Citizen.CreateThread(
  function()
      while true do
        N_0x4757f00bc6323cfe(-1553120962, 0.0) 
        Wait(0)
          N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.25)
          Wait(0)
          N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.4)
          Wait(0)
          N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ANIMAL"), 0.4)
          Wait(0)
          N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.3)
          Wait(0)
          N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNUCKLE"), 0.35)
          Wait(0)
          N_0x4757f00bc6323cfe(GetHashKey("WEAPON_WRENCH"), 0.4)
          Wait(0)
          N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 0.4)
          Wait(0)
      end
  end
)
----------------------------------------------------------------------------
--QUITAR CULATAZO
----------------------------------------------------------------------------
Citizen.CreateThread(
  function()
      while true do
          s = 1000
          local ped = PlayerPedId()
          if IsPedArmed(ped, 6) then
              s = 0
              DisableControlAction(1, 140, true)
              DisableControlAction(1, 141, true)
              DisableControlAction(1, 142, true)
          end
          Citizen.Wait(s)
      end
  end
)

Citizen.CreateThread( function()
  SetPedHelmet(GetPlayerPed(-1), false)
  
    while true do
      Citizen.Wait(900000)		
      local playerPed = GetPlayerPed(-1)
      local playerVeh = GetVehiclePedIsUsing(playerPed)
  
      if gPlayerVeh ~= 30000 then RemovePedHelmet(playerPed,true) end
    end
    
  end)
  