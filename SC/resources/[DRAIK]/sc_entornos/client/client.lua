
---------------------------------
blipTime = 180 
blipRadius = 30.0 
botonable = false

TriggerEvent("chat:addSuggestion", "/auxilio", "Avisa a las autoridades sanitarias.", {
    { name = "Alerta", help = "Obligatorio para rol!"}
})

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end
	local xPlayer = ESX.GetPlayerData()
end)

RegisterCommand('auxilio', function(source, args)
local name = GetPlayerName(PlayerId())
local ped = GetPlayerPed(PlayerId())
local x, y, z = table.unpack(GetEntityCoords(ped, true))
local street = GetStreetNameAtCoord(x, y, z)
local location = GetStreetNameFromHashKey(street)
local msg = table.concat(args, ' ')

    if args[1] == nil then
        TriggerEvent('chatMessage', '[^2LLAMADA^0]', {255,255,255}, '^1^*EL AUXILIO NO PUEDE ESTAR EN BLANCO.^0')
    end
    if args[1] ~= nil then
        TriggerServerEvent('llamarambulance', location, msg, x, y, z, name)
        ExecuteCommand("ooc ^2^*Un Auxilio ha sido enviado en tu zona: ^0"..msg..".")
        TriggerEvent("JAHSDKJHASDKJHASKDJ",  msg)


    end
end)
RegisterNetEvent('JAHSDKJHASDKJHASKDJ')
AddEventHandler('JAHSDKJHASDKJHASKDJ', function(msg)
local args = msg
local ped = GetPlayerPed(PlayerId())
local x, y, z = table.unpack(GetEntityCoords(ped, true))
local street = GetStreetNameAtCoord(x, y, z)
local location = GetStreetNameFromHashKey(street)
local pos = GetEntityCoords(GetPlayerPed(-1))
local dist = CalculateTravelDistanceBetweenPoints(x,y,z,pos.x,pos.y,pos.z) / 1000
TriggerServerEvent("PUTOSENTORNOS1", source, args, location, args,x,y)



end)
RegisterNetEvent('TERECIBOYTEMARCO1')
AddEventHandler('TERECIBOYTEMARCO1', function(x,y)
  SetNewWaypoint(x, y)
end)

RegisterNetEvent('JHSDKJAHDJKASHDJKSDNAJD')
AddEventHandler('JHSDKJAHDJKASHDJKSDNAJD', function(id, name, location, args)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
	local xPlayer = ESX.GetPlayerData()
	if xPlayer.job.name == 'ambulance'  then
        botonable = true
		SendNUIMessage({ action = 'sendNotification', title = "Auxilio", message = "Llamada  en  "..location.." </br>  Contenido: "..args.."</br> <b style='color:#3efe00'>[H Recibido] </b>", type = "red" })

end
end)

RegisterNetEvent('JSHDAJKHDJKAHSDJAHSD')
AddEventHandler('JSHDAJKHDJKAHSDJAHSD', function(name, x, y, z)
blip = nil
blips = {}

local blip = AddBlipForRadius(x, y, z, blipRadius)
	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 2)
	SetBlipAlpha (blip, 128)
    Citizen.CreateThread(function()
        botonable = true 
        
        while botonable do
          if IsControlJustReleased(1, 304) then
    
            SendNUIMessage({ action = 'sendNotification', title = "Auxilio", message = "Has aceptado la llamada", type = "red" })
            TriggerServerEvent("TEMARCOENEELMAPA1")

            botonable = false
          end
          Citizen.Wait(0)
        end 
      end)
local blip1 = AddBlipForCoord(x, y, z)
	SetBlipSprite (blip1, sprite)
	SetBlipDisplay(blip1, true)
	SetBlipScale  (blip1, 0.9)
	SetBlipColour (blip1, 2)
    SetBlipAsShortRange(blip1, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entorno - " .. name)
    EndTextCommandSetBlipName(blip1)
    table.insert(blips, blip1)
    Wait(blipTime * 1000)
    for i, blip1 in pairs(blips) do 
        RemoveBlip(blip)
        RemoveBlip(blip1)
    end
end)








