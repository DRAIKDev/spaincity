local islandVec = vector3(4840.571, -5174.425, 2.0)
Citizen.CreateThread(function()
    while true do
        local pCoords = GetEntityCoords(GetPlayerPed(-1))
            local distance1 = #(pCoords - islandVec)
            if distance1 < 2000.0 then
            Citizen.InvokeNative("0x9A9D1BA639675CF1", "HeistIsland", true)  -- load the map and removes the city
            Citizen.InvokeNative("0x5E1460624D194A38", true) -- load the minimap/pause map and removes the city minimap/pause map
            else
            Citizen.InvokeNative("0x9A9D1BA639675CF1", "HeistIsland", false)
            Citizen.InvokeNative("0x5E1460624D194A38", false)
            end
        Citizen.Wait(5000)
    end
end)

--vehicle_generator "airtug" { -54.26639938354492, -1679.548828125, 28.4414, heading = 228.2736053466797 }
--spawnpoint 'a_m_y_hipster_01' { x = 389.11383056641, y = -356.06903076172, z = 48.023559570313 }
