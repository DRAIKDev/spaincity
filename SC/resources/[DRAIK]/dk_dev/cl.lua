ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
local ttmanin = {}
RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weapon)
    local weaponname = weapon
    local hash = GetHashKey(weapon)
    -- print(weaponname)
    ttmanin[hash] = true
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:restoreLoadout', function()
        local ped = PlayerPedId()
        local playerdt = ESX.GetPlayerData()
		for k,v in ipairs(playerdt.loadout) do
			local weaponName = v.name
			local weaponHash = GetHashKey(weaponName)
            -- print(weaponName)
            ttmanin[weaponHash] = true
	
		end
end)

RegisterCommand("dumpttmanin", function()
print(json.encode(ttmanin))
end)


RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weapon)
    local weaponname = weapon
    local hash = GetHashKey(weapon)
    -- print(weaponname)
    ttmanin[hash] = nil

end)


Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(PlayerId())
		local sw = GetSelectedPedWeapon(ped)
		if isweaponwh(sw) then
            if not(ttmanin[sw]) then 
                TriggerServerEvent("detectadaarmaeneljugador",sw)
            end
		end
		Citizen.Wait(2500)
	end
end)

function isweaponwh(hash)
    if hash == -1569615261 or hash == 0 or hash == -656458629 or hash == -2067956739 or hash == -656458692 or  hash == -1466123874 or hash == -538741184 or hash == -102973651 or hash == 966099553 or hash == -1834847097 or hash == -100946242 or hash == -1148198339 then
        return false
    else
        return true
    end
end

