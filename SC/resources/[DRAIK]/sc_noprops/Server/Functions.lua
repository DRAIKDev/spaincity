function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

function messageIdentifiers(src, prop)
    local ids = ExtractIdentifiers(src)
    local message = '**Steam:** \n ``` '..ids.steam..' ``` \n **License:** \n ``` '..ids.license..' ``` \n **Discord: ** \n\n <@'..ids.discord:gsub("discord:", "")..'> \n\n **IP: **  \n ``` '..ids.ip..' ``` \n\n **PROP: ** \n ``` '..prop..' ``` '
    return message
end


function ScreenForUser(src,trigger, webhook, picture, name, prop, motive)
    local ids = ExtractIdentifiers(src)
    local mensaje = messageIdentifiers(src, prop)
    local src = src
    local webhook = webhook 
    local name = name 
    local picture = picture
	if Config.UseDiscordScreenshot then 
        print('foto?')
		exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(
			src, webhook,
			{encoding = "png", quality = 1}, {
				username = name,
				avatar_url = picture,
				content = "<@"..ids.discord:gsub("discord:", "").."> ["..trigger.."]",
				embeds = {
					{
						color = 16711680,
						author = {
							name = name,
							icon_url = picture
						},
						description = ""..mensaje.."",
						title = "User: "..GetPlayerName(src).." "
					}
				}
			}, function(error)
				if error then
					
				else
					DropPlayer(src, motive)
				end
		end)
	else
        SendRodaLog("User: "..GetPlayerName(src).."", 'red', mensaje, ConfigSv.Webhook)
        DropPlayer(src, motive)
	end
end