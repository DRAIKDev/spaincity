local blips = {

  {title="Iglesia", colour=29, id=305, x = -1680.38, y = -296.512, z = 51.812},
  --{title="Mecanico Paleto", colour=5, id=446,  x= 114.78, y= 6616.88, z= 31.86},
  {title="Laboratorios Humane", colour=5, id=499,  x= 3538.304, y= 3666.988, z= 28.121},


 
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)
