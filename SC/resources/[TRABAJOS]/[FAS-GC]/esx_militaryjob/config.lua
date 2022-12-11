Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How much people can be in service at once?

Config.Locale                     = 'es'

Config.militaryStations = {

	FAS = {

		Blip = {
			Coords  = vector3(1858.414, 3677.656, 33.698),
			Sprite  = 188,
			Display = 4,
			Scale   = 1.5,
			Colour  = 25
		},

		Cloakrooms = {
			vector3(-2358.56, 3254.042, 32.810),--BASE MILITAR
			vector3(422.9275, 4811.039, -58.99),--SERVICIO SECRETO
			vector3(-454.701, 6016.101, 31.716), --Cuartel Paleto Bay
			vector3(1849.172, 3695.342, 34.270)--CUARTEL SANDY
		},

		Armories = {
			vector3(-2355.63, 3258.781, 92.903),--BASE MILITAR
			vector3(417.1754, 4809.834, -58.99),--SERVICIO SECRETO
			vector3(-435.265, 5999.120, 31.716), -- Cuartel Paleto Bay
			vector3(1860.901, 3689.016, 34.270)--CUARTEL SANDY
		},

		Vehicles = {
			-- {
			-- 	Spawner = vector3(-2325.82, 3259.836, 32.827),
			-- 	InsideShop = vector3(-2263.12, 3223.164, 32.810),
			-- 	SpawnPoints = {
			-- 		{coords = vector3(-2323.38, 3274.062, 32.827), heading = 330.0, radius = 10.0},
			-- 		{coords = vector3(-2331.84, 3258.216, 32.827), heading = 330.0, radius = 10.0}
			-- 	}
			-- }
		},

		Helicopters = {
			-- {
			-- 	Spawner = vector3(-2117.80, 3266.991, 32.810),
			-- 	InsideShop = vector3(-1835.57, 2979.477, 32.809),
			-- 	SpawnPoints = {
			-- 		{coords = vector3(-2139.67, 3254.950, 33.313), heading = 92.6, radius = 20.0}
			-- 	}
			-- }
		},

		BossActions = {
			vector3(-2358.04, 3252.233, 101.45),
			vector3(-447.427, 6014.233, 36.507), --Cuartel Paleto Bay
			vector3(1857.852, 3689.712, 38.071)
		}

	}

}

Config.AuthorizedWeapons = {
	soldado = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1}
	},

	soldado2 = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1} 
	},

	cabo = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1} 
	},

	cabo2 = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1}
	},

	sargento = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1}  
	},

	sargento2 = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1} 
	},

	teniente = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1} 
	},

	teniente2 = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1}      
	},

	boss = {
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0}, 
		{weapon = 'GADGET_PARACHUTE', price = 1},     
		{weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 0}, price = 1}, 
		{weapon = 'WEAPON_FLARE', price = 1},
		{weapon = 'WEAPON_FLAREGUN', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0}, price = 1}  
	}
}

Config.AuthorizedVehicles = {
	car = {
		soldado = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}   
		},

		soldado2 = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}  
		},

		cabo = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}  
		},

		cabo2 = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}  
		},

		sargento = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}  
		},

		sargento2 = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}  
		},

		teniente = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}  
		},

		teniente2 = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'm1161growler', price = 1},
			{model = 'baller6', price = 1},  
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}, 
			{model = 'insurgent', price = 1},
			{model = 'insurgent2', price = 1}  
		},

		boss = {
			{model = 'asrad', price = 1},
			{model = 'hmmwv', price = 1},
			{model = 'hmvspecial', price = 1},
			{model = 'humvee1', price = 1},
			{model = 'm1116humvee', price = 1},
			{model = 'barracks', price = 1}, 
			{model = 'crusader', price = 1}, 
			{model = 'insurgent', price = 1},
			{model = 'insurgent2', price = 1}          
		}
	},

	helicopter = {   ---Helicopteros y Aviones---
		soldado = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		soldado2 = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		cabo = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		cabo2 = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		sargento = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		sargento2 = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		teniente = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		teniente2 = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		},

		boss = {
			{model = 'savage', props = {modLivery = 0}, price = 1},
			{model = 'cargobob', props = {modLivery = 0}, price = 1},
			{model = 'buzzard2', props = {modLivery = 0}, price = 1},
		}
	}
}

Config.CustomPeds = {
	shared = {},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	uniforme_operaciones = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 208,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 118,
			pants_1 = 87,   pants_2 = 5,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = 116,  helmet_2 = 13,
			chain_1 = 116,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 212,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 70,
			pants_1 = 90,   pants_2 = 5,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = 116,  helmet_2 = 13,
			chain_1 = 11,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	uniforme_normal_fas = {
        male = {
            tshirt_1 = 15,  tshirt_2 = 0,
            torso_1 = 254,   torso_2 = 5,
            decals_1 = 0,   decals_2 = 0,
            mask_1 = 0,    mask_2 = 0,
            bproof_1 = 7,     bproof_2= 3,
            arms = 36,
            pants_1 = 98,   pants_2 = 5,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = 36,  helmet_2 = 6,
            chain_1 = 126,    chain_2 = 9
  		},
		female = {
            tshirt_1 = 15,  tshirt_2 = 0,
            torso_1 = 238,   torso_2 = 14,
            decals_1 = 0,   decals_2 = 0,
            mask_1 = 0,    mask_2 = 0,
            bproof_1 = 7,     bproof_2= 3,
            arms = 18,
            pants_1 = 34,   pants_2 = 3,
            shoes_1 = 65,   shoes_2 = 0,
            helmet_1 = 112,  helmet_2 = 5,
            chain_1 = 7,    chain_2 = 0
		}
	},

	uniforme_normal_gc = {
        male = {
            tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 71,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            mask_1 = 0,    mask_2 = 0,
            bproof_1 = 0,     bproof_2= 0,
            arms = 42,
            pants_1 = 95,   pants_2 = 2,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 18,    chain_2 = 0
   		},
	female = {
            tshirt_1 = 16,  tshirt_2 = 0,
            torso_1 = 97,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            mask_1 = 0,    mask_2 = 0,
            bproof_1 = 0,     bproof_2= 0,
            arms = 46,
            pants_1 = 36,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0
		}
	},

	uniforme_rangosaltos_gc = {
        male = {
            tshirt_1 = 21,  tshirt_2 = 0,
            torso_1 = 67,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            mask_1 = 121,    mask_2 = 0,
            bproof_1 = 0,     bproof_2= 0,
            arms = 38,
            pants_1 = 95,   pants_2 = 2,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0
   		},
		female = {
            tshirt_1 = 16,  tshirt_2 = 0,
            torso_1 = 97,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            mask_1 = 121,    mask_2 = 0,
            bproof_1 = 0,     bproof_2= 0,
            arms = 46,
            pants_1 = 36,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0
		}
	},

	uniforme_gc_trafico = {
		male = {
			tshirt_1 = 21,  tshirt_2 = 0,
			torso_1 = 67,   torso_2 = 1,
			decals_1 = 1,   decals_2 = 0,
			mask_1 = 104,	mask_2 = 25,
			-- bproof_1 = 20,	bproof_2 = 8,
			arms = 38,
			pants_1 = 95,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 109,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
			bag_1 = 84,    bag_2 = 0,
			glasses_1 = 15,    bag_2 = 0

		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 2,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1  = 121, 	mask_2 	= 0,
			chain_1 = 11,    chain_2 = 0
		}
	},

	chaleco_normal = {
		male = {
			bproof_1 = 20,  bproof_2 = 8
		},
		female = {
			bproof_1 = 20,  bproof_2 = 9
		}
	},

	chaleco_reflectante = {
		male = {
			bproof_1 = 50,  bproof_2 = 8
		},
		female = {
			bproof_1 = 20,  bproof_2 = 9
		}
	},

	chaleco_uco = {
		male = {
			bproof_1 = 50,  bproof_2 = 6
		}
		-- female = {
		-- 	bproof_1 = 20,  bproof_2 = 9
		-- }
	},

	chaleco_gctocho = {
		male = {
			bproof_1 = 15,  bproof_2 = 0
		}
		-- female = {
		-- 	bproof_1 = 20,  bproof_2 = 9
		-- }
	},

	armadura = {
		male = {
		},
		female = {
		}
	},

	chaleco_tocho = {
		male = {
			bproof_1 = 16,  bproof_2 = 2
		},
		female = {
			bproof_1 = 18,  bproof_2 = 0
		}
	}

	
}



--- TELETRANSPORTES ----

Config.Teleporters = {
	['Ascensor-Torre'] = {
		['Job'] = 'none',
		['Enter'] = { 
			['x'] = -2360.80, 
			['y'] = 3249.641, 
			['z'] = 31.820,
			['Information'] = 'E | Subir en el ascensor.',
		},
		['Exit'] = { 
			['x'] = -2360.67, 
			['y'] = 3249.704, 
			['z'] = 91.903,
			['Information'] = 'E | Bajar en el ascensor.' 
		}
	},
	['Ascensor-SSE-CNP'] = {  
		['Job'] = 'cnp',
		['Enter'] = { 
			['x'] = 1881.152, 
			['y'] = 295.0106, 
			['z'] = 163.30,
			['Information'] = 'E | Subir en el ascensor.',
		},
		['Exit'] = {  
			['x'] = 460.4492, 
			['y'] = 4816.285, 
			['z'] = -59.99,
			['Information'] = 'E | Pasar Tarjeta para bajar en el ascensor.' 
		}
	},
	['Ascensor-SSE-GC'] = {
		['Job'] = 'military',
		['Enter'] = { 
			['x'] = 1881.152, 
			['y'] = 295.0106, 
			['z'] = 163.30,
			['Information'] = 'E | Subir en el ascensor.',
		},
		['Exit'] = {  
			['x'] = 460.4492, 
			['y'] = 4816.285, 
			['z'] = -59.99,
			['Information'] = 'E | Pasar Tarjeta para bajar en el ascensor.' 
		}
	},
	['Nivel2-Bunker-GC'] = {
		['Job'] = 'military',
		['Enter'] = { 
			['x'] = 470.06, 
			['y'] = 4781.71, 
			['z'] = -59.99,
			['Information'] = 'E | Meter clave y pasar tarjeta de nivel superior.',
		},
		['Exit'] = {  
			['x'] = 857.05, 
			['y'] = -3249.08, 
			['z'] = -99.38, 
			['Information'] = 'E | Meter clave y pasar tarjeta de nivel superior.' 
		}
	},

	['Nivel2-Bunker-CNP'] = {
		['Job'] = 'cnp',
		['Enter'] = { 
			['x'] = 470.06, 
			['y'] = 4781.71, 
			['z'] = -59.99,
			['Information'] = 'E | Meter clave y pasar tarjeta de nivel superior.',
		},
		['Exit'] = {  
			['x'] = 857.05, 
			['y'] = -3249.08, 
			['z'] = -99.38, 
			['Information'] = 'E | Meter clave y pasar tarjeta de nivel superior.' 
		}
	}
	
}
