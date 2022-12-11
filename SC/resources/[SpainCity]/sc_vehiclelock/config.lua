Config = {}

Config.VehicleMenu = true -- enable this if you wan't a vehicle menu.
Config.VehicleMenuButton = 303 -- change this to the key you want to open the menu with. buttons: https://docs.fivem.net/game-references/controls/
Config.RangeCheck = 25.0 -- this is the change you will be able to control the vehicle.

-- Config.Garages = {
--     ["A"] = {
--         ["positions"] = {
--             ["menu"] = {
--                 ["position"] = vector3(273.67422485352, -344.15573120117, 44.919834136963)
--             },
--             ["vehicle"] = {
--                 ["position"] = vector3(272.50082397461, -337.40579223633, 44.919834136963), 
--                 ["heading"] = 160.0
--             }
--         },
--         ["camera"] = { 
--             ["x"] = 283.28225708008, 
--             ["y"] = -333.24017333984, 
--             ["z"] = 50.004745483398, 
--             ["rotationX"] = -21.637795701623, 
--             ["rotationY"] = 0.0, 
--             ["rotationZ"] = 125.73228356242 
--         }
--     },
--     ["B"] = {
--         ["positions"] = {
--             ["menu"] = {
--                 ["position"] = vector3(-796.48968505859, -2023.3764648438, 9.1683320999146)
--             },
--             ["vehicle"] = {
--                 ["position"] = vector3(-776.12188720703, -2024.51953125, 8.8724946975708), 
--                 ["heading"] = 218.09
--             }
--         },
--         ["camera"] = {  -- camera is not needed just if you want cool effects.
--             ["x"] = -779.10546875, 
--             ["y"] = -2042.7177734375, 
--             ["z"] = 11.88006401062, 
--             ["rotationX"] = -25.941574149728, 
--             ["rotationY"] = 0.0, 
--             ["rotationZ"] = -4.84 
--         }
--     },

--     ["C"] = {
--         ["positions"] = {
--             ["menu"] = {
--                 ["position"] = vector3(1737.5509033203, 3711.140625, 34.131916046143)
--             },
--             ["vehicle"] = {
--                 ["position"] = vector3(1728.7093505859, 3713.8803710938, 34.178329467773), 
--                 ["heading"] = 24.23
--             }
--         },
--         ["camera"] = {  -- camera is not needed just if you want cool effects.
--             ["x"] = 1720.4931640625, 
--             ["y"] = 3716.8557128906, 
--             ["z"] = 36.169788360596, 
--             ["rotationX"] = -25.941574149728, 
--             ["rotationY"] = 0.0, 
--             ["rotationZ"] = 247.0 
--         }
--     },

--     ["D"] = {
--         ["positions"] = {
--             ["menu"] = {
--                 ["position"] = vector3(105.25187683105, 6613.7915039063, 32.397304534912)
--             },
--             ["vehicle"] = {
--                 ["position"] = vector3(117.31244659424, 6599.5498046875, 32.010261535645), 
--                 ["heading"] = 268.54
--             }
--         },
--         ["camera"] = {  -- camera is not needed just if you want cool effects.
--             ["x"] = 129.04795837402, 
--             ["y"] = 6608.5385742188, 
--             ["z"] = 34.846836090088, 
--             ["rotationX"] = -25.941574149728, 
--             ["rotationY"] = 0.0, 
--             ["rotationZ"] = 115.11 
--         }
--     },

--     ["E"] = {
--         ["positions"] = {
--             ["menu"] = {
--                 ["position"] = vector3(-1803.8967285156, -341.45928955078, 43.986347198486)
--             },
--             ["vehicle"] = {
--                 ["position"] = vector3(-1810.7857666016, -337.13592529297, 43.552074432373), 
--                 ["heading"] = 320.0
--             }
--         },
--         ["camera"] = { 
--             ["x"] = -1813.5513916016, 
--             ["y"] = -340.40087890625, 
--             ["z"] = 46.962894439697, 
--             ["rotationX"] = -39.496062710881, 
--             ["rotationY"] = 0.0, 
--             ["rotationZ"] = -42.110235854983 
--         }
--     }
-- }

Config.Labels = {
    ["menu"] = "~INPUT_CONTEXT~ Atver gar&#227;&#382;u %s.",
    ["vehicle"] = "~INPUT_CONTEXT~ Ievieto '%s' atpakal gar&#227;&#382;&#227;."
}

Config.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

Config.AlignMenu = "right" -- this is where the menu is located [left, right, center, top-right, top-left etc.]