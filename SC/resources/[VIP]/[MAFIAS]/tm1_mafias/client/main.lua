AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent('tm1_mafias:groupcomprobate')
end)
TriggerServerEvent('tm1_mafias:groupcomprobate')
RegisterNetEvent('tm1_mafias:groupcomprobated')
RegisterNetEvent('tm1_mafias:refreshedMoney')
RegisterNetEvent('tm1_mafias:refreshedGroup')
RegisterNetEvent('tm1_mafias:refreshedSteam')
RegisterNetEvent('tm1_mafias:contador')
group = {
	name = "",
	money = nil,
	rank = nil,
	aprove = nil,--esposas
	groupid = nil,
	steam = nil,
	source = nil,
	armariosaproved = nil,
	enclosure = nil
}


------------------------------
---------TRADUCCIONES---------
------------------------------
rankLabel = {
	[1] = "RECLUTA",
	[2] = "NOVATO",
	[3] = "PROFESIONAL",
	[4] = "SUBJEFE",
	[5] = "JEFE"
}
grouplabel = {
	[1] = "BANDA",
	[2] = "BANDA"
}
------------------------------
--------HILO PRINCIPAL--------
------------------------------





AddEventHandler('tm1_mafias:groupcomprobated',function(isGroup,name,money,rank,aprove,id,steam,source,enclosure,armarios)
	isInAGroup = isGroup
	group.name = name
	group.money = money
	group.rank = rank
	group.groupid = id
	group.steam = steam
	group.source = source
	group.enclosure = enclosure
	group.armariosaproved = armarios
	if aprove == 1 then
		group.aprove = 2
	else
		group.aprove = 1
	end
	TriggerServerEvent('tm1_mafias:setGroup',group)
	
end)
AddEventHandler('tm1_mafias:refreshedMoney',function(id,money)
	if id == group.groupid then
		group.money = money
		TriggerServerEvent('tm1_mafias:setGroup',group)
	end
end)

AddEventHandler('tm1_mafias:refreshedSteam',function(steam,source)
		group.steam = steam
		group.source = source
		TriggerServerEvent('tm1_mafias:setGroup',group)
end)
AddEventHandler('tm1_mafias:contador',function(groupid)
		if groupid == group.groupid then
			TriggerServerEvent('tm1_mafias:addUser',group.groupid)
		end
end)
AddEventHandler('tm1_mafias:contador',function(groupid)
		if groupid == group.groupid then
			TriggerServerEvent('tm1_mafias:addUser',group.groupid)
		end
end)


------------------------------
----------FUNCIONES-----------
------------------------------
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end


 function DrawText3D(x,y,z, text, r,g,b) -- some useful function, use it if you want!
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
