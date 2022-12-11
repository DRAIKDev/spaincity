local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
  
local PlayerData = {}
local arms       = { {x = -1202.9837,y = -1565.1718,z = 4.6115} }
local pushup     = { {x = -1203.3242,y = -1570.6184,z = 4.6115} }
local yoga       = { {x = -1204.7958,y = -1560.1906,z = 4.6115} }
local situps     = { {x = -1206.1055,y = -1565.1589,z = 4.6115} }
local chins      = { {x = -1200.1284,y = -1570.9903,z = 4.6115} }
local training   = false
local resting    = false
local licencia   = false
  
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()
        while true do
            local time = 1000
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
                if GetDistanceBetweenCoords(-1202.09, -1567.54, 4.61, plyCoords.x, plyCoords.y, plyCoords.z) < 20 then
                  time = 0
                  DrawMarker(3, -1202.9837, -1565.1718, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
                  DrawMarker(3, -1203.3242, -1570.6184, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
                  DrawMarker(3, -1204.7958, -1560.1906, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
                  DrawMarker(3, -1206.1055, -1565.1589, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
                  --DrawMarker(3, -1195.6551, -1577.7689, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, 0, 0, 1)
                  DrawMarker(3, -1200.1284, -1570.9903, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
                end
  
        --for k in pairs(gym) do 
        --  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)  
        --  if dist <= 0.5 then
        --      DrawText3D1(gym[k].x, gym[k].y, gym[k].z,'Presiona [E] para abrir la ~b~tienda del gimnasio~w~', 0, 0.2, 0.2,150)
        --      if IsControlJustPressed(0, Keys['E']) then
		-- 		    OpenGymMenu()
        --      end			
        --   end
        --end
            for k in pairs(arms) do
  
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arms[k].x, arms[k].y, arms[k].z)
  
                if dist <= 0.5 then
                    DrawText3D1(arms[k].x, arms[k].y, arms[k].z,'Presiona [E] para hacer ~g~brazos', 0, 0.2, 0.2,150)

                    if IsControlJustPressed(0, Keys['E']) then
                        if training == false then
                        
                            --TriggerServerEvent('esx_gym:checkChip')
						    ESX.ShowNotification("Preparing the ~g~exersice~w~...")
						    Citizen.Wait(1000)

                            if licencia == true then
                                ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
                                Citizen.Wait(1000)					
                        
                                local playerPed = PlayerPedId()
                                TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
                                Citizen.Wait(30000)
                                exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
                                ClearPedTasksImmediately(playerPed)

                                training = true
                            elseif licencia == false then
                                ESX.ShowNotification("Necesitas permiso GYM para poder realizar el ejercicio")
                            end
                        elseif training == true then
                            ESX.ShowNotification("Necesitas descansar...")
                                    
                            resting = true
                                    
                            CheckTraining()
                        end
                    end		
                end
            end
            for k in pairs(chins) do
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chins[k].x, chins[k].y, chins[k].z)
                if dist <= 0.5 then  
                    DrawText3D1(chins[k].x, chins[k].y, chins[k].z,'Presiona [E] para hacer ~g~abdominales', 0, 0.2, 0.2,150)
                    if IsControlJustPressed(0, Keys['E']) then
                        if training == false then
                            --TriggerServerEvent('esx_gym:checkChip')
                            ESX.ShowNotification("Preparing the ~g~exersice~w~...")
                            Citizen.Wait(1000)

                            if licencia == true then
                                ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
                                Citizen.Wait(1000)					
                                local playerPed = PlayerPedId()
                                TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
                                Citizen.Wait(30000)
                                exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
                                exports["gamz-skillsystem"]:UpdateSkill("Lung Capacity", 0.5)
                                ClearPedTasksImmediately(playerPed)

                                training = true
                            elseif licencia == false then
                                ESX.ShowNotification("Necesitas permiso GYM para poder realizar el ejercicio")
                            end
                        elseif training == true then
                            ESX.ShowNotification("Necesitas descansar...")
                                    
                            resting = true
                                    
                            CheckTraining()
                        end
                    end		
                end
            end
            for k in pairs(pushup) do
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pushup[k].x, pushup[k].y, pushup[k].z)
                if dist <= 0.5 then
                    DrawText3D1(pushup[k].x, pushup[k].y, pushup[k].z,'Presiona [E] para hacer ~g~flexiones', 0, 0.2, 0.2,150)
                    if IsControlJustPressed(0, Keys['E']) then
                        if training == false then
                           --TriggerServerEvent('esx_gym:checkChip')
						    ESX.ShowNotification("Preparing the ~g~exersice~w~...")
						    Citizen.Wait(1000)
                            if licencia == true then
                                ESX.ShowNotification("Preparando el  ~g~ejercicio~w~...")
                                Citizen.Wait(1000)					
                                      
                                local playerPed = PlayerPedId()
                                TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
                                Citizen.Wait(30000)
                                exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
                                exports["gamz-skillsystem"]:UpdateSkill("Stamina", 1)
                                ClearPedTasksImmediately(playerPed)

                                training = true
                            elseif licencia == false then
                                ESX.ShowNotification("Necesitas permiso GYM para poder realizar el ejercicio")
                            end
                        elseif training == true then
                            ESX.ShowNotification("Necesitas descansar...")    
                            resting = true    
                            CheckTraining()
                        end
                    end		
                end
            end
            for k in pairs(yoga) do
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, yoga[k].x, yoga[k].y, yoga[k].z)
                if dist <= 0.5 then
                    DrawText3D1(yoga[k].x, yoga[k].y, yoga[k].z,'Presiona [E] para hacer ~g~yoga', 0, 0.2, 0.2,150)
                    if IsControlJustPressed(0, Keys['E']) then
                        if training == false then
                            --TriggerServerEvent('esx_gym:checkChip')
                            ESX.ShowNotification("Preparing the ~g~exersice~w~...")
                            Citizen.Wait(1000)

                            if licencia == true then
                                ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
                                Citizen.Wait(1000)						
                                local playerPed = PlayerPedId()
                                TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
                                Citizen.Wait(30000)
                                exports["gamz-skillsystem"]:UpdateSkill("Lung Capacity", 1)
                                ClearPedTasksImmediately(playerPed)

                                training = true
                            elseif licencia == false then
                                ESX.ShowNotification("Necesitas permiso GYM para poder realizar el ejercicio")
                            end
                        elseif training == true then
                            ESX.ShowNotification("Necesitas descansar...")
                                        
                            resting = true
                                        
                            CheckTraining()
                        end
                    end		
                end
            end
            for k in pairs(situps) do
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, situps[k].x, situps[k].y, situps[k].z)
                if dist <= 0.5 then
                    DrawText3D1(situps[k].x, situps[k].y, situps[k].z,'Presiona [E] para hacer ~g~flexiones', 0, 0.2, 0.2,150)
                    if IsControlJustPressed(0, Keys['E']) then
                        if training == false then
                            --TriggerServerEvent('esx_gym:checkChip')
                            ESX.ShowNotification("Preparing the ~g~exersice~w~...")
                            Citizen.Wait(1000)
                            if licencia == true then
                                ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
                                Citizen.Wait(1000)					
                                local playerPed = PlayerPedId()
                                TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
                                Citizen.Wait(30000)
                                exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
                                ClearPedTasksImmediately(playerPed)
                                training = true
                            elseif licencia == false then
                                ESX.ShowNotification("Necesitas permiso GYM para poder realizar el ejercicio")
                            end
                        elseif training == true then
                            ESX.ShowNotification("Necesitas descansar...")                              
                            resting = true                                   
                            CheckTraining()
                        end
                    end    		
                end
            end
              Citizen.Wait(time)
      end
    end)
 DrawText3D1 = function(x,y,z,textInput,fontId,scaleX,scaleY,opacity)

end
function OpenGymMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_menu',
        {
            title    = 'Gimnasio',
			align = 'right',
            elements = {
				{label = 'Tienda', value = 'shop'},
				{label = 'Horario', value = 'hours'},
			--	{label = 'Alquilar Una Bici', value = 'bike'},
            }
        },
        function(data, menu)
            if data.current.value == 'shop' then
				OpenGymShopMenu()
            elseif data.current.value == 'hours' then
				ESX.UI.Menu.CloseAll()
				
				ESX.ShowNotification("Estamos abiertos las ~g~24~w~ horas del dia. ¡Bienvenido!")
            elseif data.current.value == 'bike' then
				OpenBikeMenu()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenGymShopMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_shop_menu',
        {
            title    = 'Gym - Tienda',
			align = 'right',
            elements = {
				{label = 'Batido Shake (160€)', value = 'protein_shake'},
				{label = 'Agua (90€)', value = 'water'},
				{label = 'Desayuno Deportivo (160€)', value = 'sportlunch'},
				{label = 'Powerade (300€)', value = 'powerade'},
				{label = 'Vendas (350€)', value = 'bandage'},
            }
        },
        function(data, menu)
            if data.current.value == 'protein_shake' then
				TriggerServerEvent('esx_gym:buyProteinshake')
            elseif data.current.value == 'water' then
				TriggerServerEvent('esx_gym:buyWater')
            elseif data.current.value == 'sportlunch' then
				TriggerServerEvent('esx_gym:buySportlunch')
            elseif data.current.value == 'powerade' then
				TriggerServerEvent('esx_gym:buyPowerade')
            elseif data.current.value == 'bandage' then
				TriggerServerEvent('esx_gym:buyBandage')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function CheckTraining()
	if resting == true then
		ESX.ShowNotification("Necesitas descansar...")
		
		resting = false
		Citizen.Wait(60000)
		training = false
	end
	
	if resting == false then
		ESX.ShowNotification("Ya puedes realizar otro ejercicio...")
	end
end

function OpenBikeMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'bike_menu',
        {
            title    = 'Elige una bicicleta',
			align = 'right',
            elements = {
				{label = 'BMX ($75)', value = 'bmx'},
				{label = 'Cruiser ($90)', value = 'cruiser'},
				{label = 'Fixter ($99)', value = 'fixter'},
				{label = 'Scorcher ($120)', value = 'scorcher'},
            }
        },
        function(data, menu)
            if data.current.value == 'bmx' then
				TriggerServerEvent('esx_gym:hireBmx')
				TriggerEvent('esx:spawnVehicle', "bmx")
				
				ESX.UI.Menu.CloseAll()
            elseif data.current.value == 'cruiser' then
				TriggerServerEvent('esx_gym:hireCruiser')
				TriggerEvent('esx:spawnVehicle', "cruiser")
				
				ESX.UI.Menu.CloseAll()
            elseif data.current.value == 'fixter' then
				TriggerServerEvent('esx_gym:hireFixter')
				TriggerEvent('esx:spawnVehicle', "fixter")
				
				ESX.UI.Menu.CloseAll()
            elseif data.current.value == 'scorcher' then
				TriggerServerEvent('esx_gym:hireScorcher')
				TriggerEvent('esx:spawnVehicle', "scorcher")
				
				ESX.UI.Menu.CloseAll()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

AddEventHandler('esx:playerLoaded', function ()
    TriggerServerEvent("esx_gym:comprobartarjeta")
end)

RegisterNetEvent('esx_gym:trueMembership')
AddEventHandler('esx_gym:trueMembership', function()
    licencia = true
end)

RegisterNetEvent('esx_gym:darMembership')
AddEventHandler('esx_gym:darMembership', function()
    TriggerServerEvent("esx_gym:comprobartarjeta")
end)
