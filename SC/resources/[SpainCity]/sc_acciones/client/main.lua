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

  local isDead = false
  local inAnim = false
  ESX = nil
  
  Citizen.CreateThread(function()
      while ESX == nil do
          TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
          Citizen.Wait(0)
      end
  end)
  
  AddEventHandler('esx:onPlayerDeath', function(data)
      isDead = true
  end)
  
  AddEventHandler('playerSpawned', function(spawn)
      isDead = false
  end)

-- DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI DNI 

function OpenDNIMenu()
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'id_card_menu',
	  {
		  title    = 'Documentos',
		  align    = 'bottom-right',
		  elements = {
			  {label = 'Mirar tu DNI', value = 'checkID'},
			  {label = 'Enseñar tu DNI', value = 'showID'},
			  {label = 'Mirar tu licencia de conducir', value = 'checkDriver'},
			  {label = 'Enseñar tu licencia de conducir', value = 'showDriver'},
			  {label = 'Mirar tu licencia de armas', value = 'checkFirearms'},
			  {label = 'Enseñar licencia de armas', value = 'showFirearms'},
		  }
	  },
	  function(data, menu)
		  local val = data.current.value
		  
		  if val == 'checkID' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		  elseif val == 'checkDriver' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
		  elseif val == 'checkFirearms' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
		  else
			  local player, distance = ESX.Game.GetClosestPlayer()
			  
			  if distance ~= -1 and distance <= 3.0 then
				  if val == 'showID' then
				  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				  elseif val == 'showDriver' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				  elseif val == 'showFirearms' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
				  end
			  else
				ESX.ShowNotification('No hay jugadores en la zona')
			  end
		  end
	  end,
	  function(data, menu)
		  menu.close()
	  end
  )
  end

-- INTERACCIONES

function OpenACMenu()
	local elements = {}

    for i=1, 1 do
        table.insert(elements, {label = 'Cargar/Soltar', value = 'cargar'})
        table.insert(elements, {label = 'Caballito', value = 'caballito'})
        table.insert(elements, {label = 'Rendirse', value = 'rendirse'})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'interacciones',
	{
		title    = 'Interacciones',
		align    = 'bottom-right',
		elements = elements
    }, function(data, menu)
        local source = GetPlayerServerId(PlayerId())
        local player, distance = ESX.Game.GetClosestPlayer()

        if data.current.value == 'cargar' then
            if distance ~= -1 and distance <= 3.0 then
                TriggerServerEvent('cmg2_animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
            else
                ESX.ShowNotification('No hay jugadores cerca')
            end
        if data.current.value == 'rendirse' then
            TriggerClientEvent('KneelHU', source, {})
            end
        if data.current.value == 'caballito' then
            if distance ~= -1 and distance <= 3.0 then
                TriggerServerEvent('cmg2_animations:sync', closestPlayer, lib, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
            else
                ESX.ShowNotification('No hay jugadores cerca')
            end
            end
        end
    end, function(data, menu)
        menu.close()
	end)
end



-- VESTIMENTA

function OpenActionMenuInteraction(target)

	local elements = {}

	table.insert(elements, {label = ('Vestirse'), value = 'ubie'})
	table.insert(elements, {label = ('Quitar camiseta'), value = 'tul'})
	table.insert(elements, {label = ('Quitar pantalones'), value = 'spo'})
	table.insert(elements, {label = ('Quitar zapatos'), value = 'but'})


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Vestimentas'),
			align    = 'Bottom-Right',
			elements = elements
		},
    function(data, menu)




		if data.current.value == 'ubie' then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
		end)
		elseif data.current.value == 'tul' then
		TriggerEvent('smerfikubrania:koszulka')
		elseif data.current.value == 'spo' then
		TriggerEvent('smerfikubrania:spodnie')
		elseif data.current.value == 'but' then
		TriggerEvent('smerfikubrania:buty')
      end

	end, function(data, menu)
		menu.close()
	end)
end


-- ACCESORIOS

function OpenAccessoryMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_unset_accessory',
	{
		title = 'set_unset',
		align = 'bottom-right',
		elements = {
            {label = 'Mascara', value = 'Mask'},
			{label = 'Casco', value = 'Helmet'},
			{label = 'Accesorios de oreja', value = 'Ears'},
			{label = 'Lentes', value = 'Glasses'}
		}
	}, function(data, menu)
		SetUnsetAccessory(data.current.value)

	end, function(data, menu)
		menu.close()
	end)
end

function SetUnsetAccessory(accessory)
	ESX.TriggerServerCallback('esx_accessories:get', function(hasAccessory, accessorySkin)
		local _accessory = string.lower(accessory)

		if hasAccessory then
			TriggerEvent('skinchanger:getSkin', function(skin)
				local mAccessory = -1
				local mColor = 0

				if _accessory == "mask" then
					mAccessory = 0
				end

				if skin[_accessory .. '_1'] == mAccessory then
					mAccessory = accessorySkin[_accessory .. '_1']
					mColor = accessorySkin[_accessory .. '_2']
				end

				local accessorySkin = {}
				accessorySkin[_accessory .. '_1'] = mAccessory
				accessorySkin[_accessory .. '_2'] = mColor
				TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
			end)
		else
			ESX.ShowNotification(_U('no_' .. _accessory))
		end

	end, accessory)
end




function OpenPersonalMenu()
	local elements = {}
	table.insert(elements, {label = '<span style="color:green;">Documentos <span style="color:cyan;"> >', value = 'identificacion'})
	table.insert(elements, {label = '<span style="color:red;">Estadisticas <span style="color:cyan;"> >', value = 'skills'})


	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'personal',
	{
		title    = 'Menu Personal',
		align    = 'bottom-right',
		elements = elements
    }, function(data, menu)
        local source = GetPlayerServerId(PlayerId())
        local player, distance = ESX.Game.GetClosestPlayer()

        if data.current.value == 'identificacion' then
            OpenDNIMenu()
        end
        if data.current.value == 'interacciones' then
            OpenACMenu()
        end
        if data.current.value == 'action_menu' then
            OpenActionMenuInteraction()
        end
        if data.current.value == 'set_unset_accessory' then
            OpenAccessoryMenu()
        end
        if data.current.value == 'skills' then
            exports["gamz-skillsystem"]:SkillMenu()
        end
    end, function(data, menu)
        menu.close()
	end)
end



-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Keys['Y']) and IsInputDisabled(0) then
            OpenPersonalMenu()
            open = false
        end
        
        if IsControlJustReleased(0, Keys['Y']) and IsInputDisabled(0) then
			OpenPersonalMenu()
		end

	end
end)

