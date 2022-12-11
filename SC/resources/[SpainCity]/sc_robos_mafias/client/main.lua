local holdingUp = false
local robo = ""
local bliproboxd = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_robos_mafias:currentlyRobbing')
AddEventHandler('esx_robos_mafias:currentlyRobbing', function(currentrobo)
	holdingUp, robo = true, currentrobo
end)

RegisterNetEvent('esx_robos_mafias:killBlip')
AddEventHandler('esx_robos_mafias:killBlip', function()
	RemoveBlip(bliproboxd)
end)

RegisterNetEvent('esx_robos_mafias:setBlip')
AddEventHandler('esx_robos_mafias:setBlip', function(position)
	bliproboxd = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(bliproboxd, 161)
	SetBlipScale(bliproboxd, 2.0)
	SetBlipColour(bliproboxd, 3)

	PulseBlip(bliproboxd)
end)

RegisterNetEvent('esx_robos_mafias:tooFar')
AddEventHandler('esx_robos_mafias:tooFar', function()
	holdingUp, robo = false, ''
	ESX.ShowNotification(_U('roboxd_cancelled'))
end)

RegisterNetEvent('esx_robos_mafias:roboxdComplete')
AddEventHandler('esx_robos_mafias:roboxdComplete', function(award)
	holdingUp, robo = false, ''
	ESX.ShowNotification(_U('roboxd_complete', award))
end)

RegisterNetEvent('esx_robos_mafias:startTimer')
AddEventHandler('esx_robos_mafias:startTimer', function()
	local timer = robos[robo].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('roboxd_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	for k,v in pairs(robos) do
		local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
		SetBlipSprite(blip, 150)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('robo_roboxd'))
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		s = 1000
		local playerPos = GetEntityCoords(PlayerPedId(), true)

		for k,v in pairs(robos) do
			local roboPos = v.position
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, roboPos.x, roboPos.y, roboPos.z)

			if distance < Config.Marker.DrawDistance then
				s = 0
				if not holdingUp then
					DrawMarker(Config.Marker.Type, roboPos.x, roboPos.y, roboPos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfrobo))

						if IsControlJustReleased(0, 38) then
							if IsPedArmed(PlayerPedId(), 4) then
								TriggerServerEvent('esx_robos_mafias:roboxdStarted', k)
							else
								ESX.ShowNotification(_U('no_threat'))
							end
						end
					end
				end
			end
		end

		if holdingUp then
			local roboPos = robos[robo].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, roboPos.x, roboPos.y, roboPos.z) > Config.MaxDistance then
				s = 0
				TriggerServerEvent('esx_robos_mafias:tooFar', robo)
			end
		end
		Citizen.Wait(s)
	end
end)
