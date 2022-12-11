ESX                           = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  end
end)

RegisterNetEvent('jmgarcia_anuncios:client:SendAlert')
AddEventHandler('jmgarcia_anuncios:client:SendAlert', function(data)
	SendAlert(data.type, data.text, data.length, data.style)
end)

function SendAlert(type, text, length, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = length,
		style = style
	})
end
