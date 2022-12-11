------------------------------
----------REGISTROS-----------
------------------------------
RegisterServerEvent("tm1_mafias:print")
RegisterServerEvent("tm1_mafias:advert")
RegisterServerEvent("tm1_mafias:groupcomprobate")
RegisterServerEvent("tm1_mafias:refreshMoney")
RegisterServerEvent("tm1_mafias:pendingGroup")
RegisterServerEvent("tm1_mafias:groupAccepted")
RegisterServerEvent("tm1_mafias:userRemoved")
RegisterServerEvent("tm1_mafias:promotesSystem")
RegisterServerEvent("tm1_mafias:RemoveGroup")
RegisterServerEvent("tm1_mafias:verifyGroup")
RegisterServerEvent("tm1_mafias:createGroup")
RegisterServerEvent("tm1_mafias:exitGroup")
RegisterServerEvent("tm1_mafias:enclosureComprobate")
RegisterServerEvent("tm1_mafias:getZoneWithin")
RegisterServerEvent("tm1_mafias:getZoneFinished")
RegisterServerEvent("tm1_mafias:buyWeapon")
RegisterServerEvent("tm1_mafias:refreshIsPosible")
RegisterServerEvent("tm1_mafias:addUser")
RegisterServerEvent("tm1_mafias:addShovel")
RegisterServerEvent("tm1_mafias:addlrhackItem")
RegisterServerEvent("tm1_mafias:breakShovel")
RegisterServerEvent("tm1_mafias:treatWeed")
RegisterServerEvent("tm1_mafias:sellWeed")
RegisterServerEvent("tm1_mafias:setGroup")
RegisterServerEvent("tm1_mafias:addLicense")
RegisterServerEvent("tm1_mafias:toClientEsposar")
RegisterServerEvent("tm1_mafias:givePiezes")
RegisterServerEvent("tm1_mafias:weaponSeller")
RegisterServerEvent("tm1_mafias:addlrhackMoney")
RegisterServerEvent("tm1_mafias:buySeed")
RegisterServerEvent("tm1_mafias:deleteSeed")
RegisterServerEvent("tm1_mafias:moneyComprobate")
RegisterServerEvent("tm1_mafias:combinateCoke")
RegisterServerEvent("tm1_mafias:sellCoke")
RegisterServerEvent("tm1_mafias:vuelvoadicto")
RegisterServerEvent("pop_university:setWeaponLicense")
RegisterServerEvent("tm1_mafias:retiroCoca")
RegisterServerEvent("tm1_mafias:combinateWeedCoke")
RegisterServerEvent("tm1_mafias:sellWeedCoke")
------------------------------
-----------EVENTOS------------
------------------------------
local playerGroups = {}
ESX = nil
local _source_ = nil
local members = {}
TriggerEvent(
    "esx:getSharedObject",
    function(obj)
        ESX = obj
    end
)

AddEventHandler(
    "tm1_mafias:print",
    function(text)
        print(text)
    end
)

AddEventHandler(
    "tm1_mafias:advert",
    function(text, sour)
        if sour == nil then
            TriggerClientEvent("esx:showNotification", source, text)
        else
            TriggerClientEvent("esx:showNotification", sour, text)
        end
    end
)

AddEventHandler(
    "tm1_mafias:setGroup",
    function(group)
        playerGroups[source] = group
    end
)

AddEventHandler(
    "tm1_mafias:groupcomprobate",
    function()
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local member =
                MySQL.Sync.fetchAll(
                "SELECT * FROM `tm1_membersgroups` WHERE `identifier` = @identifier",
                {
                    ["@identifier"] = xPlayer.identifier
                }
            )
            if member[1] then
                local group =
                    MySQL.Sync.fetchAll(
                    "SELECT * FROM `tm1_groups` WHERE `groupid` = @identifier",
                    {
                        ["@identifier"] = member[1].groupid
                    }
                )
                local enclosure =
                    MySQL.Sync.fetchAll(
                    "SELECT * FROM `tm1_enclosures` WHERE `groupid` = @identifier",
                    {
                        ["@identifier"] = member[1].groupid
                    }
                )
                if enclosure[1] then
                    enclosureName = enclosure[1].enclosure_name
                end
                TriggerClientEvent(
                    "tm1_mafias:groupcomprobated",
                    source,
                    1,
                    group[1].name,
                    group[1].money,
                    member[1].rank,
                    group[1].aprove,
                    member[1].groupid,
                    xPlayer.identifier,
                    source,
                    enclosureName,
                    group[1].armarios
                )
            else
                TriggerClientEvent("tm1_mafias:refreshedSteam", source, xPlayer.identifier, source)
            end
        end
    end
)
--[[
AddEventHandler(
    "tm1_mafias:refreshMoney",
    function(action, price)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local member =
                MySQL.Sync.fetchAll(
                "SELECT * FROM `tm1_membersgroups` WHERE `identifier` = @identifier",
                {
                    ["@identifier"] = xPlayer.getIdentifier()
                }
            )
            if member[1] then
                local group =
                    MySQL.Sync.fetchAll(
                    "SELECT * FROM `tm1_groups` WHERE `groupid` = @identifier",
                    {
                        ["@identifier"] = member[1].groupid
                    }
                )
                local money = 0
                if action == "put_100" then
                    if xPlayer.getMoney() >= price then
                        money = group[1].money + price
                        xPlayer.removeMoney(price)
                        MySQL.Async.execute(
                            "UPDATE tm1_groups SET money = @cantidad WHERE groupid = @identifier",
                            {["@identifier"] = member[1].groupid, ["@cantidad"] = money},
                            function(cb)
                            end
                        )
                        TriggerClientEvent("tm1_mafias:refreshedMoney", -1, member[1].groupid, money)
                    end
                elseif action == "remove_100" then
                    if group[1].money >= price then
                        money = group[1].money - price
                        xPlayer.addMoney(price)
                        MySQL.Async.execute(
                            "UPDATE tm1_groups SET money = @cantidad WHERE groupid = @identifier",
                            {["@identifier"] = member[1].groupid, ["@cantidad"] = money},
                            function(cb)
                            end
                        )
                        TriggerClientEvent("tm1_mafias:refreshedMoney", -1, member[1].groupid, money)
                    end
                end
            end
        end
    end
)]]

ESX.RegisterServerCallback(
    "tm1_mafias:requestPlayers",
    function(source, cb)
        local xPlayers = ESX.GetPlayers()
        local users = {}
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            users[i] = {label = xPlayer.name, value = xPlayers[i], identifier = xPlayer.identifier}
        end
        cb(users)
    end
)

AddEventHandler(
    "tm1_mafias:pendingGroup",
    function(iden, id)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local player = iden
        local member =
            MySQL.Sync.fetchAll("SELECT * FROM tm1_membersgroups WHERE identifier = @player", {[" @player"] = player})
        if not member[1] then
            TriggerClientEvent("tm1_mafias:acceptPending", id, xPlayer.getIdentifier())
        else
        end
    end
)

AddEventHandler(
    "tm1_mafias:groupAccepted",
    function(id)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local member1 =
            MySQL.Sync.fetchAll(
            "SELECT * FROM `tm1_membersgroups` WHERE `identifier` = @identifier",
            {
                ["@identifier"] = id
            }
        )
        local groupid = member1[1].groupid
        MySQL.Async.execute(
            "INSERT INTO tm1_membersgroups (`groupid`,`identifier`,`rank`) VALUES (@groupid,@identifier,@rank)",
            {groupid = groupid, identifier = xPlayer.getIdentifier(), rank = 1},
            function(cb)
            end
        )
        local group =
            MySQL.Sync.fetchAll(
            "SELECT * FROM `tm1_groups` WHERE `groupid` = @identifier",
            {
                ["@identifier"] = member1[1].groupid
            }
        )
        local enclosure =
            MySQL.Sync.fetchAll(
            "SELECT * FROM `tm1_enclosures` WHERE `groupid` = @identifier",
            {
                ["@identifier"] = member1[1].groupid
            }
        )
        local enclosureName = nil
        if enclosure[1] then
            enclosureName = enclosure[1].enclosure_name
        end
        TriggerClientEvent(
            "tm1_mafias:groupcomprobated",
            xPlayer.source,
            1,
            group[1].name,
            group[1].money,
            1,
            group[1].aprove,
            member1[1].groupid,
            xPlayer.getIdentifier(),
            xPlayer.source,
            enclosure,
            group[1].armarios
        )
    end
)

function getName(identifier)
    local user =
        MySQL.Sync.fetchAll(
        "SELECT * FROM `users` WHERE `identifier` = @identifier",
        {
            ["@identifier"] = identifier
        }
    )
    if user[1] then
        return user[1].name
    end
end

function getRank(identifier)
    local user =
        MySQL.Sync.fetchAll(
        "SELECT * FROM `tm1_membersgroups` WHERE `identifier` = @identifier",
        {
            ["@identifier"] = identifier
        }
    )
    if user[1] then
        return user[1].rank
    end
end

ESX.RegisterServerCallback(
    "tm1_mafias:requestGroupPlayers",
    function(source, cb)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local groupidCall =
            MySQL.Sync.fetchAll(
            "SELECT * FROM `tm1_membersgroups` WHERE `identifier` = @identifier",
            {
                ["@identifier"] = xPlayer.getIdentifier()
            }
        )
        local groupid = nil
        if groupidCall[1] then
            groupid = groupidCall[1].groupid
        end
        local member1 =
            MySQL.Sync.fetchAll(
            "SELECT * FROM `tm1_membersgroups` WHERE `groupid` = @identifier",
            {
                ["@identifier"] = groupid
            }
        )
        local users = {}
        for i, user in pairs(member1) do
            local name = getName(user.identifier)
            local rank = getRank(user.identifier)
            users[i] = {label = name, value = user.identifier, id = user.groupid, rango = rank}
        end
        cb(users)
    end
)

AddEventHandler(
    "tm1_mafias:userRemoved",
    function(id, groupid)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.execute(
            "DELETE from tm1_membersgroups WHERE identifier = @username",
            {["@username"] = id},
            function(cb)
            end
        )
        removegroup(groupid, "Fuck_This_Shit", id)
    end
)

AddEventHandler(
    "tm1_mafias:promotesSystem",
    function(groupid, rango, steamid, action)
        local xPlayer = ESX.GetPlayerFromId(source)
        if action == "promote" then
            if rango == 5 then
                removegroup(groupid)
            elseif rango < 5 then
                MySQL.Async.execute(
                    "UPDATE tm1_membersgroups SET rank = @cantidad WHERE identifier = @identifier",
                    {["@identifier"] = steamid, ["@cantidad"] = rango + 1},
                    function(cb)
                    end
                )
                removegroup(groupid)
            else
            end
        elseif action == "unpromote" then
            MySQL.Async.execute(
                "UPDATE tm1_membersgroups SET rank = @cantidad WHERE identifier = @identifier",
                {["@identifier"] = steamid, ["@cantidad"] = rango - 1},
                function(cb)
                end
            )
            removegroup(groupid)
        end
    end
)

AddEventHandler(
    "tm1_mafias:RemoveGroup",
    function(groupid, enclosure)
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.execute(
            "DELETE from tm1_membersgroups WHERE groupid = @groupid",
            {["@groupid"] = groupid},
            function(cb)
            end
        )
       --[[ MySQL.Async.execute(
            "DELETE from tm1_groups WHERE groupid = @groupid",
            {["@groupid"] = groupid},
            function(cb)
            end
        )
        if not (enclosure == nil) then
            MySQL.Async.execute(
                "DELETE from tm1_enclosures WHERE groupid = @groupid",
                {["@groupid"] = groupid},
                function(cb)
                end
            )
        end]]
        removegroup(groupid, "Fuck_This_Shit", "DFFDS54", enclosure)
    end
)

function removegroup(groupid, opc, id, playerid, encl)
    local grroup = groupid
    local pid = id
    Citizen.CreateThread(
        function()
            Citizen.Wait(1000)
            TriggerClientEvent("tm1_mafias:refreshedGroup", -1, groupid, opc, pid)
            if not (encl == nil) then
                TriggerClientEvent("tm1_mafias:puttedGroupsInEnclosures", -1)
            end
        end
    )
end

AddEventHandler(
    "tm1_mafias:verifyGroup",
    function(groupid)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local member =
            MySQL.Sync.fetchAll(
            "SELECT * FROM `tm1_membersgroups` WHERE `identifier` = @identifier",
            {
                ["@identifier"] = xPlayer.getIdentifier()
            }
        )
        if not member[1] then
            TriggerClientEvent("tm1_mafias:openCreator", source)
        else
            TriggerClientEvent("esx:showNotification", source, "Lo siento pero ya estás en un grupo")
        end
    end
)

AddEventHandler(
    "tm1_mafias:createGroup",
    function(name)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local groupName =
            MySQL.Sync.fetchAll(
            "SELECT * FROM `tm1_groups` WHERE `name` = @name",
            {
                ["@name"] = name
            }
        )
        if not groupName[1] then
            MySQL.Sync.execute(
                "INSERT INTO tm1_groups (name, aprove, money) VALUES (@name, @aprove, @money)",
                {
                    ["@name"] = name,
                    ["@aprove"] = 0,
                    ["@money"] = 1
                }
            )
            local group =
                MySQL.Sync.fetchAll(
                "SELECT * FROM `tm1_groups` WHERE `name` = @name",
                {
                    ["@name"] = name
                }
            )
            MySQL.Async.execute(
                "INSERT INTO tm1_membersgroups (`groupid`,`identifier`,`rank`) VALUES (@groupid,@identifier,@rank)",
                {groupid = group[1].groupid, identifier = xPlayer.getIdentifier(), rank = 5},
                function(cb)
                end
            )
            TriggerClientEvent(
                "tm1_mafias:groupcomprobated",
                xPlayer.source,
                1,
                group[1].name,
                group[1].money,
                5,
                group[1].aprove,
                group[1].groupid,
                xPlayer.getIdentifier(),
                xPlayer.source
            )
        else
            TriggerClientEvent("esx:showNotification", xPlayer.source, "Ya existe otro grupo con el mismo nombre.")
        end
    end
)

AddEventHandler(
    "tm1_mafias:exitGroup",
    function(groupid)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.execute(
            "DELETE from tm1_membersgroups WHERE identifier = @username",
            {["@username"] = xPlayer.getIdentifier()},
            function(cb)
            end
        )
        removegroup(groupid, "Fuck_This_Shit", xPlayer.getIdentifier())
    end
)

AddEventHandler(
    "tm1_mafias:enclosureComprobate",
    function(enclosuresNames)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local enclosures = MySQL.Sync.fetchAll("SELECT * FROM tm1_enclosures")
        local enclosuresInfo = {}
        for _, info in pairs(enclosures) do
            for info1, v in pairs(enclosuresNames) do
                if info.enclosure_name == v then
                    enclosuresInfo[_] = {name = info.enclosure_name, groupid = info.groupid}
                end
            end
        end
        TriggerClientEvent("tm1_mafias:putGroupsInEnclosures", source, enclosuresInfo)
    end
)

AddEventHandler(
    "tm1_mafias:getZoneFinished",
    function(name, groupid, option, gr)
        --print(gr)
        if option == "attackWithout" then
            --print(groupid)
            MySQL.Async.execute(
                "INSERT INTO tm1_enclosures (`enclosure_name`,`groupid`) VALUES (@enclosure_name,@groupid)",
                {enclosure_name = name, groupid = groupid},
                function(cb)
                end
            )
            refresh(groupid)
        elseif option == "attackWithout1" then
            Citizen.CreateThread(
                function()
                    MySQL.Async.execute(
                        "DELETE from tm1_enclosures WHERE groupid = @groupid",
                        {["@groupid"] = groupid},
                        function(cb)
                        end
                    )
                    Citizen.Wait(50)
                    MySQL.Async.execute(
                        "INSERT INTO tm1_enclosures (`enclosure_name`,`groupid`) VALUES (@enclosure_name,@groupid)",
                        {enclosure_name = name, groupid = groupid},
                        function(cb)
                        end
                    )
                    refresh(groupid)
                end
            )
        elseif option == "attackWithIn" then
            Citizen.CreateThread(
                function()
                    MySQL.Async.execute(
                        "DELETE from tm1_enclosures WHERE groupid = @groupid",
                        {["@groupid"] = gr},
                        function(cb)
                        end
                    )
                    Citizen.Wait(50)
                    MySQL.Async.execute(
                        "INSERT INTO tm1_enclosures (`enclosure_name`,`groupid`) VALUES (@enclosure_name,@groupid)",
                        {enclosure_name = name, groupid = gr},
                        function(cb)
                        end
                    )
                    refresh(groupid, gr)
                end
            )
        elseif option == "attackWithIn1" then
            Citizen.CreateThread(
                function()
                    MySQL.Async.execute(
                        "DELETE from tm1_enclosures WHERE groupid = @groupid",
                        {["@groupid"] = groupid},
                        function(cb)
                        end
                    )
                    Citizen.Wait(50)
                    MySQL.Async.execute(
                        "INSERT INTO tm1_enclosures (`enclosure_name`,`groupid`) VALUES (@enclosure_name,@groupid)",
                        {enclosure_name = name, groupid = gr},
                        function(cb)
                        end
                    )
                    refresh(groupid, gr)
                end
            )
        end
    end
)

function refresh(groupid, gr)
    Citizen.CreateThread(
        function()
            Citizen.Wait(1000)
            if gr == nil then
                TriggerClientEvent("tm1_mafias:puttedGroupsInEnclosures", -1)
                TriggerClientEvent("tm1_mafias:refreshedGroup", -1, groupid)
            else
                --print(gr..groupid)
                TriggerClientEvent("tm1_mafias:puttedGroupsInEnclosures", -1)
                TriggerClientEvent("tm1_mafias:refreshedGroup", -1, groupid, 1, 1, gr)
            end
        end
    )
end

AddEventHandler(
    "tm1_mafias:buyWeapon",
    function(itemName, price)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local money = xPlayer.getMoney()
        if money >= price then
            xPlayer.removeMoney(price)
            xPlayer.addWeapon(itemName, 42)
            TriggerClientEvent("esx:showNotification", _source, "Has comprado un " .. ESX.GetWeaponLabel(itemName))
        else
            TriggerClientEvent("esx:showNotification", _source, "No tienes suficiente dinero")
        end
    end
)

AddEventHandler(
    "tm1_mafias:refreshIsPosible",
    function(isPosible)
        TriggerClientEvent("tm1_mafias:changeIsPosible", -1, isPosible)
    end
)

AddEventHandler(
    "tm1_mafias:getZoneWithin",
    function(groupid, x, y, z, name, gro, groupToGroup)
        _source_ = source
        Citizen.CreateThread(
            function()
                TriggerClientEvent("tm1_mafias:contador", -1, groupid)
                Citizen.Wait(3000)
                local players = 0
                for i, v in pairs(members) do
                    players = players + 1
                end
                if players >= 3 then
                    local group = nil
                    for i, v in pairs(members) do
                        local sour = v.source
                        group = v.id
                        TriggerClientEvent("esx:showNotification", sour, "Están robando en tu recinto.")
                    end
                    if groupToGroup == nil then
                        TriggerClientEvent("tm1_mafias:activeAttack", _source_, x, y, z, name, gro, groupid, true)
                    else
                        TriggerClientEvent("tm1_mafias:activeAttack", _source_, x, y, z, name, gro, groupid, false)
                    end
                    _source_ = nil
                    members = {}
                else
                    TriggerClientEvent("esx:showNotification", _source_, "No hay suficientes enemigos disponibles.")
                    _source_ = nil
                    members = {}
                end
            end
        )
    end
)

AddEventHandler(
    "tm1_mafias:addUser",
    function(groupid)
        members[source] = {id = groupid, source = source}
    end
)

AddEventHandler(
    "tm1_mafias:addShovel",
    function(price)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem("shovel", 1)
            TriggerClientEvent(
                "esx:showNotification",
                source,
                "Te recomiendo que uses esta pala por los alrededores premoh."
            )
        else
            TriggerClientEvent("esx:showNotification", source, "No tienes suficiente dinero.")
        end
    end
)

ESX.RegisterUsableItem(
    "shovel",
    function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent("tm1_mafias:isInWeed", source)
    end
)

ESX.RegisterUsableItem(
    "coca",
    function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        --xPlayer.removeInventoryItem("coca",1)
        TriggerClientEvent("tm1_mafias:meDrogo", source, xPlayer.getInventoryItem("coca").count)
    end
)

AddEventHandler(
    "tm1_mafias:addlrhackItem",
    function(name, price)
        local xPlayer = ESX.GetPlayerFromId(source)
        if name == 'weed' or name == 'weed_pooch' or name == 'aditives' then
            if name == 'weed' then 
                if price < 4 then 
                    xPlayer.addInventoryItem(name, price)
                else
                    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Hacker tm1_mafias cantidad weed")
                end
            elseif name == 'weed_pooch' then
                if price < 4 then 
                    xPlayer.addInventoryItem(name, price)
                else
                    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Hacker tm1_mafias cantidad weed_pooch")
                end
            elseif name == 'aditives' then 
                if price == 110 then 
                    xPlayer.addInventoryItem(name, price)
                else
                    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Hacker tm1_mafias cantidad aditivos")
                end
            end
        else
            TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"Hacker tm1_mafias objetos")
        end
    end
)

AddEventHandler(
    "tm1_mafias:breakShovel",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local possibily = math.random(1, 100)
        if possibily > 10 and possibily < 30 then
            xPlayer.removeInventoryItem("shovel", 1)
        end
    end
)

function toint(n)
    local s = tostring(n)
    local i, j = s:find("%.")
    if i then
        return tonumber(s:sub(1, i - 1))
    else
        return n
    end
end
RegisterServerEvent('draikbandas:requestarrest')
AddEventHandler('draikbandas:requestarrest', function(token)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    
	local resource = GetCurrentResourceName()


	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
        
	end
	TriggerClientEvent('draikbandas:doarreste1d', _source)

end)
RegisterServerEvent('draikbandas:hathndcuff')
AddEventHandler('draikbandas:hathndcuff', function(target,token)
	local xPlayer = ESX.GetPlayerFromId(source)
	local resource = GetCurrentResourceName()
    if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerClientEvent('draikbandas:hathndcuff', target)
end)


AddEventHandler(
    "tm1_mafias:treatWeed",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local _source = source
        local weed = xPlayer.getInventoryItem("weed")
        if weed.count >= 3 then
            Citizen.CreateThread(
                function()
                    TriggerClientEvent(
                        "esx:showNotification",
                        _source,
                        "En un rato estara lista tu mierda arriba con los otros paquetes."
                    )
                    local quantity = toint(weed.count / 3, 0)
                    xPlayer.removeInventoryItem("weed", weed.count)
                    Citizen.Wait(25000)
                    TriggerClientEvent(
                        "esx:showNotification",
                        _source,
                        "Ve al sitio en el radar para recoger la marihuana."
                    )
                    TriggerClientEvent("tm1_mafias:getTreatmentWeed", _source, quantity)
                end
            )
        else
            TriggerClientEvent("esx:showNotification", source, "No tienes suficiente mercancia.")
        end
    end
)

AddEventHandler(
    "tm1_mafias:sellWeed",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local _source = source
        local weed = xPlayer.getInventoryItem("weed_pooch")
        if weed.count > 0 then
            local money = weed.count * 210
            -- TriggerEvent('exp:addExperience',weed.count * 4,_source)
            xPlayer.addAccountMoney("black_money", money)
            xPlayer.removeInventoryItem("weed_pooch", weed.count)
        else
            TriggerClientEvent("esx:showNotification", source, "No tienes nada para venderme")
        end
    end
)

AddEventHandler(
    "tm1_mafias:addLicense",
    function(type, precio)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= precio then
            TriggerEvent(
                "esx_license:addLicense",
                xPlayer.source,
                type,
                function()
                    TriggerEvent(
                        "esx_license:getLicenses",
                        xPlayer.source,
                        function(licenses)
                            TriggerClientEvent("esx:showNotification", xPlayer.source, "Has comprado la licencia")
                        end
                    )
                end
            )
            xPlayer.removeMoney(precio)
        else
            TriggerClientEvent("esx:showNotification", xPlayer.source, "No tienes tanto dinero para comprarla")
        end
    end
)

ESX.RegisterUsableItem(
    "grilletes",
    function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem("grilletes", 1)
        TriggerClientEvent("tm1_mafias:esposar", source, true)
    end
)

ESX.RegisterUsableItem(
    "keys",
    function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent("tm1_mafias:esposar", source, false)
    end
)

AddEventHandler(
    "tm1_mafias:toClientEsposar",
    function(source1, option)
        --print(option)
        TriggerClientEvent("tm1_mafias:changeEsposar", source1, option)
    end
)

AddEventHandler(
    "tm1_mafias:givePiezes",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local _source = source
        local piezes = xPlayer.getInventoryItem("weapon_shit")
        if piezes.count >= 1 then
            Citizen.CreateThread(
                function()
                    xPlayer.removeInventoryItem("weapon_shit", piezes.count)
                    local pieza = math.random(1, 3)
                    if pieza == 1 then
                        xPlayer.addInventoryItem("canion", piezes.count)
                    elseif pieza == 2 then
                        xPlayer.addInventoryItem("culett", piezes.count)
                    elseif pieza == 3 then
                        xPlayer.addInventoryItem("scope", piezes.count)
                    end
                end
            )
        else
            TriggerClientEvent("esx:showNotification", source, "No tienes suficiente mercancia.")
        end
    end
)

AddEventHandler(
    "tm1_mafias:weaponSeller",
    function(part, money)
        local xPlayer = ESX.GetPlayerFromId(source)
        local _source = source
        local piezes = xPlayer.getInventoryItem(part)
        if piezes.count >= 1 then
            xPlayer.removeInventoryItem(part, piezes.count)
            xPlayer.addMoney(money * piezes.count)
            TriggerEvent("exp:addExperience", piezes.count * 4, xPlayer.source)
        else
            TriggerClientEvent("esx:showNotification", xPlayer.source, "No tienes suficiente mercancia.")
        end
    end
)


--[[
AddEventHandler(
    "tm1_mafias:addlrhackMoney",
    function(money)
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addMoney((money))
    end
)
]]
AddEventHandler(
    "tm1_mafias:buySeed",
    function(seed, quantity, price)
        local xPlayer = ESX.GetPlayerFromId(source)
        local _source = source
        if xPlayer then
            if (price * quantity <= xPlayer.getMoney()) then
                xPlayer.removeMoney(price * quantity)
                xPlayer.addInventoryItem(seed, quantity)
            end
        end
    end
)

ESX.RegisterUsableItem(
    "cocaseed",
    function(source)
        TriggerClientEvent("tm1_farm:plant", source, "cocaseed")
    end
)

AddEventHandler(
    "tm1_mafias:moneyComprobate",
    function(money)
        local xPlayer = ESX.GetPlayerFromId(source)
        local money = money
        if xPlayer then
            local quantity = xPlayer.getInventoryItem("cocaplant")
            local _source = source
            if (money <= xPlayer.getMoney()) then
                if quantity.count > 0 then
                    xPlayer.removeMoney(money)
                    xPlayer.removeInventoryItem("cocaplant", quantity.count)
                    xPlayer.addInventoryItem("cocawithout", quantity.count)
                    TriggerClientEvent("esx:showNotification", xPlayer.source, "Gracias por el cambio.")
                else
                    TriggerClientEvent("esx:showNotification", xPlayer.source, "No tienes de eso hijo mio...")
                end
            else
                TriggerClientEvent("esx:showNotification", xPlayer.source, "No tienes suficiente dinero.")
            end
        end
    end
)

AddEventHandler(
    "tm1_mafias:combinateCoke",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local quantityCoke = xPlayer.getInventoryItem("cocawithout")
            local quantityAditives = xPlayer.getInventoryItem("aditives")
            if quantityCoke.count ~= 0 and quantityAditives.count ~= 0 then
                local minimun = 0
                if quantityCoke.count >= quantityAditives.count then
                    minimun = quantityAditives.count
                else
                    minimun = quantityCoke.count
                end
                xPlayer.removeInventoryItem("cocawithout", minimun)
                xPlayer.removeInventoryItem("aditives", minimun)
                xPlayer.addInventoryItem("coca", minimun)
                TriggerClientEvent("esx:showNotification", _source, "He procesado tu cocaina.")
            else
                TriggerClientEvent("esx:showNotification", _source, "Lo siento pero te falta mercancia.")
            end
        end
    end
)

AddEventHandler(
    "tm1_mafias:sellCoke",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local _source = source
            local weed = xPlayer.getInventoryItem("coca")
            if weed.count > 0 then
                local money = weed.count * 600
                TriggerEvent("exp:addExperience", weed.count * 6, _source)
                xPlayer.addAccountMoney("black_money", money)
                xPlayer.removeInventoryItem("coca", weed.count)
            else
                TriggerClientEvent("esx:showNotification", source, "No tienes nada para venderme")
            end
        end
    end
)

ESX.RegisterServerCallback(
    "tm1_mafias:addiction",
    function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local enganchado =
                MySQL.Sync.fetchAll(
                "SELECT * FROM `users` WHERE `identifier` = @identifier",
                {
                    ["@identifier"] = xPlayer.identifier
                }
            )
            if enganchado[1] then
                cb(enganchado[1].addicted)
            else
                cb(0)
            end
        end
    end
)

AddEventHandler(
    "tm1_mafias:vuelvoadicto",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            MySQL.Async.execute(
                "UPDATE users SET addicted = 1 WHERE identifier = @identifier",
                {["@identifier"] = xPlayer.identifier},
                function(cb)
                end
            )
        end
    end
)

AddEventHandler(
    "tm1_mafias:retiroCoca",
    function(count)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.removeInventoryItem("coca", count)
        end
    end
)

AddEventHandler(
    "tm1_mafias:combinateWeedCoke",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local quantityCoke = xPlayer.getInventoryItem("coca")
            local quantityWeed = xPlayer.getInventoryItem("weed_pooch")
            if quantityCoke.count ~= 0 and quantityWeed.count ~= 0 then
                local minimun = 0
                if quantityCoke.count >= quantityWeed.count then
                    minimun = quantityWeed.count
                else
                    minimun = quantityCoke.count
                end
                xPlayer.removeInventoryItem("coca", minimun)
                xPlayer.removeInventoryItem("weed_pooch", minimun)
                xPlayer.addInventoryItem("nevadito", minimun)
                TriggerClientEvent("esx:showNotification", _source, "Toma un par de nevaditos tete.")
            else
                TriggerClientEvent("esx:showNotification", _source, "Lo siento pero te falta mercancia.")
            end
        end
    end
)

AddEventHandler(
    "tm1_mafias:sellWeedCoke",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local _source = source
            local weed = xPlayer.getInventoryItem("nevadito")
            if weed.count > 0 then
                local money = weed.count * 950
                -- TriggerEvent('exp:addExperience',weed.count * 8,_source)
                xPlayer.addAccountMoney("black_money", money)
                xPlayer.removeInventoryItem("nevadito", weed.count)
            else
                TriggerClientEvent("esx:showNotification", source, "No tienes nada para venderme")
            end
        end
    end
)


ESX.RegisterServerCallback('Dk102:getOtherPlayerData', function(source, cb, target, notify)
	local xPlayer = ESX.GetPlayerFromId(target)
	local pName = GetPlayerName(source)
    local nametarget = GetPlayerName(target)


    logslegacy('**LOG:**\n\n **ACCIÓN:** BUSCAR A UNA PERSONA CON EL MENU DE BANDA\n **Argumento:** '..nametarget.. '\n**ID de steam:** '..pName..  '')	

	if notify then
		xPlayer.showNotification("Te estan cacheando")
	end

	if xPlayer then
		local data = {
			name = xPlayer.getName(),
			job = xPlayer.job.label,
			grade = xPlayer.job.grade_label,
			inventory = xPlayer.getInventory(),
			accounts = xPlayer.getAccounts(),
			weapons = xPlayer.getLoadout(),
            money = xPlayer.getMoney(),

		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = ESX.Math.Round(status.percent)
			end
		end)

	
			cb(data)
		
	end
end)
webhookUrl = 'https://discord.com/api/webhooks/911646690359017474/8bckgAcgrtAZWfL3vhEaVIcSiQ9WqA1qVtr04P1v00uhQBtyCf9bsfBNMfDNjeKJzfWh'

RegisterNetEvent('Dk102:confiscatePlayerItem')
AddEventHandler('Dk102:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
    local nametarget = GetPlayerName(target)

    local pName = GetPlayerName(source)

    logslegacy('**LOG:**\n\n **ACCIÓN:** QUITAR ITEM\n **Argumento:** '..itemName..'--'..itemType..'--'..amount..'\n**ID de steam:** '..pName..'-->'..nametarget..'')	

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
                end
			else
				sourceXPlayer.showNotification("Cantidad invalida")
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
end)



logslegacy = function(message)
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 
    'POST', json.encode(
        {username = "DRAIK ᵈᵉᵛ", 
        embeds = {
            {["color"] = 1127128, 
            ["author"] = {
            ["name"] = "TM1 Logs",
            ["icon_url"] = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"},
            ["description"] = "".. message .."",
            ["footer"] = {
            ["text"] = "DRAIK ᵈᵉᵛ - "..os.date("%x %X %p"),
            ["icon_url"] = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png",},}
        }, avatar_url = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"}), {['Content-Type'] = 'application/json' })
end























