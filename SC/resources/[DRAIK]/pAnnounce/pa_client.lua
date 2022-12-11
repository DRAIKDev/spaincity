local p = {} -- NO TOUCHY TOUCHY
-----------[ CONFIG ]---------------------------------------------------

-- Delay in minutes between messages
p.delay = 45


p.prefix = '^1^*[Discord Oficial SC] '
p.suffix = '^1'

p.messages = {   

    '^3discord.gg/spaincity',

}


--------------------------------------------------------------------------
-----[ CODE, DON'T TOUCH THIS ]-------------------------------------------
local playerIdentifiers

local timeout = p.delay * 1000 * 60 -- from ms, to sec, to min

RegisterNetEvent('pa:setPlayerIdentifiers')
AddEventHandler('pa:setPlayerIdentifiers', function(identifiers)
    playerIdentifiers = identifiers
end)
Citizen.CreateThread(function()
    while playerIdentifiers == {} or playerIdentifiers == nil do
        Citizen.Wait(1000)
        TriggerServerEvent('pa:getPlayerIdentifiers')
    end
    
        while true do
            for i in pairs(p.messages) do
                if true then
                    chat(i)
                    print('[SPAINCITY] discord.gg/spaincity ')
                end
                Citizen.Wait(timeout)
            end
            
            Citizen.Wait(0)
        end

end)
function chat(i)
    TriggerEvent('chatMessage', '', {255,255,255}, p.prefix .. p.messages[i] .. p.suffix)
end

--------------------------------------------------------------------------
