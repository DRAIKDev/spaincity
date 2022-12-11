ESX                           = nil
local CurrentAction           = nil
local HasAlreadyEnteredMarker = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

	local arma = 		{{label = "Cargador Pistola", name = "WEAPON_PISTOL", price = 195},
						{label = "Cargador Glock 17", name = "WEAPON_COMBATPISTOL", price = 240},
						{label = "Balas Escopeta recortada", name = "WEAPON_SAWNOFFSHOTGUN", price = 900},
						{label = "Balas Escopeta", name = "WEAPON_PUMPSHOTGUN", price = 900},
						{label = "Cargador M4", name = "WEAPON_CARBINERIFLE", price = 1000},
						{label = "Cargador Rifle Compacto", name = "WEAPON_COMPACTRIFLE", price = 960},
						{label = "Cargador metralleta", name = "WEAPON_MICROSMG", price = 750},
						{label = "Cargador minimetralleta", name = "WEAPON_MINISMG", price = 750},
						{label = "Cargador francotirador", name = "WEAPON_SNIPERRIFLE", price = 4500},
						{label = "Cargador francotirador pesado", name = "WEAPON_HEAVYSNIPER", price = 6000},
						{label = "Cargador Desert Eagle", name = "WEAPON_PISTOL50", price = 750},
						{label = "Cargador MP5", name = "WEAPON_SMG", price = 240},
						{label = "Cargador AK-47", name = "WEAPON_ASSAULTRIFLE", price = 1200},
						{label = "Cargador AUG", name = "WEAPON_ADVANCEDRIFLE", price = 900},
						{label = "Cargador Pistola Vintage", name = "WEAPON_VINTAGEPISTOL", price = 225},
						{label = "Cargador Gusenberg", name = "WEAPON_GUSENBERG", price = 750},
						{label = "Cargador AKS-74U", name = "WEAPON_COMPACTRIFLE", price = 450},
						{label = "Cargador Revolver", name = "WEAPON_DOUBLEACTION", price = 1500},
						{label = "Cargador Tec-9", name = "WEAPON_MACHINEPISTOL", price = 225}
					}
	local pos = {
    			{x = 20.04, y = -1106.32, z = 28.8}, -- los santos 1
    			{x = 844.26, y = -1033.42, z = 27.19}, -- los santos 2
    			{x = 812.45, y = -2157.16, z = 28.62}, -- los santos 3
    			{x = 252.53, y = -47.53, z = 68.94}, -- los santos 4
    			{x = -664.56, y = -935.63, z = 20.83}, -- los santos 5
				{x = -1305.73, y = -392.3, z = 35.7}, -- los santos 6
				{x = 1691.893, y = 3758.085, z = 32.820}, -- Sandy Shores
				{x = -331.924, y = 6082.249, z = 29.60}, -- Paleto
				{x = 2569.795, y = 294.5083, z = 106.90}, -- Zona Este 
				{x = -1119.00, y = 2697.138, z = 16.70}, -- Zona Este 
				-- {x = 461.72, y =-983.125, z = 29.68}, -- policia
    		}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



function OpenShopMenu(zone)

	local elements = {}

	for i=1,#arma, 1 do

		table.insert(elements, {
			label     = arma[i].label .. ' - <span style="color:green;">$' .. arma[i].price .. ' </span>',
			realLabel = arma[i].label,
			value     = arma[i].label,
			price     = arma[i].price
		})
	end


	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cargadores',
		{
			title  = 'Cargadores',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)				
			TriggerServerEvent('carg:buyItem', data.current.value, data.current.price, zone, data.current.label)
		end,
		function(data, menu)
			
			menu.close()
			
			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('shop_menu')
			CurrentActionData = {zone = zone}
		end
	)
end
RegisterNetEvent('carg:hasEnteredMarker')
AddEventHandler('carg:hasEnteredMarker', function(zone)
	
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('shop_menu')
	CurrentActionData = {zone = zone}

end)
RegisterNetEvent('carg:hasExitedMarker')
AddEventHandler('carg:hasExitedMarker', function(zone)

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

end)

RegisterNetEvent('carg:doyarma')
AddEventHandler('carg:doyarma',function(item,price)
	Citizen.Trace(item)
	local si = nil
	for i=1,#arma,1 do
		if arma[i].label == item then
			if HasPedGotWeapon(GetPlayerPed(-1),arma[i].name,false) then
					Citizen.Trace(arma[i].name)
					AddAmmoToPed(GetPlayerPed(-1), arma[i].name, 30)
					TriggerServerEvent('carg:pipa',item,price)
					si = 1
					break
			end
		end
	end
	if si == nil or si == 0 then
		SetTextComponentFormat('STRING')
      	AddTextComponentString("No tienes ese arma")
      	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	else
		si = nil
	end


end)

--[[ Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		s = 1000
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

			for i = 1, #pos, 1 do
				if(GetDistanceBetweenCoords(coords, pos[i].x,pos[i].y,pos[i].z) < 1) then
					isInMarker  = true
					ShopItems   = items
					currentZone = 1
					LastZone    = i
				end
			end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('carg:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('carg:hasExitedMarker', LastZone)
		end

		
       		if(GetDistanceBetweenCoords(coords, pos[i].x,pos[i].y,pos[i].z) < 25) then
				s = 0
        		DrawMarker(1,pos[i].x,pos[i].y,pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5,1.5,1.5, 255,255,12, 100, false, true, 2, false, false, false, false)
        	end
    	end

    	if CurrentAction ~= nil then
			s = 0
	      SetTextComponentFormat('STRING')
	      AddTextComponentString(CurrentActionMsg)
	      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	      if IsControlJustReleased(0, 38) then          
	        if CurrentAction == 'shop_menu' then
				OpenShopMenu(zone)
	        end    
	        CurrentAction = nil            
	      end
		else
			s = 1000
	    end
		Citizen.Wait(s)
	end
end)]]

Citizen.CreateThread(function()
	while true do
		local sleep = 100
		for i = 1, #pos, 1 do
			local me = PlayerPedId()
			if GetDistanceBetweenCoords(GetEntityCoords(me), pos[i].x,pos[i].y,pos[i].z) <= 10.0 and not IsPedDeadOrDying(me, true) then
				DrawMarker(27,pos[i].x,pos[i].y,pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5,1.5,1.5, 255,255,12, 100, false, true, 2, false, false, false, false)
				DrawText3D(pos[i].x,pos[i].y,pos[i].z -0.5,"~r~CARGADORES~s~", 0, 0.1, 0.1,255)
				sleep = 0
				if GetDistanceBetweenCoords(GetEntityCoords(me), pos[i].x,pos[i].y,pos[i].z) <= 1.8 and not IsPedDeadOrDying(me, true) then
					
					--TriggerEvent('carg:hasEnteredMarker', currentZone)
						
						if IsControlJustReleased(0, 38) then
							OpenShopMenu(CurrentActionData.zone)
						end 
					
				end
			end
		end
		Wait(sleep)
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