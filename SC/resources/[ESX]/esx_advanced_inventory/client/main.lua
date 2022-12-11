ESX              = nil
local lSpeed	 = 1.49
local weightTotal = Config.Limit

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	Citizen.Wait(10)
	--TriggerEvent('esx_advanced_inventory:updateWeight')
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  if Config.userSpeed == true then
	TriggerEvent('esx_advanced_inventory:updateWeight')
  	TriggerServerEvent("esx_advanced_inventory:init", xPlayer)
  end
end)

RegisterNetEvent("esx_advanced_inventory:speed")
AddEventHandler("esx_advanced_inventory:speed", function(speed)
	
  if Config.userSpeed == true then
  	lSpeed = speed
  end
end)

RegisterNetEvent('esx_advanced_inventory:updateWeight')
AddEventHandler('esx_advanced_inventory:updateWeight', function ()

	local pesovip

	ESX.TriggerServerCallback('LUJURIA_VIP_2:getData', function (userdata)

		if userdata == nil then
			pesovip = 0
		else
			if userdata.id_grado == "oro" then
				pesovip = 30000
			elseif userdata.id_grado == "premium" then
				pesovip = 40000
			elseif userdata.id_grado == "deluxe" then
				pesovip = 50000
			elseif userdata.id_grado == "fundador" then
				pesovip = 75000
			end
			-- weightTotal = weightTotal + pesovip			
		end
		local gymweight = (exports["gamz-skillsystem"]:GetCurrentSkill("Fuerza").Current * 0.2 ) * 1500
		weightTotal = weightTotal + pesovip + math.floor(gymweight)
		
		SetTimeout(1000, function()
			TriggerServerEvent('esx_advanced_inventory:updateWeightPlayer', weightTotal)
		end)


	end)

end)