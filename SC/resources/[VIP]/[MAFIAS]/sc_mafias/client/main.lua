
local CurrentActionData, handcuffTimer, dragStatus = {}, {}, {}
local isDead, isHandcuffed, hasAlreadyJoined, playerInService = false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged, isInShopMenu = false, false
local js_isInJob = false
local js_Job = nil
local js_Job_grade = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    if job ~= nil then
        if job.name == 'mafia01' or job.name == 'mafia02' or job.name == 'mafia03' or job.name == 'mafia04' or job.name == 'mafia05' or job.name == 'mafia06' then
            js_isInJob = true
            js_Job = job.name
			js_Job_grade = job.grade_name

        else
            js_isInJob = false
        end
    end
end)



function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

-- Cloakroom Clientside --
function OpenCloakroomMenu()
	local playerPed = PlayerPedId()

	local elements = {
		{label = ('Armario de Ropa personal'), value = 'player_dressing'},
		{label = ('---CHALECOS---'), value = ''},
		{label = ('Añadir chaleco Antibalas'), value = 'armadura1'},
		{label = ('Quitar chaleco Antibalas'), value = 'quitararmadura'}
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)
		

		if data.current.value == 'player_dressing' then
		
			ESX.TriggerServerCallback('sc_mafias:getPlayerDressing', function(dressing)
			  local elements = {}
	
			  for i=1, #dressing, 1 do
				table.insert(elements, {label = dressing[i], value = i})
			  end
	
			  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
				  title    = ('Ropa Personal'),
				  align    = 'top-left',
				  elements = elements,
				}, function(data, menu)
	
				  TriggerEvent('skinchanger:getSkin', function(skin)
	
					ESX.TriggerServerCallback('sc_mafias:getPlayerOutfit', function(clothes)
	
					  TriggerEvent('skinchanger:loadClothes', skin, clothes)
					  TriggerEvent('esx_skin:setLastSkin', skin)
	
					  TriggerEvent('skinchanger:getSkin', function(skin)
						TriggerServerEvent('esx_skin:save', skin)
					  end)
					  
					  ESX.ShowNotification(('¡Ropa personal puesta!'))
					  HasLoadCloth = true
					end, data.current.value)
				  end)
				end, function(data, menu)
				  menu.close()
				  
				  CurrentAction     = 'menu_cloakroom'
				  CurrentActionMsg  = _U('open_cloackroom')
				  CurrentActionData = {}
				end
			  )
			end)
		end
		if data.current.value == 'armadura1' then
			local ply = PlayerPedId()
			AddArmourToPed(ply, 100)
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
	        end)
		  end
		  if data.current.value == 'quitararmadura' then
			SetPedArmour(GetPlayerPed(-1), 0)
		  end
	
		if data.current.value == 'freemode_ped' then
			local modelHash

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)
					SetPedDefaultComponentVariation(PlayerPedId())

					TriggerEvent('esx:restoreLoadout')
				end)
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end

-- Armory Clientside --
function OpenArmoryMenu()
	local elements = {
		{label = _U('buy_weapons'), value = 'buy_weapons'}
	}

	if Config.EnableArmoryManagement then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('put_weapon'),     value = 'put_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = _U('armory'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu()
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		elseif data.current.value == 'buy_weapons' then
			OpenBuyWeaponsMenu()
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		end

	end, function(data, menu)
		menu.close()
	end)
end

-- Menu F6 Clientside --
function OpenmafiaActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), ''..js_Job..'_actions', {
		title    = '<b><span style="color: lightsteelblue;">MENU SOCIEDAD</span></b>',
		align    = 'top-left',
		elements = {
	
			{label = '<span style="color: beige;">Cachear</span>', value = 'dsadadhadj'},

			{label = '<span style="color: beige;">Esposar/Desesposar</span>', value = 'esposdadadsadasar'},
			{label = '<span style="color: beige;">Escoltar/Desescoltar</span>', value = 'dasdadsadasdfcd'},
			{label = '<span style="color: beige;">Meter en vehiculo</span>', value = 'sadsdada'},
			{label = '<span style="color: beige;">Sacar del vehiculo</span>', value = 'dsadada'},
			{label = '<span style="color: beige;">Menu Vehiculos</span>', value = 'vehicle_interaction'}}
		}, function(data, menu)
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer ~= -1 and closestDistance <= 3.0 and data.current.value ~= 'vehicle_interaction' then
				local action = data.current.value
		
				if action == 'dsadadhadj' then
					OpenBodySearchMenu(closestPlayer)
				elseif action == 'esposdadadsadasar' then
					ExecuteCommand("me Le esposa/desesposa con cuidado.")
					TriggerServerEvent('sc_mafias:handcuff', GetPlayerServerId(closestPlayer),securityToken)
				elseif action == 'dasdadsadasdfcd' then
					ExecuteCommand("me Le mueve del hombro.")

					TriggerServerEvent('sc_mafias:drag', GetPlayerServerId(closestPlayer))
				elseif action == 'sadsdada' then
					ExecuteCommand("me Le mete en el vehiculo.")

					TriggerServerEvent('sc_mafias:putInVehicle', GetPlayerServerId(closestPlayer))
				elseif action == 'dsadada' then
					TriggerServerEvent('sc_mafias:OutVehicle', GetPlayerServerId(closestPlayer))
					ExecuteCommand("me Le saca del vehiculo.")

				end
			elseif data.current.value == 'vehicle_interaction' then
				local elements  = {}
				local playerPed = PlayerPedId()
				local vehicle = ESX.Game.GetVehicleInDirection()
	
				if DoesEntityExist(vehicle) then
					table.insert(elements, {label = _U('pick_lock'), value = 'hijack_vehicle'})
				end
	
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
					title    = _U('vehicle_interaction'),
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					local coords  = GetEntityCoords(playerPed)
					vehicle = ESX.Game.GetVehicleInDirection()
					action  = data2.current.value
		
					if DoesEntityExist(vehicle) then
						if action == 'hijack_vehicle' then
							if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
								TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed)
	
								SetVehicleDoorsLocked(vehicle, 1)
								SetVehicleDoorsLockedForAllPlayers(vehicle, false)
								ESX.ShowNotification(_U('vehicle_unlocked'))
							end
						end
					else
						ESX.ShowNotification(_U('no_vehicles_nearby'))
					end
	
				end, function(data2, menu2)
					menu2.close()
				end)
			else
				ESX.ShowNotification(_U('no_players_nearby'))
			end
		
		
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('Dk102:getOtherPlayerData', function(data)
		local elements = {}
		table.insert(elements, {label ="DINERO"})
		
		table.insert(elements, {
			
			label = "Robar dinero del bolsillo: "..ESX.Math.GroupDigits(data.money).."",
			value = 'money',
			itemType = 'item_money',
			amount = data.money
		})

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = "Confiscar dinero negro: "..ESX.Math.Round(data.accounts[i].money).."",
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label ="ARMAS"})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = "Confiscar Arma: "..ESX.GetWeaponLabel(data.weapons[i].name).."-"..data.weapons[i].ammo.."",
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = "OBJETOS"})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = "Confiscar Objeto: "..data.inventory[i].label.."-"..data.inventory[i].count.."",
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = "BUSCAR",
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('Dk102:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				menu.close()
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end
function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('sc_mafias:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			title    = _U('get_weapon_menu'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('sc_mafias:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		title    = _U('put_weapon_menu'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('sc_mafias:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyWeaponsMenu()
	local elements = {}
	local playerPed = PlayerPedId()

    if js_Job == "mafia01" then
		print(js_Job)
        for k,v in ipairs(Config.AuthorizedWeapons[js_Job_grade]) do
            local weaponNum, weapon = ESX.GetWeapon(v.weapon)
            local components, label = {}
            local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

            if v.components then
                for i=1, #v.components do
                    if v.components[i] then
                        local component = weapon.components[i]
                        local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

                        if hasComponent then
                            label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_owned'))
                        else
                            if v.components[i] > 0 then
                                label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_item', ESX.Math.GroupDigits(v.components[i])))
                            else
                                label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_free'))
                            end
                        end

                        table.insert(components, {
                            label = label,
                            componentLabel = component.label,
                            hash = component.hash,
                            name = component.name,
                            price = v.components[i],
                            hasComponent = hasComponent,
                            componentNum = i
                        })
                    end
                end
            end

            if hasWeapon and v.components then
                label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
            elseif hasWeapon and not v.components then
                label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_owned'))
            else
                if v.price > 0 then
                    label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_item', ESX.Math.GroupDigits(v.price)))
                else
                    label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_free'))
                end
            end

            table.insert(elements, {
                label = label,
                weaponLabel = weapon.label,
                name = weapon.name,
                components = components,
                price = v.price,
                hasWeapon = hasWeapon
            })
        end
    else
        for k,v in ipairs(Config.AuthorizedWeaponsFalse[js_Job_grade]) do
            local weaponNum, weapon = ESX.GetWeapon(v.weapon)
            local components, label = {}
            local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

            if v.components then
                for i=1, #v.components do
                    if v.components[i] then
                        local component = weapon.components[i]
                        local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

                        if hasComponent then
                            label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_owned'))
                        else
                            if v.components[i] > 0 then
                                label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_item', ESX.Math.GroupDigits(v.components[i])))
                            else
                                label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_free'))
                            end
                        end

                        table.insert(components, {
                            label = label,
                            componentLabel = component.label,
                            hash = component.hash,
                            name = component.name,
                            price = v.components[i],
                            hasComponent = hasComponent,
                            componentNum = i
                        })
                    end
                end
            end

            if hasWeapon and v.components then
                label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
            elseif hasWeapon and not v.components then
                label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_owned'))
            else
                if v.price > 0 then
                    label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_item', ESX.Math.GroupDigits(v.price)))
                else
                    label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_free'))
                end
            end

            table.insert(elements, {
                label = label,
                weaponLabel = weapon.label,
                name = weapon.name,
                components = components,
                price = v.price,
                hasWeapon = hasWeapon
            })
        end
    end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons', {
		title    = _U('armory_weapontitle'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.hasWeapon then
			if #data.current.components > 0 then
				OpenWeaponComponentShop(data.current.components, data.current.name, menu)
			end
		else
			ESX.TriggerServerCallback('sc_mafias:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.weaponLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, data.current.name, 1)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenWeaponComponentShop(components, weaponName, parentShop)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons_components', {
		title    = _U('armory_componenttitle'),
		align    = 'top-left',
		elements = components
	}, function(data, menu)
		if data.current.hasComponent then
			ESX.ShowNotification(_U('armory_hascomponent'))
		else
			ESX.TriggerServerCallback('sc_mafias:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.componentLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					parentShop.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, weaponName, 2, data.current.componentNum)
		end
	end, function(data, menu)
		menu.close()
	end)
end

-- Coger y Deporitar objetos Clientside --
function OpenGetStocksMenu()
	ESX.TriggerServerCallback('sc_mafias:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('mafia_stock'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('sc_mafias:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('sc_mafias:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('sc_mafias:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end


-- Esposas Clientside --
RegisterNetEvent('sc_mafias:handcuff')
AddEventHandler('sc_mafias:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, true)
		DisplayRadar(false)

		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end

			StartHandcuffTimer()
		end
	else
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('sc_mafias:unrestrain')
AddEventHandler('sc_mafias:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('sc_mafias:drag')
AddEventHandler('sc_mafias:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('sc_mafias:unrestrain')
		handcuffTimer.active = false
	end)
end
RegisterNetEvent('sc_mafias:putInVehicle')
AddEventHandler('sc_mafias:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

RegisterNetEvent('sc_mafias:OutVehicle')
AddEventHandler('sc_mafias:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		local sleep = 1000
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
                    sleep = 0
                end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
                sleep = 0
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
            sleep = 0
		end
        Wait(sleep)
	end
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		local playerPed = PlayerPedId()

		if isHandcuffed then
            sleep = 0 
			 -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S
			DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
        end
        Wait(sleep)
	end
end)

-- Draw markers and more
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if js_isInJob then
			for k, v in pairs(Config.Zones[js_Job].Cloakrooms) do
				local me = PlayerPedId()
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
				if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
					sleep = 0
					if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
						if not IsPedInAnyVehicle(me, false) then
							ESX.ShowHelpNotification(_U('open_cloackroom'))
							if IsControlJustReleased(0, 38) and js_Job then
								OpenCloakroomMenu()
							end
						end
					end
				end
			end

			for k, v in pairs(Config.Zones[js_Job].Armories) do
				local me = PlayerPedId()
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
				if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
					sleep = 0
					if distance <= 3.5 and not IsPedDeadOrDying(me, true) then
						if not IsPedInAnyVehicle(me, false) then
							ESX.ShowHelpNotification(_U('open_armory'))
							if IsControlJustReleased(0, 38) and js_Job then
								OpenArmoryMenu()
							end
						end
					end
				end
			end

			for k, v in pairs(Config.Zones[js_Job].BossActions) do
				local me = PlayerPedId()
				local playerPos = GetEntityCoords(me, true)
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
				if distance <= 7.5 and not IsPedDeadOrDying(me, true) then	
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
					sleep = 0
					if distance <= 1.8 and not IsPedDeadOrDying(me, true) then
						if not IsPedInAnyVehicle(me, false) then
							ESX.ShowHelpNotification(_U('open_bossmenu'))
							if IsControlJustReleased(0, 38) and js_Job then
								ESX.UI.Menu.CloseAll()
								TriggerEvent('esx_society:openBosthsMenu', ''..js_Job..'', function(data, menu)
								menu.close()
								CurrentAction     = 'menu_boss_actions'
								CurrentActionMsg  = _U('open_bossmenu')
								CurrentActionData = {}
								end, { wash = false })
							end
						end
					end
				end
			end

			if not (js_Job == 'mafia05') then
				for k, v in pairs(Config.Zones[js_Job].HeliZones) do
					local me = PlayerPedId()
					local playerPos = GetEntityCoords(me, true)
					local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
					if distance <= 15 and not IsPedDeadOrDying(me, true) then	
						DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
						sleep = 0
						if distance <= 2.5 and not IsPedDeadOrDying(me, true) then
							ESX.ShowHelpNotification(_U('open_vehicle'))
							if IsControlJustReleased(0, 38) and js_Job then
								mafiaGarage('helicopter')
							end
						end
					end
				end

				for k, v in pairs(Config.Zones[js_Job].CarZones) do
					local me = PlayerPedId()
					local playerPos = GetEntityCoords(me, true)
					local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, v.Pos.x, v.Pos.y, v.Pos.z)
					if distance <= 15 and not IsPedDeadOrDying(me, true) then	
						DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
						sleep = 0
						if distance <= 2.5 and not IsPedDeadOrDying(me, true) then
							ESX.ShowHelpNotification(_U('open_vehicle'))
							if IsControlJustReleased(0, 38) and js_Job then
								mafiaGarage('car')
							end
						end
					end
				end
			end
		end
		Wait(sleep)
	end
end)


function mafiaGarage(type)  
	local elements = {
		{ label = _U('store_vehicle'), action = "store_vehicle" },
		{ label = _U('get_vehicle'), action = "get_vehicle" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "sc_mafiasGarage_menu",
		{
			title    = _U('title_gar'),
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		local action = data.current.action
		if action == "get_vehicle" then
			if type == 'car' then
				VehicleMenu('car')
			elseif type == 'helicopter' then
				VehicleMenu('helicopter')
			elseif type == 'boat' then
				VehicleMenu('boat')
			end
		elseif data.current.action == 'store_vehicle' then
			local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
			if dist < 3 then
				DeleteEntity(veh)
				ESX.ShowNotification(_U('vehicle_parked'))
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		end
	end, function(data, menu)
		menu.close()
	end, function(data, menu)
	end)
end

-- Vehicle Spawn Menu:
function VehicleMenu(type)
	print(GetPlayerServerId(PlayerId()))
	local storage = nil
	local elements = {}
	local ped = GetPlayerPed(-1)
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(ped)
	
	if type == 'car' then
		for k,v in pairs(Config.Zones[js_Job].CarZones.Opciones.Vehiculos) do
			table.insert(elements,{label = ('%s - %s'):format(v.label, ''..v.price..'$'), name = v.label, model = v.model, price = v.price, type = 'car'})
		end
	elseif type == 'helicopter' then
		for k,v in pairs(Config.Zones[js_Job].HeliZones.Opciones.Vehiculos) do
			table.insert(elements,{label = ('%s - %s'):format(v.label, ''..v.price..'$'), name = v.label, model = v.model, price = v.price, type = 'helicopter'})
		end
	-- elseif type == 'boat' then
	-- 	for k,v in pairs(Config.Zones[js_Job].BoatZones.Opciones.Vehiculos) do
	-- 		table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'boat'})
	-- 	end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "sc_mafiasGarage_vehicle_garage",
		{
			title    = _U('title_gar'),
			align    = "center",
			elements = elements
		},
	function(data, menu)
		ESX.TriggerServerCallback('sc_mafias:buyVehicle', function(bought)
			if bought then
				menu.close()
				local plate = exports['esx_vehicleshop']:GeneratePlate()
				VehicleLoadTimer(data.current.model)
				local veh = CreateVehicle(data.current.model, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
				SetPedIntoVehicle(GetPlayerPed(-1), veh, -1)
				SetVehicleNumberPlateText(veh, plate)
				
				if type == 'car' then
					ESX.ShowNotification(_U('car_out_gar'))
				elseif type == 'helicopter' then
					ESX.ShowNotification(_U('heli_out_gar'))
				-- elseif type == 'boat' then
				-- 	ESX.ShowNotification(_U('boat_out_gar'))
				end
				
				TriggerEvent("fuel:setFuel",veh,100.0)
				SetVehicleDirtLevel(veh, 0.1)
			else
				ESX.ShowNotification(_U('vehicle_money'))
			end
		end, data.current.type,GetPlayerServerId(PlayerId()))
	end, function(data, menu)
		menu.close()
	end, function(data, menu)
	end)
end

function VehicleLoadTimer(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)

			drawLoadingText(Config.VehicleLoadText, 255, 255, 255, 255)
		end
	end
end
-- Loading Text for Vehicles Function:
function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

RegisterCommand("Abromenumafias", function()
	TriggerServerEvent("uhsdkjahdjkahsdkaj:duj790hb")
end)

RegisterNetEvent("dhsjuaygdbnjuyh:wetuwetuwety")
AddEventHandler("dhsjuaygdbnjuyh:wetuwetuwety",function()
	OpenmafiaActionsMenu()
end)

RegisterKeyMapping('Abromenumafias', 'Abrir Menu mafias', 'keyboard', 'F6' )


AddEventHandler('onResourceStart', function (resourceName)
	if(GetCurrentResourceName() == resourceName)  then
		TriggerServerEvent("usghbdnaiygjhbjuygbn65tyu765r:65tyui865rfghjk876t")
	end
end)

AddEventHandler('esx:onPlayerSpawn', function ()
	TriggerServerEvent("usghbdnaiygjhbjuygbn65tyu765r:65tyui865rfghjk876t")
end)

RegisterNetEvent("jgshdnajytgdauygb:6thu76tghj7y")
AddEventHandler("jgshdnajytgdauygb:6thu76tghj7y",function(boolean, job,dhajhsdajdhasj)
	js_isInJob = boolean
	js_Job = job
	js_Job_grade = dhajhsdajdhasj
	
end)




