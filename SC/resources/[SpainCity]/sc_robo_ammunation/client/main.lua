local holdingUp = false
local Armory = ""
local blipRobbery = nil
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

RegisterNetEvent('esx_robo_ammunation:currentlyRobbing')
AddEventHandler('esx_robo_ammunation:currentlyRobbing', function(currentArmory)
	holdingUp, Armory = true, currentArmory
end)

RegisterNetEvent('esx_robo_ammunation:killBlip')
AddEventHandler('esx_robo_ammunation:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_robo_ammunation:setBlip')
AddEventHandler('esx_robo_ammunation:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_robo_ammunation:tooFar')
AddEventHandler('esx_robo_ammunation:tooFar', function()
	holdingUp, Armory = false, ''
	ESX.ShowNotification(_U('robbery_cancelled'))
end)

RegisterNetEvent('esx_robo_ammunation:robberyComplete')
AddEventHandler('esx_robo_ammunation:robberyComplete', function(award)
	holdingUp, Armory = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('esx_robo_ammunation:startTimer')
AddEventHandler('esx_robo_ammunation:startTimer', function()
	local timer = Armories[Armory].secondsRemaining

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
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	for k,v in pairs(Armories) do
		local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
		SetBlipSprite(blip, 156)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('armory_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerPos = GetEntityCoords(PlayerPedId(), true)
		s = 1000
		for k,v in pairs(Armories) do
			local ArmoryPos = v.position
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, ArmoryPos.x, ArmoryPos.y, ArmoryPos.z)

			if distance < Config.Marker.DrawDistance then
				s = 0
				if not holdingUp then
					DrawMarker(Config.Marker.Type, ArmoryPos.x, ArmoryPos.y, ArmoryPos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfArmory))

						if IsControlJustReleased(0, 38) then
							if IsPedArmed(PlayerPedId(), 4) then
								TriggerServerEvent('esx_robo_ammunation:robberyStarted', k)
							else
								ESX.ShowNotification(_U('no_threat'))
							end
						end
					end
				end
			end
		end

		if holdingUp then
			local ArmoryPos = Armories[Armory].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, ArmoryPos.x, ArmoryPos.y, ArmoryPos.z) > Config.MaxDistance then
				s = 0
				TriggerServerEvent('esx_robo_ammunation:tooFar', Armory)
			end
		end
		Citizen.Wait(s)
	end
end)
