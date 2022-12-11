local banco = 2500000
local mano = 600000

RegisterCommand("checkmoney", function(src, args)
    if src == 0 then
        MySQL.Async.fetchAll('SELECT * FROM users', {},
        function(dinerito)
            print("^1[^1Spain^3City^1] ^2Jugadores con mas dinero arriba de ^82.5 millones ^2en banco y ^8600 mil ^2en mano ^0")
            for i = 1, #dinerito, 1 do
                local accounts = json.decode(dinerito[i].accounts)
                local connected = dinerito[i].conectado
                local id = dinerito[i].id
                if accounts then
                    if accounts["bank"] ~= nil then
                        dinerito[i].bank = accounts["bank"]
                    else
                        dinerito[i].bank = "ERROR"
                    end

                    if accounts["money"] ~= nil then
                        dinerito[i].money = accounts["money"]
                    else
                        dinerito[i].money = "ERROR"
                    end

                    if dinerito[i].name == nil then
                    else
                        if tonumber(dinerito[i].bank) ~= nil and tonumber(dinerito[i].money) ~= nil then
                            if tonumber(dinerito[i].bank) >= banco or tonumber(dinerito[i].money) >= mano then
                                if connected then
                                    print("^0[^2ONLINE (" .. id  ..")^0]" .." ^8" ..dinerito[i].name .."^3 Tiene este dinero: -> [Banco] = ^1"..dinerito[i].bank.."^3 [En Mano] = ^1"..dinerito[i].money)
                                else
                                    print("^0[^1OFFLINE^0]" .." ^8" ..dinerito[i].name .."^3 Tiene este dinero: -> [Banco] = ^1"..dinerito[i].bank.."^3 [En Mano] = ^1"..dinerito[i].money)
                                end
                            end
                        end
                    end
                end
            end
            print("Finalizada la busqueda entre " .. #dinerito .. " usuarioos")
        end)
    end
end, true)

RegisterCommand("checkmoneyv2", function(src, args)
    if src == 0 then
        MySQL.Async.fetchAll('SELECT * FROM users', {},
        function(dinerito)
            print("^1[^1Spain^3City^1]")
            for i = 1, #dinerito, 1 do
                local accounts = json.decode(dinerito[i].accounts)
                if accounts then
                    if accounts["bank"] ~= nil then
                        dinerito[i].bank = accounts["bank"]
                    else
                        dinerito[i].bank = "ERROR"
                    end

                    if accounts["money"] ~= nil then
                        dinerito[i].money = accounts["money"]
                    else
                        dinerito[i].money = "ERROR"
                    end

                    if dinerito[i].name == nil then
                    else
                        if tonumber(dinerito[i].bank) ~= nil and tonumber(dinerito[i].money) ~= nil then
                            if tonumber(dinerito[i].bank) < -1000  then
                                
                                print("^0[^3SC BANCO^0]" .." ^8" ..dinerito[i].name .."^3 Tiene este dinero: -> [Banco] = ^1"..dinerito[i].bank.."^3 [En Mano] = ^1"..dinerito[i].money)

                            end
                        end
                    end
                end
            end
            print("Finalizada la busqueda entre " .. #dinerito .. " usuarios")
        end)
    end
end, true)
RegisterCommand("checkmoneyv3", function(src, args)
    if src == 0 then
        MySQL.Async.fetchAll('SELECT * FROM users', {},
        function(dinerito)
            print("^1[^1Spain^3City^1]")
            for i = 1, #dinerito, 1 do
                local accounts = json.decode(dinerito[i].accounts)
                if accounts then
                    if accounts["black_money"] ~= nil then
                        dinerito[i].black_money = accounts["black_money"]
                    else
                        dinerito[i].black_money = 0
                    end


                    
                       
                            if tonumber(dinerito[i].black_money) < -1 then
                                
                                print("^0[^3SC BANCO^0]" .." ^8" ..dinerito[i].name .."^3 Tiene este dinero: -> [black_money] = ^1"..dinerito[i].black_money.."")
                        
                            end
                        
                    
                end
            end
            print("Finalizada la busqueda entre " .. #dinerito .. " usuarios")
        end)
    end
end, true)


RegisterCommand("checkmoneyv4", function(src, args)
    if src == 0 then
        MySQL.Async.fetchAll('SELECT * FROM users', {},
        function(dinerito)
            print("^1[^1Spain^3City^1]")
            for i = 1, #dinerito, 1 do
                local accounts = json.decode(dinerito[i].accounts)
                if accounts then
                    if accounts["black_money"] ~= nil then
                        dinerito[i].black_money = accounts["black_money"]
                    else
                        dinerito[i].black_money = 0
                    end
                        if tonumber(dinerito[i].black_money) < 300000 then
                            print("^0[^3SC BANCO^0]" .." ^8" ..dinerito[i].name .."^3 Tiene este dinero: -> [black_money] = ^1"..dinerito[i].black_money.."")    
                        end
                end
            end
            print("Finalizada la busqueda entre " .. #dinerito .. " usuarios")
        end)
    end
end, true)
