function WithoutObfuscation(x)
    return x
end

if not WithoutObfuscation(Config.CustomMenu) then
    Citizen.CreateThread(function()
        WithoutObfuscation(WarMenu).CreateMenu(
            'pool', 
            WithoutObfuscation(Config.Text.POOL),
            WithoutObfuscation(Config.Text.POOL_SUBMENU) or 'Select ball configuration'
        )
        
        WithoutObfuscation(WarMenu).SetSubTitle('pool', WithoutObfuscation(Config.Text.POOL_SUBMENU) or 'Select ball configuration')

        if WithoutObfuscation(Config.MenuColor) then
            WithoutObfuscation(WarMenu).SetTitleBackgroundColor('pool', WithoutObfuscation(Config.MenuColor)[1], WithoutObfuscation(Config.MenuColor)[2], WithoutObfuscation(Config.MenuColor)[3])
        end

        while true do
            if IsCloseToAnyTable then
                Wait(0)
            else
                Wait(2000)
            end

            if WithoutObfuscation(WarMenu).IsMenuOpened('pool') then
                if ClosestTableAddress then
                    if WithoutObfuscation(WarMenu).Button(WithoutObfuscation(Config.Text.TYPE_8_BALL)) then
                        TriggerEvent('rcore_pool:setupTable', 'BALL_SETUP_8_BALL')
                        WithoutObfuscation(WarMenu).CloseMenu()
                    elseif WithoutObfuscation(WarMenu).Button(WithoutObfuscation(Config.Text.TYPE_STRAIGHT)) then
                        TriggerEvent('rcore_pool:setupTable', 'BALL_SETUP_STRAIGHT_POOL')
                        WithoutObfuscation(WarMenu).CloseMenu()
                    end

                    WithoutObfuscation(WarMenu).Display()
                else
                    WithoutObfuscation(WarMenu).CloseMenu()
                end
            else
                Wait(200)
            end
        end
    end)
end

AddEventHandler('rcore_pool:openMenu', function()
    WithoutObfuscation(WarMenu).OpenMenu('pool')
end)

AddEventHandler('rcore_pool:closeMenu', function()
    -- triggered
end)

AddEventHandler('rcore_pool:setupTable', function(ballNumbers)
    local map = {
        ['BALL_SETUP_8_BALL'] = BALL_SETUP_8_BALL,
        ['BALL_SETUP_STRAIGHT_POOL'] = BALL_SETUP_STRAIGHT_POOL,
    }

    if ballNumbers == 'BALL_SETUP_8_BALL' or ballNumbers == 'BALL_SETUP_STRAIGHT_POOL' then
        local tableEntity = TableData[ClosestTableAddress].entity
        local data = setupBalls(tableEntity, map[ballNumbers])

        TriggerServerEvent('rcore_pool:setTableState', {
            tablePosition = GetEntityCoords(tableEntity),
            data = data,
        })
    else
        print("ERROR: Unknown ball configuration name. Supported names: BALL_SETUP_8_BALL, BALL_SETUP_STRAIGHT_POOL")
    end
end)