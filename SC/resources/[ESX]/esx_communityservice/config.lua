Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 8

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x = 1680.689, y = 2513.624, z = 45.564}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 427.33, y = -979.51, z = 30.2}


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(1677.155, 2501.270, 45.564) },
	{ type = "cleaning", coords = vector3(1668.265, 2508.385, 45.564) },
	{ type = "cleaning", coords = vector3(1674.887, 2517.818, 45.564) },
	{ type = "cleaning", coords = vector3(1682.193, 2526.624, 45.564) },
	{ type = "cleaning", coords = vector3(1693.302, 2518.225, 45.564) },
	{ type = "cleaning", coords = vector3(1685.109, 2508.456, 45.564) },
	{ type = "gardening", coords = vector3(1699.836, 2519.715, 45.564) },
	{ type = "gardening", coords = vector3(1680.409, 2532.232, 45.564) },
	{ type = "gardening", coords = vector3(1677.824, 2541.081, 45.564) },
	{ type = "gardening", coords = vector3(1666.922, 2521.173, 45.564) },
	{ type = "gardening", coords = vector3(1659.331, 2509.817, 45.564) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 120,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
