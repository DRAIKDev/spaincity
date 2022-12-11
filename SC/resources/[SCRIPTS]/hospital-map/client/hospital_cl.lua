
function Notify(text)
  SetNotificationTextEntry('STRING')
  AddTextComponentString(text)
  DrawNotification(false, false)
end


function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end




medicos = {
  ['norte'] = {coords = vector3(-248.0975, 6331.743, 31.42625), heading = 221.25},
  ['sandy'] = {coords = vector3(2487.652, 3726.16, 42.92157), heading = 40.44},
  ['puerto'] = {coords = vector3(-803.0162, -1235.616, 6.337423), heading = 140.20},

}


Citizen.CreateThread(function()
  while true do
      local sleep = 100
      for k, v in pairs(medicos) do
          local me = PlayerPedId()
          if GetDistanceBetweenCoords(GetEntityCoords(me), v.coords) <= 35.0 then
              DrawText3D1(v.coords-vector3(0.0, 0.0, -2.5), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0),"~w~Enfermero~y~\nPresiona [~b~E~y~] para hablar con el medico", 0, 0.2, 0.2, 150)
              DrawMarker(23, v.coords-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 90.0), vector3(1.0, 1.0, -2.0), 30,140, 20, 150, false, false, 2, false, false, false)
              sleep = 0
              if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.coords, true) <= 2.2 then
                ShowInfo("Presiona ~INPUT_VEH_HORN~ para solicitar un tratamiento", 0)
                       if IsControlJustReleased(0, 38) then
                       -- if  tonumber(GetEntityHealth(PlayerPedId())) > 100 then
                           -- Notify("No te puedo curar estas más vivo de lo que me gustaria")

                        -- else
                        Notify("El ~g~~h~doctor~h~ ~s~va a ~r~~h~atenderte~h~~s~ en un ~b~~h~momento~h~~s~. No te muevas")
                        TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_SUNBATHE_BACK', 0, false)
                        Citizen.Wait(15000)
                        ClearPedTasks(PlayerPedId())
                        if GetDistanceBetweenCoords(GetEntityCoords(me), v.coords) <= 5.8 then
                            print("1")
                        TriggerEvent('esx_ambulancejob:rethivive')
                        Notify("El ~g~~h~doctor~h~~s~ te ~y~curo~s~")
                        else 
                          Notify("Te ~r~~h~moviste~h~~s~, el ~g~~h~doctor~h~~s~ no te pudo ~r~~h~curar!~h~~s~")
                        end
                        -- end 
                    end
              end
          end
      end
      Wait(sleep)
  end
end)

DrawText3D1 = function(x,y,z,textInput,fontId,scaleX,scaleY,opacity)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*8
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, opacity)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+12, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("s_m_m_doctor_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
      Wait(1)
    end
      for k, v in pairs(medicos) do
        local hospitalped =  CreatePed(4, 0xd47303ac, v.coords-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), v.heading, false, true)
        SetEntityHeading(hospitalped, v.heading)
        FreezeEntityPosition(hospitalped, true)
        SetEntityInvincible(hospitalped, true)
        SetBlockingOfNonTemporaryEvents(hospitalped, true)
      end

end)

