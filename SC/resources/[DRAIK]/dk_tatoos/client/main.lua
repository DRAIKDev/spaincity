ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



Citizen.CreateThread(function()
	while true do
		local sleep = 100
		
			local me = PlayerPedId()
			if GetDistanceBetweenCoords(GetEntityCoords(me), vector3(321.0264, 183.8001,  103.58)) <= 15.0 then
					DrawMarker(Config.Marker.Type, 321.0264, 183.8001,  103.58 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)
					sleep = 0
					if GetDistanceBetweenCoords(GetEntityCoords(me), vector3(321.0264, 183.8001,  103.58)) <= 2.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', "Tatooshop", 'precio'))

					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('dktatus:quitar1')
					end
				end
			end
			Wait(sleep)
		
	end
end)