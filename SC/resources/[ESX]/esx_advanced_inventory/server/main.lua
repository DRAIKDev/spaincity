ESX = nil

local arrayWeight = Config.localWeight
serverWeightData	= {}

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

AddEventHandler('onMySQLReady', function ()
  if Config.WeightSqlBased == true then
    MySQL.Async.fetchAll(
      'SELECT * FROM item_weight',
      {},
      function(result)
        for i=1, #result, 1 do
          arrayWeight[result[i].item] = result[i].weight
        end
  
      end
    )
  end
end)

-- Return the sum of all item in pPlayer inventory
function getInventoryWeight(pPlayer)
  local weight = 0
  local itemWeight = 0

  if #pPlayer.inventory > 0 then
	  for i=1, #pPlayer.inventory, 1 do
	    if pPlayer.inventory[i] ~= nil then
	      itemWeight = Config.DefaultWeight
	      if arrayWeight[pPlayer.inventory[i].name] ~= nil then
	        itemWeight = arrayWeight[pPlayer.inventory[i].name]
	      end
	      weight = weight + (itemWeight * pPlayer.inventory[i].count)
	    end
	  end
  end
  return weight
end

-- Get user speed
-- https://runtime.fivem.net/doc/reference.html#_0x6DB47AA77FD94E09
function getUserSpeed(weight)
  local speed = 1.49

  if weight > Config.Limit / 2 then
  	speed = 1.49 * (weight / Config.Limit)
  end

  if speed < 1.0 then
  	speed = 1.0
  end

  if speed > 1.49 then
  	speed = 1.0
  end

  return speed
end

RegisterServerEvent('esx:onAddInventoryItem')
AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
  local source_ = source

  local xPlayer = ESX.GetPlayerFromId(source)
  local currentInventoryWeight = getInventoryWeight(xPlayer)
  WeightLocal = Config.Limit

  if Config.userSpeed == true then
    local speed = getUserSpeed(currentInventoryWeight)
    TriggerClientEvent('esx_advanced_inventory:speed', source, speed)
  end

  if serverWeightData[source] ~= nil then
    WeightLocal = serverWeightData[source]
  end

  if currentInventoryWeight > WeightLocal then
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemWeight = Config.DefaultWeight

    -- Get weight if it exists of current item
    if arrayWeight[item.name] then
      itemWeight = arrayWeight[item.name]
    end
    local qty = 0
    local weightTooMuch = 0
    weightTooMuch = currentInventoryWeight - WeightLocal
    qty = math.floor(weightTooMuch / itemWeight) + 1

    -- Should be false all the time. But can be true on fresh install
    if qty > count then
      qty = count
    end
    -- ESX.CreatePickup('item_standard', item.name, qty, item.label, source)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Superaste tu capacidad de inventario, has perdido ' .. item.label .. ' x' .. qty })
    xPlayer.removeInventoryItem(item.name, qty)
  else
    TriggerClientEvent('esx_hungerthirt:updateWeight', source, currentInventoryWeight, WeightLocal)
  end
end)

RegisterServerEvent('esx:onRemoveInventoryItem')
AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
    if Config.userSpeed == true then
      local xPlayer = ESX.GetPlayerFromId(source)
      local currentInventoryWeight = getInventoryWeight(xPlayer)
      local speed = getUserSpeed(currentInventoryWeight)
      TriggerClientEvent('esx_advanced_inventory:speed', source, speed)
      TriggerClientEvent('esx_hungerthirt:updateWeight', source ,currentInventoryWeight, serverWeightData[source])
    end
end)

RegisterServerEvent('esx_advanced_inventory:init')
AddEventHandler('esx_advanced_inventory:init', function(xPlayer)
    if Config.userSpeed == true then
      local currentInventoryWeight = getInventoryWeight(xPlayer)
      local speed = getUserSpeed(currentInventoryWeight)
      TriggerClientEvent('esx_advanced_inventory:speed', source, speed)
      TriggerClientEvent('esx_hungerthirt:updateWeight', source ,currentInventoryWeight, serverWeightData[source])
    end
end)

RegisterServerEvent('esx_advanced_inventory:updateWeightPlayer')
AddEventHandler('esx_advanced_inventory:updateWeightPlayer', function(weight)
  serverWeightData[source] = weight
end)


-- WIP: Someone to contribute ? Extend user max weight when skin having a bag ?

--	-- skin based solution (Config.BagIsSkin = true)

		--RegisterServerEvent('esx_skin:save')
		--AddEventHandler('esx_skin:save', function(skin)
		--	-- TODO: If skin, increase player max weight
		-- 	-- 		Do not forget to bind on esx:onRemoveInventoryItem when removing the bag.
		--end)


--	-- item bag based solution (Config.BagIsSkin = false)

		-- esx:onAddInventoryItem if item = bag
		-- esx:onRemoveInventoryItem if item = bag


-- TDB: If player throw, sell, give is bag (item or skin), need algo to throw randomly items ?



ESX.RegisterServerCallback('esx_advanced_inventory:returnWeight', function(source, cb)
  local pPlayer = ESX.GetPlayerFromId(source)
  local weight = 0
  local itemWeight = 0
if pPlayer ~= nil then
  if #pPlayer.inventory > 0 then
	  for i=1, #pPlayer.inventory, 1 do
	    if pPlayer.inventory[i] ~= nil then
	      itemWeight = Config.DefaultWeight
	      if arrayWeight[pPlayer.inventory[i].name] ~= nil then
	        itemWeight = arrayWeight[pPlayer.inventory[i].name]
	      end
	      weight = weight + (itemWeight * pPlayer.inventory[i].count)
	    end
	  end
  end
end
  cb(weight)
end)
