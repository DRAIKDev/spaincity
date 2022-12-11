ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    -- while ESX.GetPlayerData().job == nil do Wait(0) end
    DoScreenFadeIn(0)
    for k, v in pairs(Config.Impounds) do
        addBlip(v.menu, 67, 47, Strings['impound_blip'])
    end
    for k, v in pairs(Config.Garage) do
        addBlip(v.coords, 50, 38, Strings['garage'])
    end
    for k, v in pairs(Config.Garage2) do
    end

    -- for k, v in pairs(AddonVehicles) do
    --     if type(v) == 'number' then
    --         AddTextEntryByHash(v, k)
    --     end
    -- end


    ------------------ MARKER SPAWNPOINT
    -- Citizen.CreateThread(function()
    --     while true do
    --         for k, v in pairs(Config.Garage) do
    --             local me = PlayerPedId()
    --             if GetDistanceBetweenCoords(GetEntityCoords(me), v.spawnpoint) <= 35.0 and not IsPedDeadOrDying(me, true) then
    --                 DrawMarker(27, v.spawnpoint-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 0.8), 255, 255, 25, 70, false, false, 2, false, false, false)
    --             end
    --         end
    --     end 
    -- end)

    ------------------- VER VEHICULOS
    Citizen.CreateThread(function()
        while true do
            local sleep = 100
            for k, v in pairs(Config.Garage) do
                local me = PlayerPedId()
                if GetDistanceBetweenCoords(GetEntityCoords(me), v.coords) <= 35.0 and not IsPedDeadOrDying(me, true) then
                    DrawMarker(27, v.coords-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 0.8), 255, 255, 25, 70, false, false, 2, false, false, false)
                    DrawMarker(1, v.spawnpoint-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 0.8), 76, 255, 51, 70, false, false, 2, false, false, false)
                    sleep = 0
                    if GetDistanceBetweenCoords(GetEntityCoords(me), v.coords) <= 1.8 and not IsPedDeadOrDying(me, true) then
                        if not IsPedInAnyVehicle(me, false) then
                            HelpText((Strings['enter_garage']):format('~INPUT_CONTEXT~'), true, -1)
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent('esx_garage:viewVehicles', v.spawnpoint, v.heading2, k)
                            end 
                        end
                    end
                end
            end
            for k, v in pairs(Config.Garage2) do
                local me = PlayerPedId()
                if GetDistanceBetweenCoords(GetEntityCoords(me), v.coords) <= 35.0 and not IsPedDeadOrDying(me, true) then
                    DrawMarker(27, v.coords-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 0.8), 255, 255, 25, 70, false, false, 2, false, false, false)
                    DrawMarker(1, v.spawnpoint-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 0.8), 76, 255, 51, 70, false, false, 2, false, false, false)
                    sleep = 0
                    if GetDistanceBetweenCoords(GetEntityCoords(me), v.coords) <= 1.8 and not IsPedDeadOrDying(me, true) then
                        if not IsPedInAnyVehicle(me, false) then
                            HelpText((Strings['enter_garage']):format('~INPUT_CONTEXT~'), true, -1)
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent('esx_garage:viewVehicles', v.spawnpoint, v.heading2, k)
                            end 
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
    -------------------- GUARDAR VEHICULOS
    Citizen.CreateThread(function()
        while true do
            local sleep = 50
            for k, v in pairs(Config.Garage) do
                local me = PlayerPedId()
                if GetDistanceBetweenCoords(GetEntityCoords(me), v.savepoint) <= 35.0 and not IsPedDeadOrDying(me, true) then
                    DrawMarker(1, v.savepoint-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 1.0), 255, 55, 25, 70, false, false, 2, false, false, false)
                    sleep = 0
                    if GetDistanceBetweenCoords(GetEntityCoords(me), v.savepoint) <= 1.8 and not IsPedDeadOrDying(me, true) then
                        if not IsPedInAnyVehicle(me, false) then
                            -- HelpText((Strings['enter_garage']):format('~INPUT_CONTEXT~'), true, -1)
                            -- if IsControlJustReleased(0, 38) then
                            --     TriggerServerEvent('esx_garage:viewVehicles', v.spawnpoint, v.heading2, k)
                        else
                            local vehicle = GetVehiclePedIsUsing(me)
                            if DoesEntityExist(vehicle) then
                                HelpText((Strings['store_garage']):format('~INPUT_CONTEXT~', GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))), true, -1)
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent('esx_garage:storeVehicle', k)   
                                end
                            end
                        end
                    end
                end
            end
            for k, v in pairs(Config.Garage2) do
                local me = PlayerPedId()
                if GetDistanceBetweenCoords(GetEntityCoords(me), v.savepoint) <= 35.0 and not IsPedDeadOrDying(me, true) then
                    DrawMarker(1, v.savepoint-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 1.0), 255, 55, 25, 70, false, false, 2, false, false, false)
                    sleep = 0
                    if GetDistanceBetweenCoords(GetEntityCoords(me), v.savepoint) <= 1.8 and not IsPedDeadOrDying(me, true) then
                        if not IsPedInAnyVehicle(me, false) then
                            -- HelpText((Strings['enter_garage']):format('~INPUT_CONTEXT~'), true, -1)
                            -- if IsControlJustReleased(0, 38) then
                            --     TriggerServerEvent('esx_garage:viewVehicles', v.spawnpoint, v.heading2, k)
                        else
                            local vehicle = GetVehiclePedIsUsing(me)
                            if DoesEntityExist(vehicle) then
                                HelpText((Strings['store_garage']):format('~INPUT_CONTEXT~', GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))), true, -1)
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent('esx_garage:storeVehicle', k)   
                                end
                            end
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
    ----------------
    Citizen.CreateThread(function()
        while true do
            local sleep = 100
            for k, v in pairs(Config.Impounds) do
                local me = PlayerPedId()
                if GetDistanceBetweenCoords(GetEntityCoords(me), v.menu) <= 15.0 then
                    DrawMarker(27, v.menu-vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(3.0, 3.0, 1.0), 255, 255, 25, 70, false, false, 2, false, false, false)
                        sleep = 0
                        if GetDistanceBetweenCoords(GetEntityCoords(me), v.menu) <= 2.5 then
                        HelpText(Strings['open_impound'], true, -1)
                        if IsControlJustReleased(0, 38) then
                            TriggerServerEvent('esx_garage:impound', v.vehicleSpawn)
                        end
                    end
                end
         
            end
            Wait(sleep)
        end
    end)
end)

RegisterNetEvent('esx_garage:storeVehicle')
AddEventHandler('esx_garage:storeVehicle', function(garage)
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
    local props = exports.renzu_customs:GetVehicleProperties(vehicle)
    print("ss"..GetVehicleNumberPlateText(vehicle).."sS")

    local damages = {['damaged_windows'] = {}, ['burst_tires'] = {}, ['broken_doors'] = {}, ['body_health'] = GetVehicleBodyHealth(vehicle), ['engine_health'] = GetVehicleEngineHealth(vehicle)}
    for i = 0, GetVehicleNumberOfWheels(vehicle) do
        if IsVehicleTyreBurst(vehicle, i, false) then table.insert(damages['burst_tires'], i) end 
    end
    for i = 0, 13 do
        if not IsVehicleWindowIntact(vehicle, i) then table.insert(damages['damaged_windows'], i) end
    end
    for i = 0, GetNumberOfVehicleDoors(vehicle) do 
        if IsVehicleDoorDamaged(vehicle, i) then table.insert(damages['broken_doors'], i) end 
    end

    TriggerServerEvent('esx_garage:storeVehicle', props, json.encode(damages), garage or 'custom')
end)

RegisterNetEvent('esx_garage:openImpound')
AddEventHandler('esx_garage:openImpound', function(vehicleSpawn, impounded)
    ESX.UI.Menu.CloseAll()
    local elements = {}
    for i = 1, #impounded do
        local label = (Strings['retrieve_impounded']):format(GetLabelText(GetDisplayNameFromVehicleModel(json.decode(impounded[i].vehicle).model)), impounded[i].plate, Config.ImpoundPrice)
        table.insert(elements, {label = label, value = impounded[i]})
    end
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'take_out',
    {
        title = Strings['impound'],
        align = 'right',
        elements = elements
    },
    function(data, menu)
        TriggerServerEvent('esx_garage:getImpounded', vehicleSpawn.coords, vehicleSpawn.heading, data.current.value)
        ESX.UI.Menu.CloseAll()
    end, 
        function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('esx_garage:stored')
AddEventHandler('esx_garage:stored', function()
    DoScreenFadeOut(750)
    while not IsScreenFadedOut() do 
        for i = 0, 255 do
            DisableAllControlActions(i)
        end
        Wait(0)
    end
    SetEntityAsMissionEntity(GetVehiclePedIsUsing(PlayerPedId()), true, true)
    DeleteVehicle(GetVehiclePedIsUsing(PlayerPedId()))
    Wait(2000)
    DoScreenFadeIn(1500) 
end)

RegisterNetEvent('esx_garage:spawnVehicle')
AddEventHandler('esx_garage:spawnVehicle', function(info, coords, heading)
    SetEntityVisible(PlayerPedId(), true, false)
    local model = json.decode(info.vehicle).model
    local custPrimaryColour = info.vehicle.rgb
	local custSecondaryColour = json.encode(info.vehicle).rgb2
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local car = CreateVehicle(model, coords, heading, true, false)
    exports.renzu_customs:SetVehicleProp2(car, json.decode(info.vehicle))
    setDamages(car, json.decode(info.damages))

    SetEntityAsMissionEntity(car, true, false)
    SetVehicleHasBeenOwnedByPlayer(car, true)
    SetVehicleNeedsToBeHotwired(car, false)
    SetModelAsNoLongerNeeded(model)
    SetVehicleNumberPlateText(car, info.plate)
    print("ss"..info.plate.."sS")

    SetVehRadioStation(car, 'OFF')
    TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
end)

RegisterNetEvent('esx_garage:view')
AddEventHandler('esx_garage:view', function(vehicles, coords, heading, garage)
    SetFollowPedCamViewMode(2)

    local firstVehicle = vehicles[1]

    local timer = GetGameTimer() + 1500 

    ESX.UI.Menu.CloseAll()
    local elements = {}
    for i = 1, #vehicles do
        if vehicles[i].state then
            if vehicles[i].garage == garage then
                table.insert(elements, {label = ('%s - %s'):format(GetLabelText(GetDisplayNameFromVehicleModel(json.decode(vehicles[i].vehicle).model)), vehicles[i].plate), value = i})
            else
                table.insert(elements, {label = ('%s - %s - %s'):format(GetLabelText(GetDisplayNameFromVehicleModel(json.decode(vehicles[i].vehicle).model)), vehicles[i].plate, ''..Config.GaragePrice..'€'), value = i})
            end
        else
            table.insert(elements, {label = ('%s - %s - %s'):format(GetLabelText(GetDisplayNameFromVehicleModel(json.decode(vehicles[i].vehicle).model)), vehicles[i].plate, Strings['impound']), value = i})
        end

    end
    local openMenu = function()
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'vehicles',
        {
            title = 'Garage',
            align = 'right',
            elements = elements
        },
        function(data, menu)
            local i = data.current.value 
            if vehicles[i].state then
                if vehicles[i].garage == garage then
                    ESX.UI.Menu.Open(
                        'default', GetCurrentResourceName(), 'take_out',
                    {
                        title = (Strings['take_out']):format(data.current.label),
                        align = 'right',
                        elements = {{label = Strings['yes'], value = 'y', vehicle = vehicles[i]}, {label = Strings['no'], value = 'n'}}
                    },
                    function(data2, menu2)
                        if data2.current.value == 'y' then
                            -- open = false
                            DoScreenFadeOut(450) 
                            ESX.UI.Menu.CloseAll()
                            Wait(500) 
                            TriggerServerEvent('esx_garage:takeOut', data2.current.vehicle, coords, heading)
                            Wait(500)
                            DoScreenFadeIn(450) 
                        else
                            menu2.close()
                        end
                    end, 
                        function(data2, menu2)
                        menu2.close()
                    end)
                else
                    ESX.UI.Menu.Open(
                        'default', GetCurrentResourceName(), 'take_out',
                    {
                        title = "Vas a pagar 300€ por traer tu vehiculo, estás de acuerdo?",
                        align = 'right',
                        elements = {{label = Strings['yes'], value = 'y', vehicle = vehicles[i]}, {label = Strings['no'], value = 'n'}}
                    },
                    function(data2, menu2)
                        if data2.current.value == 'y' then
                            DoScreenFadeOut(450) 
                            ESX.UI.Menu.CloseAll()
                            Wait(500) 
                            TriggerServerEvent('esx_garage:takeOutCash', data2.current.vehicle, coords, heading)
                            ESX.ShowNotification("Acabas de pagar 500€ por el traslado de tu coche a este garaje desde otro.")
                            ESX.GetPlayerData() 
                            Wait(500)
                            DoScreenFadeIn(450)
                        else
                            menu2.close()
                        end
                    end, 
                        function(data2, menu2)
                        menu2.close()
                    end)
                end
            end
        end,
            function(data, menu)
            menu.close()
        end)
    end
    DoScreenFadeIn(1500)
    openMenu()
    while open do
        Wait(0)
        SetVehicleEngineOn(vehicle, false, true)
        -- SetEntityVisible(PlayerPedId(), false, false)
        DisableControlAction(0, 75, true)
        DisableControlAction(27, 75, true)
        if not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'vehicles') and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'take_out') then
            openMenu()
        end
    end
    DeleteVehicle(vehicle)
    SetEntityVisible(PlayerPedId(), true, false)
    -- SetEntityCoords(PlayerPedId(), coords)
end)

setDamages = function(car, damages)
    for i = 0, 13 do
        if damages['damaged_windows'] then
            if damages['damaged_windows'][i] then
                SmashVehicleWindow(car, damages['damaged_windows'][i])
            end
        end
        if damages['burst_tires'] then
            if damages['burst_tires'][i] then
                SetVehicleTyreBurst(car, damages['burst_tires'][i], true, 1000.0)
            end
        end
        if damages['broken_doors'] then
            if damages['broken_doors'][i] then
                SetVehicleDoorBroken(car, damages['broken_doors'][i], true)
            end
        end
    end

    if damages['body_health'] then
        SetVehicleBodyHealth(car, damages['body_health'])
    end
    if damages['engine_health'] then
        SetVehicleEngineHealth(car, damages['engine_health'])
    end
end

HelpText = function(text, sound, duration)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(text) 
    EndTextCommandDisplayHelp(0, false, sound, duration)
end

addBlip = function(coords, sprite, color, text)
    local blip = AddBlipForCoord(coords)
	SetBlipSprite (blip, sprite)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.6)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end