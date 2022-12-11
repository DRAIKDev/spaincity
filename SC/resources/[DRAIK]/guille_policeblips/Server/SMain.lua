Refs = setmetatable({ }, Refs)

Refs.Blips = { }

CreateThread(function()
    if not ESX then return print("[guille_policeblips] ^1[ERROR] The resource cannot start due you do not use ESX legacy or you renamed ESX, rename it to 'es_extended'") end
    while true do 
        Wait(Cfg.RefreshRate)
        TriggerClientEvent("refs:client:receiveData", -1, Refs.Blips)
    end
end)

AddEventHandler("playerDropped", function()
    local src <const> = source
    TriggerClientEvent("refs:client:removeRef", -1, src)
    Refs.Blips[tonumber(src)] = nil
end)

local name = "[POLICEBLIPS]"

