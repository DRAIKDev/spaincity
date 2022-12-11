local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
--s
--- action functions
local CurrentAction = nil
local CurrentActionMsg = ""
local CurrentActionData = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

--- esx
local GUI = {}
ESX = nil
GUI.Time = 0
local PlayerData = {}

Citizen.CreateThread(
  function()
      while ESX == nil do
          TriggerEvent(
              "esx:getSharedObject",
              function(obj)
                  ESX = obj
              end
          )
          Citizen.Wait(0)
          PlayerData = ESX.GetPlayerData()
      end
  end
)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
  "esx:playerLoaded",
  function(xPlayer)
      PlayerData = xPlayer
  end
)

RegisterNetEvent("esx:setJob")
AddEventHandler(
  "esx:setJob",
  function(job)
      PlayerData.job = job
  end
)

-- MARKERS --
AddEventHandler(
  "esx_duty:hasEnteredMarker",
  function(zone)
    
    -- CNP --
    if zone == "CNPDuty" or zone == "CNIDuty" or zone == "GEODuty" then
        CurrentAction = "cnp_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end
    
    -- GC --
    if zone == "GCDuty" or zone == "MilitaryDuty" then
      CurrentAction = "military_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    -- EMS --
    if zone == "AmbulanceDuty" then
      CurrentAction = "ambulance_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    if zone == "Medico_IlegalDuty" then
        CurrentAction = "medico_ilegal_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    -- MECANICO --
    if zone == "MechanicDuty" or zone == "MechanicNorteDuty" then
      CurrentAction = "mechanic_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    -- TAXIS --
    if zone == "TaxiDuty" then
      CurrentAction = "taxi_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    -- JOBS --

    if zone == "AbogadoDuty" then
      CurrentAction = "abogado_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    if zone == "AmmuCentralDuty" then
      CurrentAction = "ammu_central_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    if zone == "BahamasDuty" then
        CurrentAction = "bahamas_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    if zone == "CafeteriaDuty" then
        CurrentAction = "cafeteria_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    if zone == "CyberDuty" then
      CurrentAction = "cyber_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    if zone == "DiscoDuty" then
      CurrentAction = "disco_duty"
      CurrentActionMsg = _U("duty")
      CurrentActionData = {}
    end

    if zone == "GalaxyDuty" then
        CurrentAction = "galaxy_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    if zone == "GymDuty" then
        CurrentAction = "gymjob_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    if zone == "PearlsDuty" then
        CurrentAction = "pearls_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    if zone == "TequilaDuty" then
        CurrentAction = "tequila_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    if zone == "VanillaDuty" then
        CurrentAction = "vanilla_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    if zone == "YellowDuty" then
        CurrentAction = "yellow_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
    end

    -- MAFIAS --

      -- MAFIA 01 --
      if zone == "Mafia01Duty1" then
        CurrentAction = "mafia01_citypearls_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      --[[
      if zone == "Mafia01Duty2" then
        CurrentAction = ""
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      ]]
      --[[
      if zone == "Mafia01Duty3" then
        CurrentAction = ""
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      ]]

      -- MAFIA 02 --
      
      if zone == "Mafia02Duty1" then
        CurrentAction = "mafia02_pbyellow_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      
      --[[
      if zone == "Mafia02Duty2" then
        CurrentAction = ""
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      ]]
      --[[
      if zone == "Mafia02Duty3" then
        CurrentAction = ""
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      ]]

      -- MAFIA 03 --
      if zone == "Mafia03Duty1" then
        CurrentAction = "mafia03_pearls_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      if zone == "Mafia03Duty2" then
        CurrentAction = "mafia03_baducentral_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      
      if zone == "Mafia03Duty3" then
        CurrentAction = "mafia03_tequila_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      

      -- MAFIA 04 --
      if zone == "Mafia04Duty1" then
        CurrentAction = "mafia04_tequila_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      
      if zone == "Mafia04Duty2" then
        CurrentAction = "mafia04_bahamas_duty"
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end

      --[[
      if zone == "Mafia04Duty3" then
        CurrentAction = ""
        CurrentActionMsg = _U("duty")
        CurrentActionData = {}
      end
      ]]

  end
)

AddEventHandler(
  "esx_duty:hasExitedMarker",
  function(zone)
      CurrentAction = nil
  end
)

--keycontrols
Citizen.CreateThread(
  function()
      while true do
          s = 1000
          local playerPed = GetPlayerPed(-1)

          if CurrentAction ~= nil then
              s = 0
              SetTextComponentFormat("STRING")
              AddTextComponentString(CurrentActionMsg)
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlPressed(0, Keys["E"]) then
                -- CNP --  
                if CurrentAction == "cnp_duty" then
                    if PlayerData.job.name == "cnp" or PlayerData.job.name == "offcnp" then
                        TriggerServerEvent("duty:cnp")
                        if PlayerData.job.name == "cnp" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notpol"), "error", 5000)
                        Wait(1000)
                    end
                end

                -- GC --
                if CurrentAction == "military_duty" then
                    if PlayerData.job.name == "military" or PlayerData.job.name == "offmilitary" then
                        TriggerServerEvent("duty:military")
                        if PlayerData.job.name == "military" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notmili"), "error", 5000)
                        Wait(1000)
                    end
                end

                -- EMS --
                if CurrentAction == "ambulance_duty" then
                    if PlayerData.job.name == "ambulance" or PlayerData.job.name == "offambulance" then
                        TriggerServerEvent("duty:ambulance")
                        if PlayerData.job.name == "ambulance" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notamb"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "medico_ilegal_duty" then
                    if PlayerData.job.name == "medico_ilegal" or PlayerData.job.name == "offmedico_ilegal" then
                        TriggerServerEvent("duty:medico_ilegal")
                        if PlayerData.job.name == "offmedico_ilegal" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(("¿Que intentas payaso?"), "error", 5000)
                        Wait(1000)
                    end
                end

                -- MECANICO --
                if CurrentAction == "mechanic_duty" then
                    if PlayerData.job.name == "mechanic" or PlayerData.job.name == "offmechanic" then
                        TriggerServerEvent("duty:mechanic")
                        if PlayerData.job.name == "mechanic" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notmech"), "error", 5000)
                        Wait(1000)
                    end
                end

                -- TAXIS --
                if CurrentAction == "taxi_duty" then
                    if PlayerData.job.name == "taxi" or PlayerData.job.name == "offtaxi" then
                        TriggerServerEvent("duty:taxi")
                        if PlayerData.job.name == "taxi" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("nottaxi"), "error", 5000)
                        Wait(1000)
                    end
                end

                -- JOBS --
                if CurrentAction == "abogado_duty" then
                    if PlayerData.job.name == "abogado" or PlayerData.job.name == "offabogado" then
                        TriggerServerEvent("duty:abogado")
                        if PlayerData.job.name == "abogado" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end
                 
                if CurrentAction == "ammu_central_duty" then
                    if PlayerData.job.name == "ammucentral" or PlayerData.job.name == "offammucentral" then
                        TriggerServerEvent("duty:ammu_central")
                        if PlayerData.job.name == "ammucentral" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end
                
                if CurrentAction == "bahamas_duty" then
                    if PlayerData.job.name == "bahamas" or PlayerData.job.name == "offbahamas" then
                        TriggerServerEvent("duty:bahamas")
                        if PlayerData.job.name == "bahamas" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end
                
                if CurrentAction == "cafeteria_duty" then
                    if PlayerData.job.name == "pbcafeteria" or PlayerData.job.name == "offpbcafeteria" then
                        TriggerServerEvent("duty:cafeteria")
                        if PlayerData.job.name == "pbcafeteria" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "cyber_duty" then
                    if PlayerData.job.name == "cyber" or PlayerData.job.name == "offcyber" then
                        TriggerServerEvent("duty:cyber")
                        if PlayerData.job.name == "cyber" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "disco_duty" then
                    if PlayerData.job.name == "pbdiscoteca" or PlayerData.job.name == "offpbdiscoteca" then
                        TriggerServerEvent("duty:disco")
                        if PlayerData.job.name == "pbdiscoteca" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "galaxy_duty" then
                    if PlayerData.job.name == "galaxy" or PlayerData.job.name == "offgalaxy" then
                        TriggerServerEvent("duty:galaxy")
                        if PlayerData.job.name == "galaxy" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "gymjob_duty" then
                    if PlayerData.job.name == "gymjob" or PlayerData.job.name == "offgymjob" then
                        TriggerServerEvent("duty:gymjob")
                        if PlayerData.job.name == "offgymjob" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "pearls_duty" then
                    if PlayerData.job.name == "citypearls" or PlayerData.job.name == "offcitypearls" then
                        TriggerServerEvent("duty:pearls")
                        if PlayerData.job.name == "citypearls" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "tequila_duty" then
                    if PlayerData.job.name == "tequila" or PlayerData.job.name == "offtequila" then
                        TriggerServerEvent("duty:tequila")
                        if PlayerData.job.name == "tequila" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "vanilla_duty" then
                    if PlayerData.job.name == "offvanilla" or PlayerData.job.name == "vanilla" then
                        TriggerServerEvent("duty:vanilla")
                        if PlayerData.job.name == "vanilla" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end

                if CurrentAction == "yellow_duty" then
                    if PlayerData.job.name == "pbyellow" or PlayerData.job.name == "offpbyellow" then
                        TriggerServerEvent("duty:yellow")
                        if PlayerData.job.name == "pbyellow" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                end
                -- MAFIAS --

                    -- MAFIA 01 --
                    if CurrentAction == "mafia01_citypearls_duty" then
                        if PlayerData.job.name == "mafia01" or PlayerData.job.name == "offcitypearls" then
                            TriggerServerEvent("duty:mafia01_citypearls")
                            if PlayerData.job.name == "offcitypearls" then
                                sendNotification(_U("offduty"), "success", 2500)
                                Wait(1000)
                            else
                                sendNotification(_U("onduty"), "success", 2500)
                                Wait(1000)
                            end
                        else
                            sendNotification(_U("notjob"), "error", 5000)
                            Wait(1000)
                        end
                    end

                    -- MAFIA 02 --
                    
                    if CurrentAction == "mafia02_pbyellow_duty" then
                        if PlayerData.job.name == "mafia02" or PlayerData.job.name == "offpbyellow" then
                            TriggerServerEvent("duty:mafia02_pbyellow")
                            if PlayerData.job.name == "offpbyellow" then
                                sendNotification(_U("offduty"), "success", 2500)
                                Wait(1000)
                            else
                                sendNotification(_U("onduty"), "success", 2500)
                                Wait(1000)
                            end
                        else
                            sendNotification(_U("notjob"), "error", 5000)
                            Wait(1000)
                        end
                    end

                    -- MAFIA 03 --
                    if CurrentAction == "mafia03_pearls_duty" then
                        if PlayerData.job.name == "mafia03" or PlayerData.job.name == "offcitypearls" then
                            TriggerServerEvent("duty:mafia03_pearls")
                            if PlayerData.job.name == "offcitypearls" then
                                sendNotification(_U("offduty"), "success", 2500)
                                Wait(1000)
                            else
                                sendNotification(_U("onduty"), "success", 2500)
                                Wait(1000)
                            end
                        else
                            sendNotification(_U("notjob"), "error", 5000)
                            Wait(1000)
                        end
                    end

                    if CurrentAction == "mafia03_baducentral_duty" then
                      if PlayerData.job.name == "mafia03" or PlayerData.job.name == "baducentral" then
                          TriggerServerEvent("duty:mafia03_baducentral")
                          if PlayerData.job.name == "mafia03" then
                              sendNotification(_U("offduty"), "success", 2500)
                              Wait(1000)
                          else
                              sendNotification(_U("onduty"), "success", 2500)
                              Wait(1000)
                          end
                      else
                          sendNotification(_U("notjob"), "error", 5000)
                          Wait(1000)
                      end
                  end

                  if CurrentAction == "mafia03_tequila_duty" then
                      if PlayerData.job.name == "mafia03" or PlayerData.job.name == "offtequila" then
                          TriggerServerEvent("duty:mafia03_tequila")
                          if PlayerData.job.name == "mafia03" then
                              sendNotification(_U("offduty"), "success", 2500)
                              Wait(1000)
                          else
                              sendNotification(_U("onduty"), "success", 2500)
                              Wait(1000)
                          end
                      else
                          sendNotification(_U("notjob"), "error", 5000)
                          Wait(1000)
                      end
                  end

                  if CurrentAction == "mafia04_tequila_duty" then
                    if PlayerData.job.name == "mafia04" or PlayerData.job.name == "offtequila" then
                        TriggerServerEvent("duty:mafia04_tequila")
                        if PlayerData.job.name == "offtequila" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                  end

                  if CurrentAction == "mafia04_bahamas_duty" then
                    if PlayerData.job.name == "mafia04" or PlayerData.job.name == "offbahamas" then
                        TriggerServerEvent("duty:mafia04_bahamas")
                        if PlayerData.job.name == "offbahamas" then
                            sendNotification(_U("offduty"), "success", 2500)
                            Wait(1000)
                        else
                            sendNotification(_U("onduty"), "success", 2500)
                            Wait(1000)
                        end
                    else
                        sendNotification(_U("notjob"), "error", 5000)
                        Wait(1000)
                    end
                  end
            end
          else
              s = 1000
          end
          Citizen.Wait(s)
      end
end
)

-- Display markers
Citizen.CreateThread(
  function()
      while true do
          s = 1000

          local coords = GetEntityCoords(GetPlayerPed(-1))

          for k, v in pairs(Config.Zones) do
              if
                  (v.Type ~= -1 and
                      GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance)
               then
                  s = 0
                  DrawMarker(
                      v.Type,
                      v.Pos.x,
                      v.Pos.y,
                      v.Pos.z,
                      0.0,
                      0.0,
                      0.0,
                      0,
                      0.0,
                      0.0,
                      v.Size.x,
                      v.Size.y,
                      v.Size.z,
                      v.Color.r,
                      v.Color.g,
                      v.Color.b,
                      100,
                      false,
                      true,
                      2,
                      false,
                      false,
                      false,
                      false
                  )
              end
          end
          Wait(s)
      end
  end
)

-- Enter / Exit marker events
Citizen.CreateThread(
  function()
      while true do
          Wait(1000)

          local coords = GetEntityCoords(GetPlayerPed(-1))
          local isInMarker = false
          local currentZone = nil

          for k, v in pairs(Config.Zones) do
              if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                  isInMarker = true
                  currentZone = k
              end
          end

          if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
              HasAlreadyEnteredMarker = true
              LastZone = currentZone
              TriggerEvent("esx_duty:hasEnteredMarker", currentZone)
          end

          if not isInMarker and HasAlreadyEnteredMarker then
              HasAlreadyEnteredMarker = false
              TriggerEvent("esx_duty:hasExitedMarker", LastZone)
          end
      end
  end
)



--notification
function sendNotification(message, messageType, messageTimeout)
  TriggerEvent(
      "pNotify:SendNotification",
      {
          text = message,
          type = messageType,
          queue = "duty",
          timeout = messageTimeout,
          layout = "bottomCenter"
      }
  )
end

