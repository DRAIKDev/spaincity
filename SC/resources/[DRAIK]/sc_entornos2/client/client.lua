
---------------------------------
blipTime = 180 
blipRadius = 30.0 
botonable = false

TriggerEvent("chat:addSuggestion", "/entorno", "Avisa a las autoridades.", {
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

RegisterCommand('entorno', function(source, args)
local name = GetPlayerName(PlayerId())
local ped = GetPlayerPed(PlayerId())
local x, y, z = table.unpack(GetEntityCoords(ped, true))
local street = GetStreetNameAtCoord(x, y, z)
local location = GetStreetNameFromHashKey(street)
local msg = table.concat(args, ' ')

    if args[1] == nil then
        TriggerEvent('chatMessage', '[^2LLAMADA^0]', {255,255,255}, '^1^*EL ENTORNO NO PUEDE ESTAR EN BLANCO.^0')
    end
    if args[1] ~= nil then
      if not(string.find(args[1], "<style>")) then 

        TriggerServerEvent('llamarcnp', location, msg, x, y, z, name)
        ExecuteCommand("JHSDJAHDJAKDHJSDHUHNJHNLSHJDA ^2^*Un entorno ha sido enviado en tu zona: ^0"..msg..".")
        TriggerEvent("HSJDAJDHDVGSAJ",  msg)
      else
        TriggerServerEvent("GSDTGFVABHYDTGFABDU7TGH","STYLE")
      end

    end
end)
RegisterNetEvent('HSJDAJDHDVGSAJ')
AddEventHandler('HSJDAJDHDVGSAJ', function(msg)
local args = msg
local ped = GetPlayerPed(PlayerId())
local x, y, z = table.unpack(GetEntityCoords(ped, true))
local street = GetStreetNameAtCoord(x, y, z)
local location = GetStreetNameFromHashKey(street)
local pos = GetEntityCoords(GetPlayerPed(-1))
local dist = CalculateTravelDistanceBetweenPoints(x,y,z,pos.x,pos.y,pos.z) / 1000
TriggerServerEvent("PUTOSENTORNOS", source, args, location, args,x,y)

TriggerServerEvent('trew_hud_ui:adminNotifyAllPlayers', {"ENTORNO", ""..msg.."", "red"})


end)

RegisterNetEvent('AJHD')
AddEventHandler('AJHD', function(id, name, location, args,x,y)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
	local xPlayer = ESX.GetPlayerData()
	if xPlayer.job.name == 'cnp' or  xPlayer.job.name == 'military' then
        botonable = true
		SendNUIMessage({ action = 'sendNotification', title = "ENTORNO", message = "Llamada  en  "..location.." </br>  Contenido: "..args.."</br> <b style='color:#3efe00'>[H Recibido] </b>", type = "red" })

end


end)

RegisterNetEvent('TERECIBOYTEMARCO')
AddEventHandler('TERECIBOYTEMARCO', function(x,y)
  SetNewWaypoint(x, y)
end)

RegisterNetEvent('setBlip')
AddEventHandler('setBlip', function(name, x, y, z)
blip = nil
blips = {}
Citizen.CreateThread(function()
  botonable = true 
  while botonable do
    if IsControlJustReleased(1, 304) then
      TriggerServerEvent("TEMARCOENEELMAPA")
      SendNUIMessage({ action = 'sendNotification', title = "ENTORNO", message = "Has aceptado la llamada", type = "red" })
      botonable = false

    end
    Citizen.Wait(0)
  end 
end)
local blip = AddBlipForRadius(x, y, z, blipRadius)
	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 2)
	SetBlipAlpha (blip, 128)
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


----------------------------ENTORNOS-----------------------------



RegisterCommand("forzar", function(source, args)
  local playername = GetPlayerName(PlayerId())
  local ped = GetPlayerPed(PlayerId())
  local x, y, z = table.unpack(GetEntityCoords(ped, true))
  local street = GetStreetNameAtCoord(x, y, z)
  local location = GetStreetNameFromHashKey(street)
  local estaDentro = IsPedInAnyVehicle(ped, false)
  local model = GetEntityModel(veh)
  local vehicleModel = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
  local vehiculo = GetVehiclePedIsIn(ped)
  local primary = GetVehicleColours(vehiculo)
  primary = Config.colorNames[tostring(primary)]
  local modelo = GetDisplayNameFromVehicleModel(vehicleModel)
  local matricula = GetVehicleNumberPlateText(vehiculo)

  if estaDentro then
    ExecuteCommand("entorno Hola buenas soy la vieja de siempre, veo a una persona robar un "..modelo.." de color "..primary.." y con matricula "..matricula..", AYUDA!")
  else
    ESX.ShowNotification("~y~No estas en ning??n vehiculo~y~") 
  end
end)






Config.colorNames = {
  ['0'] = "Negro met??lico",
  ['1'] = "Negro grafito met??lico",
  ['2'] = "Robo negro met??lico",
  ['3'] = "Plata oscura metalizada",
  ['4'] = "Plata met??lica",
  ['5'] = "Azul met??lico plateado",
  ['6'] = "Gris met??lico de acero",
  ['7'] = "Plata met??lica sombra",
  ['8'] = "Plata de piedra met??lica",
  ['9'] = "Plata met??lica de medianoche",
  ['10'] = "Pistola met??lica de metal",
  ['11'] = "Gris antracita met??lico",
  ['12'] = "Negro mate",
  ['13'] = "Gris mate",
  ['14'] = "Gris claro mate",
  ['15'] = "Util Black",
  ['16'] = "Util Black Poly",
  ['17'] = "Util plata oscura",
  ['18'] = "Util Silver",
  ['19'] = "Util Gun Metal",
  ['20'] = "Util Shadow Silver",
  ['21'] = "Negro desgastado",
  ['22'] = "Grafito desgastado",
  ['23'] = "Gris plateado gastado",
  ['24'] = "Plata gastada",
  ['25'] = "Plata azul gastada",
  ['26'] = "Plata de sombra gastada",
  ['27'] = "Rojo met??lico",
  ['28'] = "Rojo Torino Met??lico",
  ['29'] = "F??rmula met??lica roja",
  ['30'] = "Rojo met??lico resplandor",
  ['31'] = "Rojo met??lico elegante",
  ['32'] = "Rojo granate met??lico",
  ['33'] = "Rojo met??lico del desierto",
  ['34'] = "Rojo Cabernet met??lico",
  ['35'] = "Rojo caramelo met??lico",
  ['36'] = "Naranja met??lico del amanecer",
  ['37'] = "Oro cl??sico met??lico",
  ['38'] = "Naranja Met??lico",
  ['39'] = "Rojo mate",
  ['40'] = "Rojo oscuro mate",
  ['41'] = "Naranja mate",
  ['42'] = "Amarillo mate",
  ['43'] = "Util Red",
  ['44'] = "Util rojo brillante",
  ['45'] = "Util Garnet Red",
  ['46'] = "Rojo desgastado",
  ['47'] = "Rojo dorado desgastado",
  ['48'] = "Rojo oscuro desgastado",
  ['49'] = "Verde oscuro metalizado",
  ['50'] = "Metallic Racing Green",
  ['51'] = "Verde Mar Met??lico",
  ['52'] = "Verde oliva met??lico",
  ['53'] = "Verde met??lico",
  ['54'] = "Gasolina Met??lica Azul Verde",
  ['55'] = "Verde lima mate",
  ['56'] = "Util verde oscuro",
  ['57'] = "Util Green",
  ['58'] = "Verde oscuro desgastado",
  ['59'] = "Verde desgastado",
  ['60'] = "Lavado de mar gastado",
  ['61'] = "Azul met??lico de medianoche",
  ['62'] = "Azul met??lico oscuro",
  ['63'] = "Azul met??lico de Sajonia",
  ['64'] = "Azul met??lico",
  ['65'] = "Azul marino met??lico",
  ['66'] = "Azul met??lico del puerto",
  ['67'] = "Azul Diamante Met??lico",
  ['68'] = "Azul met??lico de surf",
  ['69'] = "Azul n??utico met??lico",
  ['70'] = "Azul met??lico brillante",
  ['71'] = "Azul metalizado morado",
  ['72'] = "Azul met??lico de spinnaker",
  ['73'] = "Metallic Ultra Blue",
  ['74'] = "Azul met??lico brillante",
  ['75'] = "Util Azul Oscuro",
  ['76'] = "Util Midnight Blue",
  ['77'] = "Util Blue",
  ['78'] = "Util Sea Foam Blue",
  ['79'] = "Uil Lightning blue",
  ['80'] = "Util Maui Blue Poly",
  ['81'] = "Util Bright Blue",
  ['82'] = "Azul oscuro mate",
  ['83'] = "Azul mate",
  ['84'] = "Azul medianoche mate",
  ['85'] = "Azul oscuro desgastado",
  ['86'] = "Azul desgastado",
  ['87'] = "Azul claro desgastado",
  ['88'] = "Taxi met??lico amarillo",
  ['89'] = "Raza met??lica amarilla",
  ['90'] = "Bronce met??lico",
  ['91'] = "Amarillo Met??lico",
  ['92'] = "Cal met??lica",
  ['93'] = "Champ??n met??lico",
  ['94'] = "Pueblo Beige met??lico",
  ['95'] = "Marfil oscuro met??lico",
  ['96'] = "Marr??n Choco Met??lico",
  ['97'] = "Marr??n dorado met??lico",
  ['98'] = "Marr??n claro met??lico",
  ['99'] = "Beige pajizo met??lico",
  ['100'] = "Marr??n musgo met??lico",
  ['101'] = "Marr??n de pist??n met??lico",
  ['102'] = "Madera de haya met??lica",
  ['103'] = "Madera de haya oscura met??lica",
  ['104'] = "Naranja Choco Met??lico",
  ['105'] = "Arena met??lica de playa",
  ['106'] = "Arena Met??lica Bleeched Sun",
  ['107'] = "Crema met??lica",
  ['108'] = "Util Brown",
  ['109'] = "Util Medium Brown",
  ['110'] = "Util marr??n claro",
  ['111'] = "Blanco met??lico",
  ['112'] = "Blanco Frost Met??lico",
  ['113'] = "Miel Beige desgastado",
  ['114'] = "Marr??n gastado",
  ['115'] = "Marr??n oscuro desgastado",
  ['116'] = "Color beige paja gastado",
  ['117'] = "Acero cepillado",
  ['118'] = "Acero negro cepillado",
  ['119'] = "Aluminio cepillado",
  ['120'] = "Chrome",
  ['121'] = "Desgastado Blanco",
  ['122'] = "Util Off White",
  ['123'] = "Naranja gastada",
  ['124'] = "Naranja claro gastado",
  ['125'] = "Verde met??lico Securicor",
  ['126'] = "Taxi amarillo desgastado",
  ['127'] = "coche de polic??a azul",
  ['128'] = "Verde mate",
  ['129'] = "Marr??n mate",
  ['130'] = "Naranja gastada",
  ['131'] = "Blanco mate",
  ['132'] = "Blanco desgastado",
  ['133'] = "Ej??rcito verde oliva desgastado",
  ['134'] = "Blanco puro",
  ['135'] = "Rosa fuerte",
  ['136'] = "Rosa salm??n",
  ['137'] = "Rosa metalizado bermell??n",
  ['138'] = "Naranja",
  ['139'] = "Verde",
  ['140'] = "Azul",
  ['141'] = "Mettalic Black Blue",
  ['142'] = "Negro metalizado morado",
  ['143'] = "Negro metalizado rojo",
  ['144'] = "verde cazador",
  ['145'] = "P??rpura met??lico",
  ['146'] = "Metaillic V Dark Blue",
  ['147'] = "MODSHOP BLACK1",
  ['148'] = "P??rpura mate",
  ['149'] = "P??rpura oscuro mate",
  ['150'] = "Rojo met??lico lava",
  ['151'] = "Verde bosque mate",
  ['152'] = "Malva Oliva mate",
  ['153'] = "Marr??n Desierto Mate",
  ['154'] = "Bronceado mate del desierto",
  ['155'] = "Verde mate de foilaje",
  ['156'] = "COLOR DE ALEACI??N PREDETERMINADO",
  ['157'] = "Epsilon Blue",
}

