
Citizen.CreateThread(function ()
	while true do
		ExecuteCommand("heartbeat")
		Citizen.Wait(5000)
	end
end)