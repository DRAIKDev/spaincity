local logs = "https://discord.com/api/webhooks/767291406280425493/L56EATdbhKC8uFFFZIWHAxehkKHdxAL8Mh0uM18dWpiquuCEcjt0URMhb1Hqhqj9NOPI"
local communityname = "Spaincity.ES"
local communtiylogo = "https://i.imgur.com/Lapqixi.jpg" --Must end with .png or .jpg


AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Jugador/a conectandose al servidor.",
            ["description"] = "Jugador: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Spaincity.ES Logs", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Jugador/a desconectandose del servidor.",
            ["description"] = "Jugador: **"..name.."** \nRazón: **"..reason.."**\nIP: **"..ip.."**\nPing: **"..ping.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Spaincity.ES Logs", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
