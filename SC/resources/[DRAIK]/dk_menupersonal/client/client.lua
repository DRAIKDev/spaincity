ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end 
end)
local modofps1 = false
local modofps2 = false
local modofps3 = false
local modocine = false
RegisterKeyMapping(Config.Command, "SpainCity Personal Menu", 'keyboard', 'F4')
RegisterCommand(Config.Command, function()
    TriggerServerEvent('HSDBAJKDBAKBDJKABSKDBAKDHNUI126789UYGHU76TYI87YHI7YHJ9')
end, false)

RegisterNetEvent("AbrirMenuPersonalSpainCity")
AddEventHandler("AbrirMenuPersonalSpainCity", function(dineroenmano,dineroenbanco,dieneronegro,jobnamelabel,jobnameranklabel,jobnamesalary,nombrepj,alerta)
	


 local elements = {}
 --source
 table.insert(elements,{label = '<b><span style="color: white;">TU ID : <span style="color: PaleGreen;">'..GetPlayerServerId(PlayerId())..'</span></span></b>', value = 'titulo'})
 table.insert(elements,{label = '<b><span style="color: white;">TU NOMBRE : <span style="color: Tomato;">'..nombrepj..'</span></span></b>', value = 'nombre'  })
-- table.insert(elements,{label = '<b><span style="color: white;">Jugadores : <span style="color: YELLOW;">'..numplayers..'</span></span></b>', value = 'numplaters'  })
if alerta == 0 then
    table.insert(elements,{label = '<b><span style="color: white;">NIVEL DE ALERTA : <span style="color: CornflowerBlue;">0</span></span></b>', value = 'titulo'})

elseif alerta == 1 then
    table.insert(elements,{label = '<b><span style="color: white;">NIVEL DE ALERTA : <span style="color: DarkSeaGreen;">1</span></span></b>', value = 'titulo'})

elseif alerta == 2 then
    table.insert(elements,{label = '<b><span style="color: white;">NIVEL DE ALERTA : <span style="color: DarkGreen;">2</span></span></b>', value = 'titulo'})

elseif alerta == 3 then
    table.insert(elements,{label = '<b><span style="color: white;">NIVEL DE ALERTA : <span style="color: DarkOrange;">3</span></span></b>', value = 'titulo'})

elseif alerta == 4 then
    table.insert(elements,{label = '<b><span style="color: white;">NIVEL DE ALERTA : <span style="color: Crimson;">4</span></span></b>', value = 'titulo'})

elseif alerta == 5 then
    table.insert(elements,{label = '<b><span style="color: white;">NIVEL DE ALERTA : <span style="color: Red;">5</span></span></b>', value = 'titulo'})

end
        table.insert(elements,{label = '---------'})
        table.insert(elements,{label = '<b><span style="color: white;">EFECTIVO : <span style="color: YellowGreen;">'..dineroenmano..'</span></span></b>', value = 'numplaters'  })
        table.insert(elements,{label = '<b><span style="color: white;">DINERO : <span style="color: YellowGreen;">'..dineroenbanco.money..'</span></span></b>', value = 'numplaters'  })        
        if not(dieneronegro.money == 0) then
            table.insert(elements,{label = '<b><span style="color: white;">Dinero Sucio : <span style="color: YellowGreen;">'..dieneronegro.money..'</span></span></b>', value = 'numplaters'  })
        end
        table.insert(elements,{label = '---------------'})

        table.insert(elements,{label = '<b><span style="color: white;">TRABAJO : <span style="color: SteelBlue;">'..jobnamelabel..'</span></span></b>', value = 'info1'})
        table.insert(elements,{label = '<b><span style="color: white;">TRABAJO : <span style="color: SteelBlue;">'..jobnameranklabel..'</span></span></b>', value = 'info2'})
        table.insert(elements,{label = '<b><span style="color: white;">SALARIO : <span style="color: SteelBlue;">'..jobnamesalary..'</span></span></b>', value = 'info3'})
        table.insert(elements,{label = '---------------'})


        if not(modofps1) then 
            table.insert(elements,{label = '<b><span style="color: white;">MODO FPS1: <span style="color: DarkRed;">OFF</span></span></b>', value = 'fps1off'})
        else 
            table.insert(elements,{label = '<b><span style="color: white;">MODO FPS1: <span style="color: Chartreuse;">ON</span></span></b>', value = 'fps1on'})
        end
        if not(modofps2) then 
            table.insert(elements,{label = '<b><span style="color: white;">MODO FPS2: <span style="color: DarkRed;">OFF</span></span></b>', value = 'fps2off'})
        else 
            table.insert(elements,{label = '<b><span style="color: white;">MODO FPS2: <span style="color: Chartreuse;">ON</span></span></b>', value = 'fps2on'})
        end
        if not(modofps3) then 
            table.insert(elements,{label = '<b><span style="color: white;">MODO FPS3: <span style="color: DarkRed;">OFF</span></span></b>', value = 'fps3off'})
        else 
            table.insert(elements,{label = '<b><span style="color: white;">MODO FPS3: <span style="color: Chartreuse;">ON</span></span></b>', value = 'fps3on'})
        end
        if not(modocine) then 
            table.insert(elements,{label = '<b><span style="color: white;">MODO CINE: <span style="color: DarkRed;">OFF</span></span></b>', value = 'cineoff'})
        else 
            table.insert(elements,{label = '<b><span style="color: white;">MODO CINE: <span style="color: Chartreuse;">ON</span></span></b>', value = 'cineon'})
        end

        table.insert(elements,{label = '---------------'})

        table.insert(elements,{label = '<b><span style="color: white;">ACCION : <span style="color: Salmon;">CERRAR</span></span></b>', value = 'close'})
        ESX.UI.Menu.CloseAll()
    
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'MENU',
            {
                title  = '<b><span style="color: BurlyWood;">MENU PERSONAL</span></b>',
                align    = 'bottom-right',
                elements = elements
            },
            function(data, menu)
                
                if data.current.value == "fps1off" then
                    SetTimecycleModifier('yell_tunnel_nodirect')
                    modofps1 = true

                    menu.close()
                    ExecuteCommand(Config.Command)
                elseif data.current.value == "fps1on"  then
                    SetTimecycleModifier()
                    ClearTimecycleModifier()
                    ClearExtraTimecycleModifier() 
                    modofps1 = false
                  
                    menu.close()
                    ExecuteCommand(Config.Command)
                elseif data.current.value == "fps2off"  then
                    SetTimecycleModifier('tunnel') 
                    modofps2 = true

                    menu.close()
                    ExecuteCommand(Config.Command)

                elseif data.current.value == "fps2on"  then
                    SetTimecycleModifier()
                    ClearTimecycleModifier()
                    ClearExtraTimecycleModifier()
                    modofps2 = false

                    menu.close()
                    ExecuteCommand(Config.Command)

                elseif data.current.value == "fps3off"  then
                    SetTimecycleModifier('MP_Powerplay_blend')
                    SetExtraTimecycleModifier('reflection_correct_ambient')
                    modofps3 = true

                    menu.close()
                    ExecuteCommand(Config.Command)

                elseif data.current.value == "fps3on"  then
                    SetTimecycleModifier()
                    ClearTimecycleModifier()
                    ClearExtraTimecycleModifier()
                    modofps3 = false
                    menu.close()
                    ExecuteCommand(Config.Command)

                elseif data.current.value == "cineoff"  then
                    SendNUIMessage({ponerbarras = true})
                    modocine = true
                    menu.close()
                    ExecuteCommand(Config.Command)
                elseif data.current.value == "cineon"  then
                    SendNUIMessage({quitarbarras = true})

                    modocine = false
                    menu.close()
                    ExecuteCommand(Config.Command)
                elseif data.current.value == "close" then
                    menu.close()
                end
            end,
            function(data, menu)
                menu.close()
            end)

end)



RegisterNetEvent('HGSBNDN9876RFGHJI765RFGHJUYTR')
AddEventHandler('HGSBNDN9876RFGHJI765RFGHJUYTR', function()
    OpenMenuPolice()
end)


function OpenMenuPolice()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'alerts', {
    title    = '<b><span style="color: tomato;">MENU DE ALERTAS CNP</span></b>',
    align    = 'top-right',
    elements = {
      {label = "Nivel 0",     value = '0'},
      {label = "Nivel 1",     value = '1'},
      {label = "Nivel 2", value = '2'},
      {label = "Nivel 3", value = '3'},
      {label = "Nivel 4", value = '4'},
      {label = "Nivel 5", value = '5'}
  }}, function(data, menu)
    if data.current.value == '0' then
      TriggerServerEvent("draik_alerts:ponernivel",data.current.value)

    elseif data.current.value == '1' then
        TriggerServerEvent("draik_alerts:ponernivel",data.current.value)

    elseif data.current.value == '2' then
        TriggerServerEvent("draik_alerts:ponernivel",data.current.value)

      
    elseif data.current.value == '3' then
        TriggerServerEvent("draik_alerts:ponernivel",data.current.value)
    elseif data.current.value == '4' then
        TriggerServerEvent("draik_alerts:ponernivel",data.current.value)
    elseif data.current.value == '5' then
        TriggerServerEvent("draik_alerts:ponernivel",data.current.value)
    end
    menu.close()
  end, function(data, menu)
    menu.close()
  end)
end