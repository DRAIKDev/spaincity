ESX = nil
pelotasacada = false
Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

Config = {}
------- TECLAS 
Config.pelota = 37  --[[ TAB ]]
Config.patear1 = 91 --[[ CLICK DERECHO ]]
Config.patear2 = 38 --[[ E ]]
Config.empujar = 52 --[[ Q ]]
Config.barrer = 55 --[[ SPACIO ]]
Config.levantar = 49 --[[ F ]]

local futbol = false

RegisterCommand('futbol', function()
	futbol = not futbol
	if futbol then
		ESX.ShowNotification("Modo futbol: ~g~Activado~s~")
	else 
		ESX.ShowNotification("Modo futbol: ~r~desactivado~s~")
	end
end)

function loadAnim( dict )
    while ( not HasAnimDictLoaded(dict) ) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

-------------  CREA LA PELOTA 

function pelota()
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local forwardx = GetEntityForwardX(ped)
    local forwardy = GetEntityForwardY(ped)
    local prop = CreateObject(GetHashKey("p_ld_soc_ball_01"), coords.x + (forwardx * 1), coords.y + (forwardy * 1), coords.z - 0.88, (heading - 180), true, false, true)
    SetEntityLodDist(prop, 500)
    SetEntityDynamic(prop, true)
    SetEntityRecordsCollisions(prop, true)
    SetEntityHasGravity(prop, true)
    FreezeEntityPosition(prop, false)
    SetEntityVelocity(prop, 0, 0, 0)
    SetModelAsNoLongerNeeded(GetHashKey("p_ld_soc_ball_01"))
end


------------------ 


----------------PATADA CORTA

function patear() 
	if futbol then
--		print('1')
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)
		local heading = GetEntityHeading(ped)
		local forwardx = GetEntityForwardX(ped)
		local forwardy = GetEntityForwardY(ped)
		local prop = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.5, GetHashKey("p_ld_soc_ball_01"), false, false, false)
		if prop then
			NetworkRequestControlOfEntity(prop)
			while not NetworkHasControlOfEntity(prop) do
				Citizen.Wait(100)
				return
			end
			loadAnim("misstrevor3_beatup")
			TaskPlayAnim(ped, "misstrevor3_beatup", "guard_beatup_kickidle_guard1", 8.0, -8.0, -1, 0, false, false, false)
			Citizen.Wait(750)
			ClearPedTasksImmediately(ped)
			SetEntityVelocity(prop, forwardx * 10, forwardy * 10, 0)
		end
	end
end

-------------- 



----------------PATADA MEDIANA

function patear2()
	if futbol then
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)
		local heading = GetEntityHeading(ped)
		local forwardx = GetEntityForwardX(ped)
		local forwardy = GetEntityForwardY(ped)
		local prop = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.5, GetHashKey("p_ld_soc_ball_01"), false, false, false)
		if prop then
			NetworkRequestControlOfEntity(prop)
			while not NetworkHasControlOfEntity(prop) do
				Citizen.Wait(100)
				return
			end
			loadAnim("misstrevor3_beatup")
			TaskPlayAnim(ped, "misstrevor3_beatup", "guard_beatup_kickidle_guard1", 8.0, -8.0, -1, 0, false, false, false)
			Citizen.Wait(750)
			ClearPedTasksImmediately(ped)
			local podbicie = math.floor((math.random() * 5) + 1)*2
			SetEntityVelocity(prop, forwardx * 40, forwardy * 40, podbicie)
		end
	end
end



-------------- 



---------------- QUITAR PELOTA

function empujar() -- empujar
	if futbol then
--		print('4')
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)
		local heading = GetEntityHeading(ped)
		local forwardx = GetEntityForwardX(ped)
		local forwardy = GetEntityForwardY(ped)
		local prop = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.5, GetHashKey("p_ld_soc_ball_01"), false, false, false)
		if prop then
			NetworkRequestControlOfEntity(prop)
			while not NetworkHasControlOfEntity(prop) do
				Citizen.Wait(100)
				return
			end
			loadAnim("misstrevor3_beatup")
			TaskPlayAnim(ped, "misstrevor3_beatup", "guard_beatup_kickidle_guard1", 8.0, -8.0, 750, 0, false, false, false)
			ClearPedTasksImmediately(ped)
			local podbicie = math.floor((math.random() * 3) + 1)*2
			SetEntityVelocity(prop, forwardx * 15, forwardy * 15, podbicie)
		end
	end
end

--------------




---------------- BARRERSE PARA QUITAR LA PELOTA 
function barrer()
	if futbol then
--		print('5')
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)
		local heading = GetEntityHeading(ped)
		local forwardx = GetEntityForwardX(ped)
		local forwardy = GetEntityForwardY(ped)
		local prop = GetClosestObjectOfType(coords.x, coords.y, coords.z, 5.0, GetHashKey("p_ld_soc_ball_01"), false, false, false)
		if prop then
			NetworkRequestControlOfEntity(prop)
			while not NetworkHasControlOfEntity(prop) do
				Citizen.Wait(100)
				return
			end
			loadAnim("missheistfbi3b_ig6_v2")
			TaskPlayAnim(ped, "missheistfbi3b_ig6_v2", "rubble_slide_alt_franklin", 8.0, -8.0, 2000, 0, false, false, false)
			Citizen.Wait(1000)
			local podbicie = math.floor((math.random() * 2) + 1)
			SetEntityVelocity(prop, forwardx * 40, forwardy * 40, podbicie)
			Citizen.Wait(100)
			ClearPedTasksImmediately(ped)
		end
	end
end



--------------



function levantar()
	if futbol then
--		print('7')
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)
		local heading = GetEntityHeading(ped)
		local forwardx = GetEntityForwardX(ped)
		local forwardy = GetEntityForwardY(ped)
		local prop = GetClosestObjectOfType(coords.x, coords.y, coords.z, 5.0, GetHashKey("p_ld_soc_ball_01"), false, false, false)
		if prop then
			NetworkRequestControlOfEntity(prop)
			while not NetworkHasControlOfEntity(prop) do
				Citizen.Wait(100)
				return
			end
			loadAnim("move_jump")
			TaskPlayAnim(ped, "move_jump", "jump_launch_long_l", 8.0, -8.0, -1, 0, false, false, false)
			Citizen.Wait(500)
			SetEntityVelocity(prop, forwardx * 12, forwardy * 12, 4.5)
			Citizen.Wait(350)
			ClearPedTasksImmediately(ped)
		end
	end
end
RegisterNetEvent("terestarteoelcontadordepelotas")
AddEventHandler("terestarteoelcontadordepelotas", function()
	Citizen.Wait(120000)
	pelotasacada = false

end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
		if IsControlJustReleased(0, Config.pelota) and futbol then 
			if not pelotasacada then 
			pelota()
			pelotasacada = true
			TriggerEvent('terestarteoelcontadordepelotas')
			else
			ESX.ShowNotification("Hace poco has sacado una pelota.")

			end 
		end
        if IsControlJustReleased(0, Config.patear1) and futbol then 
			patear()
		end
        if IsControlJustReleased(0, Config.patear2) and futbol then 
			patear2()
		end
        if IsControlJustReleased(0, Config.barrer) and futbol then 
			empujar()
		end
		if IsControlJustReleased(0, Config.barrer) and futbol then 
			barrer()
		end
        if IsControlJustReleased(0, Config.levantar) and futbol then 
			levantar()
		end
    end
end)

