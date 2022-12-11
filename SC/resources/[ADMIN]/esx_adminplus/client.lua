ESX = nil
ENP_noclip = false
ENP_noclipSpeed = 2.91
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)
RegisterNetEvent('BanSql:Respond')
AddEventHandler('BanSql:Respond', function()
	TriggerServerEvent("BanSql:CheckMe")
end)
----------------------------------------------------------------------------------
RegisterNetEvent("esx_admin:killPlayer")
AddEventHandler("esx_admin:killPlayer", function()
  SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent("esx_admin:freezePlayer")
AddEventHandler("esx_admin:freezePlayer", function(input)
    local player = PlayerId()
	local ped = PlayerPedId()
    if input == 'freeze' then
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)
    elseif input == 'unfreeze' then
        SetEntityCollision(ped, true)
	    FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    end
end)

RegisterNetEvent('murtaza:fix')
AddEventHandler('murtaza:fix', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)

		TriggerEvent('esx:showNotification', '~g~Vehiculo arreglado!')
	else
		TriggerEvent('esx:showNotification', '~o~No estás en un vehículo! No hay nada que reparar')
	end
end)

RegisterNetEvent('murtaza:clean')
AddEventHandler('murtaza:clean', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
		TriggerEvent('esx:showNotification', '~b~Vehículo limpiado!')
	else
		notification("~o~No estás en un vehículo! No hay nada que limpiar")
		TriggerEvent('esx:showNotification', '~o~No estás en un vehículo! No hay nada que limpiar')
	end
end)

RegisterNetEvent("esx_admin:tpm")
AddEventHandler("esx_admin:tpm", function()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(5)
        end
        TriggerEvent('chatMessage', _U('teleported'))
    else
        TriggerEvent('chatMessage', _U('set_waypoint'))
    end
end)


----------
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)

        if ENP_noclip then
            local ped = GetPlayerPed(-1)
            local x,y,z = getPosition()
            local dx,dy,dz = getCamDirection()
            local speed = ENP_noclipSpeed
        
  
            SetEntityVelocity(ped, 0.05,  0.05,  0.05)
  
            if IsControlPressed(0, 32) then
                x = x + speed * dx
                y = y + speed * dy
                z = z + speed * dz
            end
  
            if IsControlPressed(0, 269) then
                x = x - speed * dx
                y = y - speed * dy
                z = z - speed * dz
            end
  
            SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
        end
	end
end)
-------- noclip --------------

RegisterNetEvent("esx_admin:noclip")
AddEventHandler("esx_admin:noclip", function(input)

	ENP_noclip = not ENP_noclip
    local ped = GetPlayerPed(-1)

    if ENP_noclip then
    	SetEntityInvincible(ped, true)
    	SetEntityVisible(ped, false, false)
    else
    	SetEntityInvincible(ped, false)
    	SetEntityVisible(ped, true, false)
    end

    if ENP_noclip == true then 
		TriggerEvent('esx:showNotification', '~o~NOCLIP ON')
    else
		TriggerEvent('esx:showNotification', '~o~NOCLIP OFF')

    end

end)  

getPosition = function()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  	return x,y,z
end
getCamDirection = function()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()
  
	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)
  
	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
	  x = x/len
	  y = y/len
	  z = z/len
	end
  
	return x,y,z
end


--------- no invisible  ------------------
local noinvisible = true
RegisterNetEvent("esx_admin:noinvisible")
AddEventHandler("esx_admin:noinvisible", function ()
	local ped = GetPlayerPed(-1)
				
	SetEntityVisible(GetPlayerPed(-1), true)   
end)   

--------- invisible  ------------------
local invisible = false
RegisterNetEvent("esx_admin:invisible")
AddEventHandler("esx_admin:invisible", function ()
	local ped = GetPlayerPed(-1)
				
	SetEntityVisible(GetPlayerPed(-1), false)
end) 

--------  invencible  --------------
local invencible = false
RegisterNetEvent('esx_admin:invencible')
AddEventHandler('esx_admin:invencible', function()
	local ped = GetPlayerPed(-1)

	SetPlayerInvincible(GetPlayerIndex(),true)
end) 

-------- no invencible  --------------
local noinvencible = true
RegisterNetEvent('esx_admin:noinvencible')
AddEventHandler('esx_admin:noinvencible', function()
	local ped = GetPlayerPed(-1)

	SetPlayerInvincible(GetPlayerIndex(),false) 
end) 

