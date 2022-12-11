--[[ QUESTION ANTI RP ]]
-- ***************** NUI Variables
local questionOpen = false
local cam = nil
local firstSpawn = true
local steamID = nil

--Debug
--[[
RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
  if firstSpawn then
    TriggerServerEvent('chaini_test:hagoTestTrasRegister')

    firstSpawn = false
  end
end)
]]
--TriggerServerEvent('chaini_test:hagoTestTrasRegister')

RegisterNetEvent('chaini_test:notMade')
AddEventHandler('chaini_test:notMade', function(steam)
  steamID = steam
  SetEntityCoords(ped,222.62,-888.44,29.69)
  SetEntityInvincible(PlayerPedId(),true)
  openGui()
  CreoCam()
  SetEntityVisible(PlayerPedId(), false)
	questionOpen = true
end)

-- ***************** Open Gui and Focus NUI
function openGui()
  DisplayHud(false)
  SetNuiFocus( true, true ) 
  SendNUIMessage({openQuestion = true})
end

-- ***************** Close Gui and disable NUI
function closeGui()
  DisplayHud(true)
  questionOpen = false
  SetNuiFocus(false)
  SendNUIMessage({openQuestion = false})
  SetEntityInvincible(PlayerPedId(),false)
end

function CreoCam()

  cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

  SetCamActive(cam, true)
	RenderScriptCams(true, false, 500, true, true)

	
  SetCamRot(cam, -10.0, 0.0, -40.0, true)
  SetCamCoord(cam,114.46,-1015.78,74.87)

end

function DeleteCam()

  SetCamActive(cam, false)
  SetCamActive(cam, false)
  RenderScriptCams(false, false, 500, true, true)
  cam = nil

  
end
-- ***************** Disable controls while GUI open
Citizen.CreateThread(function()
  while true do
    --SetNuiFocus(false)
    if questionOpen then
      
      local ply = PlayerPedId()
      local active = true

      if IsPlayerDead(PlayerId()) then
        local coords = GetEntityCoords(PlayerPedId())
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 0.0, true, false)
        SetEntityHealth(PlayerPedId(),200)
      end

      if not DoesCamExist(cam) then
        CreoCam()
      end

      if IsEntityVisible(ply) then
        SetEntityVisible(ply,false)
      end
      DisableAllControlActions(0)
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
    --  if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
    ----    SendNUIMessage({type = "click"})
    --  end
    end
    Citizen.Wait(0)
  end
end)

-- ***************** NUI Callback Methods
-- Callbacks pages opening

RegisterNUICallback('question', function(data, cb)
  SendNUIMessage({openSection = "question"})
  cb('ok')
end)

-- Callback actions triggering server events
RegisterNUICallback('close', function(data, cb)
  -- if question success
  closeGui()
  SetEntityVisible(PlayerPedId(),true)
  DeleteCam()
  TriggerServerEvent('chaini_test:success',steamID)
  cb('ok')
  ExecuteCommand("register")
end)

RegisterNUICallback('kick', function(data, cb)
  closeGui()
  SetEntityVisible(PlayerPedId(),true)
  DeleteCam()
  TriggerServerEvent('chaini_test:kick')
  cb('ok')
end)






