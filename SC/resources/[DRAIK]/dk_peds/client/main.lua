local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX								= nil
local HasAlreadyEnteredMarker	= false
local LastZone					= nil
local CurrentAction				= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}
local CurrentActionMsgCoords = nil
local isDead					= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	local xPlayer = ESX.GetPlayerData()

end)

function OpenAccessoryMenu()
	local elements = {
	}
	local xPlayer = ESX.GetPlayerData()
	local allowStaffPeds = false
	local needOriginal = false
	for _,v in pairs(Config.Peds) do
		if xPlayer.identifier == v.identifier then
			table.insert(elements, v)
			needOriginal = true
		end
	end
	if(needOriginal)then
		table.insert(elements, 1, {label = 'Avatar original', value = 'pedoff'})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_unset_accessory',
	{
		title = 'Menú Peds',
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		menu.close()
		SetUnsetPed(data.current)
	end, function(data, menu)
		menu.close()
	end)
end


local isCustomPed = false


function SetUnsetPed(accessory)
	if accessory.value == "pedoff" then
		if(isCustomPed) then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				local isMale = skin.sex == 0
				godmode = false
				TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx:restoreLoadout')
						TriggerEvent('dpc:ApplyClothing')
					end)
				end)

			end)
			isCustomPed = false
		end
		elseif accessory.value == "customavatar" then
		local modelHash = GetHashKey(accessory.haskey)
		godmode = false
		SetPedDefaultComponentVariation(PlayerPedId())
		ESX.Streaming.RequestModel(modelHash, function()
			SetPlayerModel(PlayerId(), modelHash)
			SetPedDefaultComponentVariation(PlayerPedId())
			SetModelAsNoLongerNeeded(modelHash)
			TriggerEvent('esx:restoreLoadout')
			SetPedComponentVariation(PlayerPedId(), 8, 0, 0, 2)
			SetEntityMaxHealth(PlayerPedId(), 200)
			Citizen.Wait(1000)
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				TriggerEvent('esx:restoreLoadout')
				TriggerEvent('dpc:ApplyClothing')
			end)
		end)
		isCustomPed = true
		elseif accessory.value == "animalavatar" then
		local modelHash = GetHashKey(accessory.haskey)
		godmode = false
		ESX.Streaming.RequestModel(modelHash, function()
			SetPlayerModel(PlayerId(), modelHash)
			--TriggerEvent('esx:restoreLoadout')
			SetPedDefaultComponentVariation(PlayerPedId())
			--SetPedComponentVariation(PlayerPedId(), 8, 0, 0, 2)
			SetPedEnveffScale(GetPlayerPed(-1), 0.2)
			SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 0)
		--	SetCanAttackFriendly(GetPlayerPed(-1), true, true)
		end)
		isCustomPed = true
	else
		ESX.ShowNotification("Ha ocurrido un error a la hora de poner el ped")
	end
end

TriggerEvent('chat:addSuggestion', '/peds', 'Abra el menu de peds', {})





RegisterCommand("peds", function(source, args, rawCommand)
	OpenAccessoryMenu()
end, false) 