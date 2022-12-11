local menuIsShowed, hasAlreadyEnteredMarker, isInMarker = false, false, false
ESX = nil

Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)

	end

end)

ShowJobListingMenu = function()

	ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(jobs)

		local elements = {}

		for i=1, #jobs, 1 do
			table.insert(elements, {
				label = jobs[i].label,
				job   = jobs[i].job
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'joblisting', {
			title    = _U('job_center'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			TriggerServerEvent('esx_joblisting:setJob', data.current.job)
			ESX.ShowNotification(_U('new_job'))
			menu.close()
		end, function(data, menu)
			menu.close()
		end)

	end)

end

AddEventHandler('esx_joblisting:hasExitedMarker', function(zone)

	ESX.UI.Menu.CloseAll()

end)

Create3DText = function(distance,v)
	if ESX ~= nil then
		if(distance < 1.5) then

			DrawText3D(v.x,v.y,v.z -0.5,_U('access_job_center'), 0, 0.1, 0.1,255)

		elseif distance < 10 then

			DrawText3D(v.x,v.y,v.z -0.5,_U('access_job_center'), 0, 0.1, 0.1,100)

		end
	end

end

Citizen.CreateThread(function()

    for _,v in pairs(Config.Peds) do
    
		RequestModel(GetHashKey(v[7]))
		
		while not HasModelLoaded(GetHashKey(v[7])) do
			Wait(1)
		end

		RequestAnimDict("mini@strip_club@idles@bouncer@base")
		
		while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
			Wait(1)
		end

		ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
		
		SetEntityHeading(ped, v[5])
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    
		if  v[8] then
			while true do
				s = 1000
				local dist = #(GetEntityCoords(PlayerPedId()) - v[9])
				if dist <= 5 then
					s = 0
					ESX.ShowFloatingHelpNotification(v[8],v[9])
				end
				Citizen.Wait(s)
			end
		end

	end

end)


Citizen.CreateThread(function()

	while true do
		
		s = 1000
		isInMarker = false
		local coords = GetEntityCoords(PlayerPedId())

		for i=1, #Config.Zones, 1 do

			local distance = GetDistanceBetweenCoords(coords, Config.Zones[i], true)


			if distance < 20 then
				s = 1
				Create3DText(distance,Config.Zones[i])
			end

			if distance < 10 then
				isInMarker = true
			end

		end

		if isInMarker and not hasAlreadyEnteredMarker then

			hasAlreadyEnteredMarker = true

		end

		if not isInMarker and hasAlreadyEnteredMarker then

			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_joblisting:hasExitedMarker')

		end

		Citizen.Wait(s)

	end

end)

Citizen.CreateThread(function()

	for i=1, #Config.Zones, 1 do

		local blip = AddBlipForCoord(Config.Zones[i])
		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 1)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(_U('job_center'))
		EndTextCommandSetBlipName(blip)

	end

end)
DrawText3D = function(x,y,z,textInput,fontId,scaleX,scaleY,opacity)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*8
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(250, 250, 250, opacity)
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
  end
Citizen.CreateThread(function()

	while true do
		
		_msc = 1000
		
		if isInMarker then

			_msc = 1
			
			if IsControlJustReleased(0, 38) then
				ESX.UI.Menu.CloseAll()
				ShowJobListingMenu()
			end

		else

			_msc = 500

		end

		Citizen.Wait(_msc)

	end

end)