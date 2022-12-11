ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'mafia01', 'mafia01', 'society_mafia01', 'society_mafia01', 'society_mafia01', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'mafia02', 'mafia02', 'society_mafia02', 'society_mafia02', 'society_mafia02', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'mafia03', 'mafia03', 'society_mafia03', 'society_mafia03', 'society_mafia03', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'mafia04', 'mafia04', 'society_mafia04', 'society_mafia04', 'society_mafia04', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'mafia05', 'mafia05', 'society_mafia05', 'society_mafia05', 'society_mafia05', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'mafia06', 'mafia06', 'society_mafia06', 'society_mafia06', 'society_mafia06', {type = 'public'})

function isInJob(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'mafia01' or xPlayer.job.name == 'mafia02' or xPlayer.job.name == 'mafia03' or xPlayer.job.name == 'mafia04' or xPlayer.job.name == 'mafia05' or xPlayer.job.name == 'mafia06' then
		return true
	end
end


RegisterNetEvent('sc_mafias:confiscatePlayerItem')
AddEventHandler('sc_mafias:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local resource = GetCurrentResourceName()

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	if isInJob(_source) then
		
		if itemType == 'item_standard' then
			local targetItem = targetXPlayer.getInventoryItem(itemName)
			local sourceItem = sourceXPlayer.getInventoryItem(itemName)
	
			-- does the target player have enough in their inventory?
			if targetItem.count > 0 and targetItem.count <= amount then
	
				-- can the player carry the said amount of x item?
				if sourceXPlayer.canCarryItem(itemName, sourceItem.count) then
						if targetXPlayer.getInventoryItem(itemName).count <= amount then
						targetXPlayer.removeInventoryItem(itemName, amount)
						sourceXPlayer.addInventoryItem   (itemName, amount)
						sourceXPlayer.showNotification('Has robado', amount, sourceItem.label, targetXPlayer.name)
						targetXPlayer.showNotification('Te han robado', amount, sourceItem.label, sourceXPlayer.name)
						else 
							sourceXPlayer.showNotification("Cantidad invalida v2")
							print("Posible Dupeo de "..sourceXPlayer.identifier.."")
						end
				else
					sourceXPlayer.showNotification("Cantidad invalida v1")
				end
			else
				sourceXPlayer.showNotification("Cantidad Invalida")
			end
		elseif itemType == 'item_money' then
            if amount > 0 and targetXPlayer.getMoney() >= amount then
        
              targetXPlayer.removeMoney(amount)
              sourceXPlayer.addMoney(amount)
        
              TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Has robado "..amount.."€" )
              TriggerClientEvent('esx:showNotification', targetXPlayer.source, "Te han robado "..amount.." euros.")
        
            else
              TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "CANTIDAD INVALIDA")
            end
		elseif itemType == 'item_account' then
			if targetXPlayer.getAccount("black_money").money <= amount then
        
				targetXPlayer.removeAccountMoney(itemName, amount)
				sourceXPlayer.addAccountMoney   (itemName, amount)
		
				sourceXPlayer.showNotification('Has robado', amount, itemName, targetXPlayer.name)
				targetXPlayer.showNotification('Te han robado', amount, itemName, sourceXPlayer.name)
			else
				sourceXPlayer.showNotification("Cantidad invalida")
			end
		elseif itemType == 'item_weapon' then
			if amount == nil then amount = 0 end
			local loadoutNum, weapon = targetXPlayer.getWeapon(itemName)
			if weapon then
			targetXPlayer.removeWeapon(itemName, amount)
			sourceXPlayer.addWeapon   (itemName, amount)
	
			sourceXPlayer.showNotification('Has robado', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount)
			targetXPlayer.showNotification('Te han robado', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name)
			else
				sourceXPlayer.showNotification("Cantidad Invalida")
			end
		end


	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_source,resource)
	end

end)

RegisterNetEvent('sc_mafias:handcuff')
AddEventHandler('sc_mafias:handcuff', function(target,token)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "ESPOSASMAFIAS")
	end
	if isInJob(source) then
		TriggerClientEvent('sc_mafias:handcuff', target)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "ESPOSASMAFIAS v2")
	end
end)

RegisterNetEvent('sc_mafias:drag')
AddEventHandler('sc_mafias:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if isInJob(source) then
		TriggerClientEvent('sc_mafias:drag', target, source)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "DRAGMAFIAS v1")
	end
end)

RegisterNetEvent('sc_mafias:putInVehicle')
AddEventHandler('sc_mafias:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if isInJob(source) then
		TriggerClientEvent('sc_mafias:putInVehicle', target)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "PUTVEH v1")
	end
end)

RegisterNetEvent('sc_mafias:OutVehicle')
AddEventHandler('sc_mafias:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if isInJob(source) then
		TriggerClientEvent('sc_mafias:OutVehicle', target)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "outveh v1")
	end
end)

-- Coger y Deporitar objetos Serverside --
RegisterNetEvent('sc_mafias:getStockItem')
AddEventHandler('sc_mafias:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if isInJob(source) then

		TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job.name..'', function(inventory)
			local inventoryItem = inventory.getItem(itemName)

			-- is there enough in the society?
			if count > 0 and inventoryItem.count >= count then

				-- can the player carry the said amount of x item?
				if xPlayer.canCarryItem(itemName, count) then
					inventory.removeItem(itemName, count)
					xPlayer.addInventoryItem(itemName, count)
					xPlayer.showNotification(_U('have_withdrawn', count, inventoryItem.label))
				else
					xPlayer.showNotification(_U('quantity_invalid'))
				end
			else
				xPlayer.showNotification(_U('quantity_invalid'))
			end
		end)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "getStockItem v1")
	end

end)

RegisterNetEvent('sc_mafias:putStockItems')
AddEventHandler('sc_mafias:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)
	if isInJob(source) then

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job.name..'', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			xPlayer.showNotification(_U('have_deposited', count, inventoryItem.label))
		else
			xPlayer.showNotification(_U('quantity_invalid'))
		end
	end)
else
	TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "pustock v1")
end
end)

ESX.RegisterServerCallback('sc_mafias:getStockItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job.name..'', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('sc_mafias:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

-- Coger, Deporitar y Comprar armas Serverside --
ESX.RegisterServerCallback('sc_mafias:getArmoryWeapons', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..xPlayer.job.name..'', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
else
	TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "getArmoryWeapons v1")
end
end)

ESX.RegisterServerCallback('sc_mafias:addArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then

		if xPlayer.hasWeapon(weaponName) then 
		xPlayer.removeWeapon(weaponName)

		TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..xPlayer.job.name..'', function(store)
			local weapons = store.get('weapons') or {}
			local foundWeapon = false

			for i=1, #weapons, 1 do
				if weapons[i].name == weaponName then
					weapons[i].count = weapons[i].count + 1
					foundWeapon = true
					break
				end
			end

			if not foundWeapon then
				table.insert(weapons, {
					name  = weaponName,
					count = 1
				})
			end

			store.set('weapons', weapons)
			cb()
		end)
	else
		xPlayer.showNotification("~r~NO PUEDES DEJAR ALGO QUE NO LLEVAS~r~")
		end
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "addArmoryWeapon v1")
	end
end)

ESX.RegisterServerCallback('sc_mafias:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 250)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..xPlayer.job.name..'', function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('sc_mafias:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon
	
	if Config.Zones[xPlayer.job.name].Armories.Opciones.Armeria then
		authorizedWeapons, selectedWeapon = Config.AuthorizedWeapons[xPlayer.job.grade_name]
	else
		authorizedWeapons, selectedWeapon = Config.AuthorizedWeaponsFalse[xPlayer.job.grade_name]
	end

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end

	if not selectedWeapon then
		print(('sc_mafias: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		-- Weapon
		if type == 1 then
			if xPlayer.getAccount('money').money >= selectedWeapon.price then
				xPlayer.removeAccountMoney('money', selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 100)


				cb(true)
			else
				cb(false)
			end

		-- Weapon Component
		elseif type == 2 then
			local price = selectedWeapon.components[componentNum]
			local weaponNum, weapon = ESX.GetWeapon(weaponName)
			local component = weapon.components[componentNum]

			if component then
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeaponComponent(weaponName, component.name)

					cb(true)
				else
					cb(false)
				end
			else
				print(('sc_mafias: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

-- Sacar vehiculos Serverside --
ESX.RegisterServerCallback('sc_mafias:buyVehicle', function(source,cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local vehicles, selectedvehicle
	if isInJob(tonumber(source)) then

	if type == 'car' then
		vehicles, selectedvehicle = Config.Zones[xPlayer.job.name].CarZones.Opciones.Vehiculos
	else
		vehicles, selectedvehicle = Config.Zones[xPlayer.job.name].HeliZones.Opciones.Vehiculos
	end

	for k,v in ipairs(vehicles) do
		if v.vehicle == vehicleName then
			selectedvehicle = v
			break
		end
	end

	if not selectedvehicle then
		print(('sc_mafias: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..xPlayer.job.name..'', function(account)
			if selectedvehicle.price <= account.money then
				account.removeMoney(selectedvehicle.price)
				cb(true)
			else
				cb(false)
			end
		end)
	end
else 
	TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK", xPlayer.source, "buyVehicle v1")

end

end)

-- Armario Ropa personal Serverside --
ESX.RegisterServerCallback('sc_mafias:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local count    = store.count('dressing')
	  local labels   = {}
  
	  for i=1, count, 1 do
		local entry = store.get('dressing', i)
		table.insert(labels, entry.label)
	  end
  
	  cb(labels)
	end)
end)
  
ESX.RegisterServerCallback('sc_mafias:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)

-- Menu F6 Serverside --
RegisterServerEvent("uhsdkjahdjkahsdkaj:duj790hb")
AddEventHandler("uhsdkjahdjkahsdkaj:duj790hb",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if isInJob(source) then
	TriggerClientEvent("dhsjuaygdbnjuyh:wetuwetuwety", xPlayer.source)
end
end)



RegisterServerEvent("usghbdnaiygjhbjuygbn65tyu765r:65tyui865rfghjk876t")
AddEventHandler("usghbdnaiygjhbjuygbn65tyu765r:65tyui865rfghjk876t",function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'mafia01' or xPlayer.job.name == 'mafia02' or xPlayer.job.name == 'mafia03' or xPlayer.job.name == 'mafia04' or xPlayer.job.name == 'mafia05' or xPlayer.job.name == 'mafia06' then
		TriggerClientEvent("jgshdnajytgdauygb:6thu76tghj7y", xPlayer.source, true, xPlayer.job.name , xPlayer.job.grade_name)
	end
end)