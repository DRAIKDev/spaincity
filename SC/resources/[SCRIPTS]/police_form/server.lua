local DISCORD_WEBHOOK = "https://discordapp.com/api/webhooks/871021014052655104/e3qmqJAQYrz9mQrNvG9_aXecfuqiY1K4Qs9V9JoV-rP2BO5XSgZCFc1od-8iBJDUzsz7"
function ExtractIdentifiers()
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
            TriggerEvent("log", identifierDiscord)
        end
    end
end
    

RegisterServerEvent('log')
AddEventHandler('log', function(data)
        for k,v in pairs(GetPlayerIdentifiers(source))do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
              identifier = v
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
              license = v
            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
              xbl  = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
              playerip = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
              playerdiscord = v
              str = string.sub(v, 9)
            elseif string.sub(v, 1, string.len("live:")) == "live:" then
              liveid = v
            end
          end
        
          if playerip == nil then
            playerip = GetPlayerEndpoint(target)
            if playerip == nil then
              playerip = 'not found'
            end
          end
          if playerdiscord == nil then
            playerdiscord = 'not found'
          end
          if str == nil then
            str = "not found"
          end
          if liveid == nil then
            liveid = 'not found'
          end
          if xbl == nil then
            xbl = 'not found'
          end
    
    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Nuevo Formulariio | " ..data.plate.."-"..data.lastname,
            timestamp = os.date('!%Y-%m-%dT%H:%M:%S'),

            ["description"] = "Nombre: \n `"..data.plate.."` \n Apellido: \n `"..data.lastname.."` \n Edad: \n `"..data.age.."` \n Razón: \n`"..data.why.."`\n Género:\n `"..data.gender.."`".."\nDiscord:\n".."<@"..str..">",
	        ["footer"] = {
                ["text"] = "Formulario CNP",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "Formulario CNP",  avatar_url = "https://static.wikia.nocookie.net/gta/images/5/5e/Sceau-lspd-gtav.png/revision/latest?cb=20140916194909&path-prefix=fr",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)



RegisterServerEvent('log2')
AddEventHandler('log2', function(data)

    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
          identifier = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
          xbl  = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          playerip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          playerdiscord = v
          str = string.sub(v, 9)
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
          liveid = v
        end
      end
    
      if playerip == nil then
        playerip = GetPlayerEndpoint(target)
        if playerip == nil then
          playerip = 'No encontrada'
        end
      end
      if playerdiscord == nil then
        playerdiscord = 'No encontrado'
      end
      if str == nil then
        str = "No encontrado"
      end
      if liveid == nil then
        liveid = 'No encontrado'
      end
      if xbl == nil then
        xbl = 'No encontrado'
      end

    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Nueva Denuncia | " ..data.ft.."-"..data.ln,
            ["description"] = "Nombre: \n `"..data.ft.."` \n Apellido: \n `"..data.ln.."`\n Razon: \n `"..data.reason.."`".."\n Fecha: \n `"..data.date.."`".."\n Discord:\n".."<@"..str..">",
	        ["footer"] = {
                ["text"] = "Denuncia",
            },
            image = {
                url = data.myImg
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "Ordenador CNP",  avatar_url = "https://i.pinimg.com/originals/86/87/19/868719b1db3829d6a68f81c639f4a5f3.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)


