local canHandsUp = true

AddEventHandler('handsup:toggle', function(param)
	canHandsUp = param
end)

Citizen.CreateThread(function()
	local handsup = false

	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		RequestAnimDict('random@mugging3')

		if canHandsUp then
			if IsControlJustReleased(0, 73) then
				if handsup then
					if DoesEntityExist(playerPed) then
						Citizen.CreateThread(function()
							RequestAnimDict('random@mugging3')
							while not HasAnimDictLoaded('random@mugging3') do
								Citizen.Wait(100)
							end

							if handsup then
								handsup = false
								ClearPedSecondaryTask(playerPed)
								TriggerServerEvent('esx_thief:update', handsup)
							end
						end)
					end
				else
					if DoesEntityExist(playerPed) then
						Citizen.CreateThread(function()
							RequestAnimDict('random@mugging3')
							while not HasAnimDictLoaded('random@mugging3') do
								Citizen.Wait(100)
							end

							if not handsup then
								handsup = true
								TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
								TriggerServerEvent('esx_thief:update', handsup)
							end
						end)
					end
				end
			end

		end
	end
end)
