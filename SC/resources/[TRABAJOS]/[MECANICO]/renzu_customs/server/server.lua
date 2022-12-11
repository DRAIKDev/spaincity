ESX = nil
QBCore = nil
RegisterServerCallBack_ = {}
Initialized()
Citizen.CreateThread(function()
    Wait(1000)
    VehicleNames()
    for k,v in pairs(Config.Customs) do
        CustomsSQL(Config.Mysql,'execute','INSERT IGNORE  INTO renzu_customs (shop) VALUES (@shop)', {
            ['@shop']   = k,
        })
    end
end)

RegisterServerCallBack_('renzu_customs:getinventory', function (source, cb, id, share)
    local source = source
    local xPlayer = GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    if share then
        identifier = share.owner
    end
    local result = CustomsSQL(Config.Mysql,'fetchAll','SELECT inventory FROM renzu_customs WHERE shop = @shop', {
        ['@shop'] = id
    })
    local inventory = {}
    if result[1] and result[1].inventory ~= nil then
        inventory = json.decode(result[1].inventory) or {}
    end
    cb(inventory)
end)

RegisterServerCallBack_('renzu_customs:itemavailable', function (source, cb, id, item, share)
    local source = source
    local xPlayer = GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    if share then
        identifier = share.owner
    end
    local result = CustomsSQL(Config.Mysql,'fetchAll','SELECT inventory FROM renzu_customs WHERE shop = @shop', {
        ['@shop'] = id
    })
    local inventory = false
    if json.decode(result[1].inventory) then
        inventory = json.decode(result[1].inventory) or {}
        if inventory[item] ~= nil and inventory[item] > 0 then
            inventory[item] = inventory[item] - 1
            CustomsSQL(Config.Mysql,'execute','UPDATE renzu_customs SET inventory = @inventory WHERE shop = @shop', {
                ['@inventory'] = json.encode(inventory),
                ['@shop'] = id,
            })
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

RegisterServerEvent('renzu_customs:storemod')
AddEventHandler('renzu_customs:storemod', function(id,mod,lvl,newprop,share,save,savepartsonly)
    local src = source  
    local xPlayer = GetPlayerFromId(src)
    local identifier = xPlayer.identifier
    if share then
        identifier = share.owner
    end
    local success = true
    local vehicles = nil
    local result = CustomsSQL(Config.Mysql,'fetchAll','SELECT inventory FROM renzu_customs WHERE shop = @shop', {
        ['@shop'] = id
    })
    local inventory = json.decode(result[1].inventory) or {}
    if not save then
        local modname = mod.name..'-'..lvl
        if inventory[modname] == nil then
            inventory[modname] = 1
        else
            inventory[modname] = inventory[modname] + 1
        end
    end
    CustomsSQL(Config.Mysql,'execute','UPDATE renzu_customs SET inventory = @inventory WHERE shop = @shop', {
        ['@inventory'] = json.encode(inventory),
        ['@shop'] = id,
    })
    TriggerClientEvent('renzu_notify:Notify', src, 'success','Garage', 'You Successfully store the parts ('..mod.name..')')
end)

local default_routing = {}
local current_routing = {}

function Jobmoney(job,xPlayer)
    local value = -1
    local job = job
    local count = 0
    if Config.UseRenzu_jobs then
        CreateThread(function()
            value = exports.renzu_jobs:JobMoney(job).money
        end)
    else
        value = xPlayer.getMoney()
        -- your owned job money here
    end
    while value == -1 and count < 150 do count = count + 1 Wait(0) end
    return value
end

RegisterServerCallBack_('renzu_customs:pay', function (source, cb, t, shop, vclass)
    local src = source  
    local xPlayer = GetPlayerFromId(src)
    local identifier = xPlayer.identifier
    local prop = t.prop
    local cost = tonumber(t.cost)
    local jobmoney = 0
    if cost == 1 then
        cost = 0
        t.cost = 0
    end
    local vclass = tonumber(vclass)
    if not Config.FreeUpgradeToClass[vclass] and not Config.JobPermissionAll and xPlayer.getMoney() >= t.cost or not Config.FreeUpgradeToClass[vclass] and Config.JobPermissionAll and Config.Customs[shop].job == xPlayer.job.name and Jobmoney(xPlayer.job.name,xPlayer) >= t.cost then
       
       
        local result = CustomsSQL(Config.Mysql,'fetchAll','SELECT * FROM owned_vehicles WHERE UPPER(plate) = @plate', {
            ['@plate'] = prop.plate:upper()
        })
        if result[1] then
            CustomsSQL(Config.Mysql,'execute','UPDATE owned_vehicles SET `'..vehiclemod..'` = @'..vehiclemod..' WHERE UPPER(plate) = @plate', {
                ['@'..vehiclemod..''] = json.encode(prop),
                ['@plate'] = prop.plate:upper()
            })
            cb(true)
        elseif  result[1] == nil then
            
            local result2 = CustomsSQL(Config.Mysql,'fetchAll','SELECT * FROM owned_vehicles_mechanic WHERE UPPER(plate) = @plate', {
                ['@plate'] = prop.plate:upper()
            })
            if result2[1]  then
                CustomsSQL(Config.Mysql,'execute','UPDATE owned_vehicles_mechanic SET `'..vehiclemod..'` = @'..vehiclemod..' WHERE UPPER(plate) = @plate', {
                    ['@'..vehiclemod..''] = json.encode(prop),
                    ['@plate'] = prop.plate:upper()
                })
                cb(true)
            else
                cb(true)
            end
        else
            cb(true)       
        end
  
    else
        TriggerClientEvent('renzu_notify:Notify', src, 'error','Customs', 'Not Enough Money Cabron')
        cb(false)
    end
end)

RegisterServerCallBack_('renzu_customs:repair', function (source, cb, shop)
    local src = source  
    local xPlayer = GetPlayerFromId(src)
    local jobmoney = 0
 
        cb(true)
  
end)

local inshop = {}
RegisterServerCallBack_('renzu_customs:getmoney', function (source, cb, net, props)
    local src = source  
    local xPlayer = GetPlayerFromId(src)
    inshop[source] = {net = net , props = props}
   
    cb(0)
end)

RegisterServerEvent('playerDropped')
AddEventHandler('playerDropped', function(reason)
	for k,v in pairs(inshop) do
        if tonumber(source) == tonumber(k) then
            TriggerClientEvent('renzu_customs:restoremod',-1 , v.net, v.props)
            --DeleteEntity(v)
        end
    end
end)

RegisterServerEvent('renzu_customs:leaveshop')
AddEventHandler('renzu_customs:leaveshop', function()
	inshop[source] = nil
end)

function GetVehicleNetWorkIdByPlate(plate,source,dist)
    local source = source
    for k,v in ipairs(GetAllVehicles()) do
        if GetVehicleNumberPlateText(v) == plate and #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(v)) < 5 then -- support only near vehicle , means spawn and teleport the ped to vehicle seat
            return NetworkGetNetworkIdFromEntity(v)
        end
    end
    for k,v in ipairs(GetAllVehicles()) do
        if GetVehicleNumberPlateText(v) == plate then -- no range restriction if above loop does not find (but this does not support multiple duplicated plates in area)
            return NetworkGetNetworkIdFromEntity(v)
        end
    end
    return -1
end

RegisterServerEvent('renzu_customs:syncdel')
AddEventHandler('renzu_customs:syncdel', function(net)
    local source = source
    print(net)
    TriggerClientEvent('renzu_customs:syncdel',-1,net)
end)

local customengine = {}
RegisterServerEvent('renzu_customs:custom_engine')
AddEventHandler('renzu_customs:custom_engine', function(netid,plate,model)
    customengine[plate] = model
    local source = source
    if model == 'Default' then customengine[plate] = nil end
    Wait(1500) -- added wait for other garage script compatibility (setprop before ped is in vehicle)
    TriggerClientEvent('renzu_customs:receivenetworkid',-1,GetVehicleNetWorkIdByPlate(plate,source),model)
    SetResourceKvp('engine',json.encode(customengine))
end)

local customturbo = {}
RegisterServerEvent('renzu_customs:custom_turbo')
AddEventHandler('renzu_customs:custom_turbo', function(plate,turbo)
    customturbo[plate] = turbo
    if turbo == 'Default' then customturbo[plate] = nil end
    TriggerClientEvent('renzu_customs:receiveturboupgrade',-1,customturbo)
    SetResourceKvp('turbo',json.encode(customturbo))
end)

local customtire = {}
RegisterServerEvent('renzu_customs:custom_tire')
AddEventHandler('renzu_customs:custom_tire', function(plate,tire)
    customtire[plate] = tire
    local source = source
    if tire == 'Default' then customtire[plate] = nil end
    Wait(1500) -- added wait for other garage script compatibility (setprop before ped is in vehicle)
    TriggerClientEvent('renzu_customs:custom_tire',-1,customtire,GetVehicleNetWorkIdByPlate(plate,source),tire)
    SetResourceKvp('tire',json.encode(customtire))
end)

RegisterServerEvent('renzu_customs:soundsync')
AddEventHandler('renzu_customs:soundsync', function(table)
    TriggerClientEvent('renzu_customs:soundsync',-1,table)
end)

RegisterServerEvent('renzu_customs:loaded')
AddEventHandler('renzu_customs:loaded', function()
    local source = source
    TriggerClientEvent('renzu_customs:receivedata',source,customturbo,customengine,vehiclesname)
end)