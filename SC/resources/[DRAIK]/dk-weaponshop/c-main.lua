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
		for k, v in pairs(Config.Zones.Locations) do
			local me = PlayerPedId()
			if GetDistanceBetweenCoords(GetEntityCoords(me), v) <= Config.DrawDistance and not IsPedDeadOrDying(me, true) then
				DrawText3D(v-vector3(0.0, 0.0, -0.5), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0),"~r~ARMAS~s~", 0, 0.1, 0.1,255)
				DrawMarker(Config.Type,v-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 90.0), vector3(1.0, 1.0, -3.0), 255, 0, 0, 150, false, false, 2, false, false, false)
				sleep = 0
				if GetDistanceBetweenCoords(GetEntityCoords(me),v) <= 1.8 and not IsPedDeadOrDying(me, true) then
					if not IsPedInAnyVehicle(me, false) then
						HelpText(_U('shop_menu_prompt'))
						if IsControlJustReleased(0, 38) then
							if Config.Licenciadearmasactivada then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
									if hasWeaponLicense then
										OpenShopMenu()
									else
										OpenBuyLicenseMenu()
									end
								end, GetPlayerServerId(PlayerId()), 'weapon')
							else
								OpenShopMenu()
							end					
						end 
					end
				end
			end
		end
		Wait(sleep)
	end
end)