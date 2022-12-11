

local radar =
{
	shown = false,
	freeze = false,
	info = "~y~Inicializando RADAR...~w~321...~y~Cargado! ",
	info2 = "~y~Inicializando RADAR...~w~321...~y~Cargado! ",
	minSpeed = 5.0,
	maxSpeed = 75.0,
}
--local distanceToCheckFront = 50

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

Citizen.CreateThread( function()
	
	while true do
		Wait(0)
		if IsControlJustPressed(1, 56) and IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) then
			
			if radar.shown then 
				radar.shown = false 
				radar.info = string.format("~y~Iniciando Radar...~w~321...~y~Listo! ")
				radar.info2 = string.format("~y~Iniciando Radar...~w~321...~y~Listo! ")
			else 
				radar.shown = true 
			end		
                Wait(75) 
			
		end
		if IsControlJustPressed(1, 56) and IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) then
		
			if radar.freeze then radar.freeze = false else radar.freeze = true end
	
		end
		if radar.shown  then
			if radar.freeze == false then
					local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
					local coordA = GetOffsetFromEntityInWorldCoords(veh, 0.0, 1.0, 1.0)
					local coordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, 105.0, 0.0)
					local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, veh, 7)
					local a, b, c, d, e = GetShapeTestResult(frontcar)
					
					if IsEntityAVehicle(e) then
						
						local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
						local fvspeed = GetEntitySpeed(e)*2.236936
						local fplate = GetVehicleNumberPlateText(e)
						radar.info = string.format("~y~Matricula: ~w~%s  ~y~Modelo: ~w~%s  ~y~Velocidad: ~w~%s km/h", fplate, fmodel, math.ceil(fvspeed))
					end
					
					local bcoordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, -105.0, 0.0)
					local rearcar = StartShapeTestCapsule(coordA, bcoordB, 3.0, 10, veh, 7)
					local f, g, h, i, j = GetShapeTestResult(rearcar)
					
					if IsEntityAVehicle(j) then
					
						local bmodel = GetDisplayNameFromVehicleModel(GetEntityModel(j))
						local bvspeed = GetEntitySpeed(j)*2.236936
						local bplate = GetVehicleNumberPlateText(j)
						radar.info2 = string.format("~y~Matricula: ~w~%s  ~y~Modelo: ~w~%s  ~y~Velocidad: ~w~%s km/h", bplate, bmodel, math.ceil(bvspeed))
					
					
					end
					
			end
			
			DrawRect(0.708, 0.94, 0.216, 0.116, 0, 0, 0, 150)
			DrawAdvancedText(0.791, 0.903, 0.005, 0.0028, 0.4, "Radar Frontal", 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.791, 0.953, 0.005, 0.0028, 0.4, "Radar Trasero", 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.8, 0.928, 0.005, 0.0028, 0.4, radar.info, 255, 255, 255, 255, 6, 0)
			DrawAdvancedText(0.8, 0.979, 0.005, 0.0028, 0.4, radar.info2, 255, 255, 255, 255, 6, 0)

			
		end
		
		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			radar.shown = false
			radar.info = string.format("~y~Iniciando Radar...~w~321...~y~Listo! ")
			radar.info2 = string.format("~y~Iniciando Radar...~w~321...~y~Listo! ")
		end
					
	end
	
	
end)
