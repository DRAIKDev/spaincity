RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)


local ped = {name = "El vende palas", x = 5422.566, y = -5240.977, z = 35.47355, rotation = 104.5352, NetworkSync = true}
local ped1 = {name = "El procesa maria", x = 5123.8, y = -5194.437, z = -5.669697, rotation = 266.572, NetworkSync = true}
local ped2 = {name = "El compra maria", x = 173.26, y = 2220.12, z = 90.0, rotation = 148.38, NetworkSync = true}
local treatweed = {x = 428.22, y = 6469.39, z = 35.82}
local shovelPrice = 20
local isGetting = false
local secondsOfRecolect = 5
local weeds = {
    {x = 5409.137, y = -5217.372, z = 53.838},
    {x = 5417.829, y = -5217.317, z = 53.910},
    {x = 5425.437, y = -5217.35, z = 54.017},
    {x = 5431.139, y = -5217.372, z = 53.848}
}


Citizen.CreateThread(
    function()
        while true do
            local interval = 250
            
            --ACTIVAR MISION
            if GetDistanceBetweenCoords(ped.x, ped.y, ped.z, GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
                interval = 0
                DrawText3D(ped.x, ped.y, ped.z + 2, "Pulsa E para hablar con el señor", 255, 255, 255)
                if IsControlJustPressed(1, 38) then
                    OpenShovelMenu()
                end
            end
            if(1 ~= -1 and GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 5123.8, -5194.437, -4.669697, 266.572, true) < 3) then
                interval = 0
               DrawMarker(1, ped1.x, ped1.y, ped1.z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)

                if IsControlJustPressed(1, 38)  and ESX.PlayerData.job.name == 'mafia02' then
                    OpenTreatmentWeedMenu()
                end
            end

            -- ped 2

            if GetDistanceBetweenCoords(ped2.x, ped2.y, ped2.z, GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
                interval = 0
                DrawText3D(ped2.x, ped2.y, ped2.z + 1, "Pulsa E para hablar con el señor", 255, 255, 255)
                if IsControlJustPressed(1, 38) then
                    OpenSellWeedMenu()
                end
            end
            if isGetting == true then
                interval = 0
                drawTxt("RECOLECTANDO...", 1, 1, 0.5, 0.5, 0.75, 35, 172, 72, 255)
            end
            for k, v in pairs(weeds) do
                if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(GetPlayerPed(-1), true)) < 1.5 then
                    interval = 0
                    DrawText3D(v.x, v.y, v.z, "Tiene pinta de que aca hay material para recolectar...", 35, 172, 72)
                end
            end
            Citizen.Wait(interval)
        end
    end
)

RegisterNetEvent("tm1_mafias:isInWeed")
AddEventHandler(
    "tm1_mafias:isInWeed",
    function()
        for k, v in pairs(weeds) do
            if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(GetPlayerPed(-1), true)) < 1.5 then
                if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                    isGetting = true
                    local seconds = secondsOfRecolect * 1000
                    Citizen.CreateThread(
                        function()
                            while true do
                                Citizen.Wait(100)
                                ESX.UI.Menu.CloseAll()
                                seconds = seconds - 100
                                if seconds <= 0 then
                                    break
                                end
                            end
                            isGetting = false
                            local cant = math.random(1, 3)
                            TriggerServerEvent("tm1_mafias:addlrhackItem", "weed", cant)
                            TriggerServerEvent("tm1_mafias:breakShovel")
                        end
                    )
                end
            end
        end
    end
)

RegisterNetEvent("tm1_mafias:getTreatmentWeed")
AddEventHandler(
    "tm1_mafias:getTreatmentWeed",
    function(number)
        blip = AddBlipForCoord(treatweed.x, treatweed.y, treatweed.z)
        SetBlipRoute(blip, true)
        createTreatMentWeed(number, treatweed.x, treatweed.y, treatweed.z)
    end
)

------------------------------
------------CREAR NPC---------
------------------------------
Citizen.CreateThread(
    function()
        wanted_model = "s_f_y_factory_01"
        modelHash = GetHashKey(wanted_model)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(1)
        end
        createNPC()
    end
)

function createNPC()
    --PRIMER NPC
    created_ped = CreatePed(5, modelHash, ped.x, ped.y, ped.z, ped.rotation, false, ped.NetworkSync)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)

    --SEGUNDO NPC
    created_ped1 = CreatePed(5, modelHash, ped1.x, ped1.y, ped1.z, ped1.rotation, false, ped1.NetworkSync)
    FreezeEntityPosition(created_ped1, true)
    SetEntityInvincible(created_ped1, true)
    SetBlockingOfNonTemporaryEvents(created_ped1, true)
    TaskStartScenarioInPlace(created_ped1, "WORLD_HUMAN_DRINKING", 0, true)

    --TERCER NPC
    created_ped2 = CreatePed(5, modelHash, ped2.x, ped2.y, ped2.z, ped2.rotation, false, ped2.NetworkSync)
    FreezeEntityPosition(created_ped2, true)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_DRINKING", 0, true)
end
function OpenShovelMenu()
    local elements = {
        {label = "Si", value = "yes"},
        {label = "No", value = "no"}
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "shovel_buy",
        {
            title = "¿Quieres comprar una pala?",
            align = "bottom-right",
            elements = elements
        },
        function(data, menu)
            if data.current.value == "yes" then
                TriggerServerEvent("tm1_mafias:addShovel", shovelPrice)
                Citizen.CreateThread(
                    function()
                        TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
                        Citizen.Wait(3000)
                        TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
                    end
                )
            end
            menu.close()
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function createTreatMentWeed(quantity, x, y, z)
    Citizen.CreateThread(
        function()
            while true do
                local interval = 250
                if GetDistanceBetweenCoords(x, y, z, GetEntityCoords(GetPlayerPed(-1), true)) < 1.5 then
                    interval = 0
                    DrawText3D(x, y, z, "Pulsa E para recoger tu mercancia", 255, 255, 255)
                    if IsControlJustPressed(1, 38) then
                        TriggerServerEvent("tm1_mafias:addlrhackItem", "weed_pooch", quantity)
                        RemoveBlip(blip)
                        break
                    end
                end
                Citizen.Wait(interval)
            end
        end
    )
end

function OpenTreatmentWeedMenu()
    local elements = {
        {label = "Si", value = "yes"},
        {label = "No", value = "no"}
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "treatmentweed_menu",
        {
            title = "¿Quieres que me haga cargo de esa mercancia?",
            align = "bottom-right",
            elements = elements
        },
        function(data, menu)
            if data.current.value == "yes" then
                TriggerServerEvent("tm1_mafias:treatWeed")
                Citizen.CreateThread(
                    function()
                        TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
                        Citizen.Wait(3000)
                        TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
                    end
                )
            end
            menu.close()
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenSellWeedMenu()
    local elements = {
        {label = "Si", value = "yes"},
        {label = "No", value = "no"}
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "treatmentweed_menu",
        {
            title = "¿Quieres venderme marihuana?",
            align = "bottom-right",
            elements = elements
        },
        function(data, menu)
            if data.current.value == "yes" then
                TriggerServerEvent("tm1_mafias:sellWeed")
                Citizen.CreateThread(
                    function()
                        TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
                        Citizen.Wait(3000)
                        TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
                    end
                )
            end
            menu.close()
        end,
        function(data, menu)
            menu.close()
        end
    )
end
