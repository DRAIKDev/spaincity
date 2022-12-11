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

local PlayerData              = {}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
	CreateBlip()	
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
    CreateBlip()	
	Citizen.Wait(5000)
end)

--------------------------------------

local currentJob = {}
local restockObject = {}
local restockObjectLocation = {}
local onJob = false 
local goPostalVehicle = nil
local currentJobPay = 0
local PackageObject = nil
local currentPackages = 0
local locations = {
	["Grapeseed"] = {
		['Max'] = 5,
		[1] = {838.64, -1925.01, 29.31},
		[2] = {475.36, -1904.88, 24.28},
		[3] = {379.8, -1814.08, 28.08},
		[4] = {411.56, -1487.56, 29.16},
		[5] = {-76.28, -1320.36, 28.2},
	},

	["Sandy Shores"] = {
		['Max'] = 5,
		[1] = {-1040.28, -1474.96, 4.56}, 
		[2] = {-1253.28, -670.72, 25.0},
		[3] = {-1354.28, -139.96, 48.56},
		[4] = {-960.68, -254.96, 37.4},
		[5] = {-420.0, -350.56, 32.24},
	},

	["Paleto Bay"] = {
		['Max'] = 4,
		[1] = {1162.6, -1477.68, 33.84}, 
		[2] = {541.96, -1578.68, 28.28},
		[3] = {1322.64, -1647.68, 51.16},
		[4] = {-154.56, -306.36, 37.64},
	}
}

local restockLocations = {
 [1] = {828.029, -1402.441, 26.158},
 [2] = {831.029, -1401.441, 26.158},
 [3] = {835.989, -1401.441, 26.158},
 [4] = {828.989, -1399.441, 26.308},
 [5] = {833.989, -1398.441, 26.308},
 [6] = {833.989, -1402.441, 26.158},
 [7] = {827.989, -1398.441, 26.308},
 [8] = {831.259, -1398.441, 26.308}
}

local vehicleSpawnLocations = {
 {x = 844.9278, y = -1334.58607, z = 25.647895, h = 248.14728},
 {x = 845.4285, y = -1340.96875, z = 25.606778, h = 247.99277},
 {x = 844.4671, y = -1346.56914, z = 25.614813, h = 243.00203},
 {x = 844.4671, y = -1352.34914, z = 25.614813, h = 240.00203}
}



function CreateBlip()
    if PlayerData.job ~= nil and PlayerData.job.name == 'gopostal' then

		if BlipCloakRoom == nil then
			BlipCloakRoom = AddBlipForCoord(858.7078, -1354.06607, 26.077895)
			SetBlipSprite(BlipCloakRoom, 541)
			SetBlipColour(BlipCloakRoom, 46)
			SetBlipAsShortRange(BlipCloakRoom, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Correos')
			EndTextCommandSetBlipName(BlipCloakRoom)
	  end	
	else

        if BlipCloakRoom ~= nil then
            RemoveBlip(BlipCloakRoom)
            BlipCloakRoom = nil
        end
	end
 end


Citizen.CreateThread(function()
 while true do
  Citizen.Wait(5)
  if PlayerData.job ~= nil and PlayerData.job.name == 'gopostal' then
   if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 860.692, -1337.519, 26.032, true) < 15) then
	DrawMarker(23, 860.692, -1337.519, 26.032-0.9, 0, 0, 0, 0.0, 0, 0, 3.0, 3.0, 0.5001, 255, 255, 255, 255, 0, 0, 0, 0)
   	if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 860.692, -1337.519, 26.032, true) < 1.5) then
   	 if DoesEntityExist(goPostalVehicle) then DrawText3d(860.692, -1337.519, 26.032+1.2, "~w~rPresiona ~r~[E]~w~ para terminar trabajo", 200) else DrawText3d(860.692, -1337.519, 26.032+1.2, "~w~Presiona ~r~[E]~w~ para empezar a trabajar.", 200) end	
   	 if IsControlJustPressed(0, 38) then 
   	  if DoesEntityExist(goPostalVehicle) then 
   	   onJob = false
	   DeleteVehicle(goPostalVehicle)
	   RemoveJobBlip()
   	  else
   	   local freespot, v = getParkingPosition(vehicleSpawnLocations)
		if freespot then SpawnGoPostal(v.x, v.y, v.z, v.h) end
		TriggerEvent("pNotify:SendNotification", {text= "<font color='yellow'>Da la vuelta a la parte trasera del almacén para llenar tu furgoneta", layout = "center"})  
      end
     end
	end
   end
   if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 844.102, -1406.229, 26.122, true) < 40) and IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("boxville2")) and DoesEntityExist(goPostalVehicle) then
   	DrawMarker(23, 844.102, -1406.229, 26.122-0.95, 0, 0, 0, 0.0, 0, 0, 3.0, 3.0, 0.5001, 255, 255, 255, 255, 0, 0, 0, 0)
	if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 844.102, -1406.229, 26.122, true) < 4) then
	 if not onJob then 
	  DrawText3d(844.102, -1406.229, 26.122+1.2, "~w~Presiona ~r~[E]~w~ para cargar la camioneta", 200)
	  
	  
	  
	  
	  if IsControlJustPressed(0, 38) then
	   restockVan()
	  end
     end
    end
   end
   if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), currentJob[1], currentJob[2], currentJob[3], true) < 20) and onJob then
   	DrawMarker(1, currentJob[1], currentJob[2], currentJob[3], 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 112, 100,210, true, true, 0,0)
	if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), currentJob[1], currentJob[2], currentJob[3], true) < 1.5) then
	 drawTxt('~w~Presiona ~r~[E]~w~ para entregar el paquete')
	 if IsControlJustPressed(0, 38) then
	  DeleteObject(PackageObject)
	  ClearPedTasks(GetPlayerPed(-1))
	  PackageObject = nil 
	  TriggerServerEvent('gopostal:cash', currentJobPay,securityToken)
	  
	  newShift()
	 end
    end
   end
   if onJob and not IsPedInAnyVehicle(GetPlayerPed(-1)) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), currentJob[1], currentJob[2], currentJob[3], true) < 20 then 
    local bootPos = GetEntityCoords(goPostalVehicle)
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), bootPos.x, bootPos.y, bootPos.z, true) < 2.5 and PackageObject == nil then 
     drawTxt('~w~Presiona ~r~[E]~w~ para tomar el paquete')
	 
     if IsControlJustPressed(0, 38) then
	  LoadModel("prop_cs_cardbox_01")
	  local pos = GetEntityCoords(GetPlayerPed(-1), false)
	  PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos.x, pos.y, pos.z, true, true, true)
      AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
      LoadAnim("anim@heists@box_carry@")
      TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
     end
    end 
   end
  end
 end
end)


function restockVan()
 local restockPackages = 8
 local restockVan = true
 local carryingPackage = {status = false, id = nil}
 for id,v in pairs(restockLocations) do 
  restockObject[id] = CreateObject(GetHashKey("prop_cs_cardbox_01"), v[1],v[2],v[3]-0.95, true, true, true)
  restockObjectLocation[id] = v 
  PlaceObjectOnGroundProperly(restockObject[id])
 end
 while restockVan do 
  Wait(1)
  for id,v in pairs(restockObjectLocation) do 
   DrawMarker(2, v[1],v[2],v[3], 0,0,0,0,0,0,0.5,0.5,0.5,255,255,0,165,0,0,0,0)
   if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v[1],v[2],v[3], true) < 1.0 then
    drawTxt('~w~Presiona ~r~[E]~w~ para tomar el paquete')
    if IsControlJustPressed(0, 38) then 
     AttachEntityToEntity(restockObject[id], PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
     LoadAnim("anim@heists@box_carry@")
     TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
     carryingPackage.status = true
     carryingPackage.id = id
    end
   end
  end
  if carryingPackage.status then 
   local bootPos = GetEntityCoords(goPostalVehicle)
   if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), bootPos.x, bootPos.y, bootPos.z, true) < 2.6 then 
    drawTxt('~w~Presiona ~r~[E]~w~ para poner en la camioneta')
    if IsControlJustPressed(0, 38) then 
     DeleteObject(restockObject[carryingPackage.id])
     ClearPedTasks(GetPlayerPed(-1))
     carryingPackage.status = false
     restockObjectLocation[carryingPackage.id] = {}
     restockObject[carryingPackage.id] = nil
     restockPackages = restockPackages-1
     if restockPackages == 0 then 
      restockVan = false
      newShift()
      onJob = true
      exports.pNotify:SendNotification({text = "Camioneta cargada, empeza a repartir los paquetes", layout = "center"})
     end
    end
   end
  end
 end
end

function newShift()
 local id = math.random(1,3)
 if id == 1 then 
  local jobLocation = locations['Grapeseed'][math.random(1, locations['Grapeseed']['Max'])] 
  SetJobBlip(jobLocation[1],jobLocation[2],jobLocation[3])
  currentJob = jobLocation
 elseif id == 2 then 
  local jobLocation = locations['Sandy Shores'][math.random(1, locations['Sandy Shores']['Max'])]
  SetJobBlip(jobLocation[1],jobLocation[2],jobLocation[3])
  currentJob = jobLocation
 elseif id == 3 then 
  local jobLocation = locations['Paleto Bay'][math.random(1, locations['Paleto Bay']['Max'])]
  SetJobBlip(jobLocation[1],jobLocation[2],jobLocation[3])
  currentJob = jobLocation
 end
 currentJobPay = CalculateTravelDistanceBetweenPoints(GetEntityCoords(GetPlayerPed(-1)), currentJob[1],currentJob[2],currentJob[3])/2/4
 if currentJobPay > 60 then 
  currentJobPay = math.random(400, 430)
 end
end

function SpawnGoPostal(x,y,z,h)
 local vehicleHash = GetHashKey('boxville2')
 RequestModel(vehicleHash)
 while not HasModelLoaded(vehicleHash) do
  Citizen.Wait(0)
 end

 goPostalVehicle = CreateVehicle(vehicleHash, x, y, z, h, true, false)
 local id = NetworkGetNetworkIdFromEntity(goPostalVehicle)
 SetNetworkIdCanMigrate(id, true)
 SetNetworkIdExistsOnAllMachines(id, true)
 SetVehicleDirtLevel(goPostalVehicle, 0)
 SetVehicleHasBeenOwnedByPlayer(goPostalVehicle, true)
 SetEntityAsMissionEntity(goPostalVehicle, true, true)
 SetVehicleEngineOn(goPostalVehicle, true)
end