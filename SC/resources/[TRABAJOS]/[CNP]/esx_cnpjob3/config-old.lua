 Config                            = {}

 Config.DrawDistance               = 5.0 -- How close do you need to be for the markers to be drawn (in GTA units).
 Config.MarkerType                 = {Cloakrooms = 27, Armories = 27, BossActions = 22, Vehicles = 36, Helicopters = 34}
 Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
 Config.MarkerColor                = {r = 50, g = 50, b = 204}

 Config.EnablePlayerManagement     = true -- Enable if you want society managing.
 Config.EnableArmoryManagement     = true
 Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
 Config.EnableLicenses             = true -- Enable if you're using esx_license.

 Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
 Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

 Config.EnableHandcuffTimer2       = true -- Enable handcuff timer? will unrestrain player after the time ends.
 Config.HandcuffTimer2              = 10 * 60000 -- 10 minutes.

 Config.EnableJobBlip              = false -- Enable blips for cops on duty, requires esx_society.
 Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

 Config.EnableESXService           = false -- Enable esx service?
 Config.MaxInService               = -1 -- How much people can be in service at once?

 Config.Locale                     = 'es'

 Config.cnpStations = {

 	LSPD = {

 		Blip = {
 			Coords  = vector3(425.1, -979.5, 30.7),
 			Sprite  = 60,
 			Display = 4,
 			Scale   = 0.8,
 			Colour  = 29
 		},

 		Cloakrooms = {
 			vector3(461.5390, -998.969, 29.689),--COMISARIA
 			vector3(422.9275, 4811.039, -58.99),--SERVICIO SECRETO
 			vector3(2516.39, -347.48, 100.89),--BASE GEO
 			vector3(132.16, -736.75, 42.15),--CNI
 			vector3(-2358.56, 3254.042, 32.810),--BASE MILITAR
 			vector3(422.9275, 4811.039, -58.99),--SERVICIO SECRETO
 			vector3(-454.701, 6016.101, 31.716), --Cuartel Paleto Bay
 			vector3(1849.172, 3695.342, 34.270)--CUARTEL SANDY
 		},

 		Armories = {
 			vector3(485.1615, -995.971, 29.689), --COMISARIA
 			vector3(417.1754, 4809.834, -58.99), --SERVICIO SECRETO
 			vector3(2525.71, -341.7, 100.89), --BASE GEO
 			vector3(135.5053, -737.587, 42.152), --CNI
 			vector3(-2355.63, 3258.781, 92.903),--BASE MILITAR
 			vector3(417.1754, 4809.834, -58.99),--SERVICIO SECRETO
 			vector3(-435.265, 5999.120, 31.716), -- Cuartel Paleto Bay
 			vector3(1860.901, 3689.016, 34.270)--CUARTEL SANDY
 		},

		Vehicles = {
			-- {
			-- 	Spawner = vector3(454.6, -1017.4, 28.4),
			-- 	InsideShop = vector3(228.5, -993.5, -99.5),
			-- 	SpawnPoints = {
			-- 		{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
			-- 		{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
			-- 		{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
			-- 		{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
			-- 	}
			-- },

 			-- {
 			-- 	Spawner = vector3(473.3, -1018.8, 28.0),
 			-- 	InsideShop = vector3(228.5, -993.5, -99.0),
 			-- 	SpawnPoints = {
 			-- 		{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
 			-- 		{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
 			-- 	}
 			-- }
 		},

 		Helicopters = {
 			-- {
 			-- 	Spawner = vector3(461.1, -981.5, 43.6),
 			-- 	InsideShop = vector3(477.0, -1106.4, 43.0),
 			-- 	SpawnPoints = {
 			-- 		{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
 			-- 	}
 			-- }
 		},

 		BossActions = {
 			vector3(462.9786, -985.320, 30.728),
 			vector3(-2358.04, 3252.233, 101.45),
 			vector3(-447.427, 6014.233, 36.507), --Cuartel Paleto Bay
 			vector3(1857.852, 3689.712, 38.071)
 		}

 	}

 }

 Config.AuthorizedWeapons = {
 	practicas = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	cadete = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	oficial1 = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	oficial2 = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	oficial3 = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	sargento = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_APPISTOL', price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

	teniente = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
		{ weapon = 'WEAPON_APPISTOL', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, 0 }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

 	subinspector = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_APPISTOL', price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_HEAVYSNIPER', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	inspector = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_APPISTOL', price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_HEAVYSNIPER', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	inspectorjefe = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_APPISTOL', price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_HEAVYSNIPER', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	subcomisario = {
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_APPISTOL', price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_HEAVYSNIPER', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	},

 	boss = { --Comisario (NO QUITAR LO DE BOSS)
 		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_ASSAULTSHOTGUN', components = { 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_APPISTOL', price = 0 },
 		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 0, 0, 0, 0, 0}, price = 0},
 		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, 0 }, price = 0 },
 		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
 		{ weapon = 'WEAPON_STUNGUN', price = 0 },
 		{ weapon = 'WEAPON_HEAVYSNIPER', price = 0 },
 		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
 	}
 }

 Config.AuthorizedVehicles = {
 	car = {
		-- recruit = {},

		-- officer = {
 		-- 	{model = 'cnp3', price = 20000}
 		-- },

 		-- sergeant = {
 		-- 	{model = 'cnpt', price = 18500},
 		-- 	{model = 'cnpb', price = 30500}
 		-- },
 		-- lieutenant = {
 		-- 	{model = 'riot', price = 70000},
 		-- 	{model = 'fbi2', price = 60000}
 		-- },
 		-- boss = {}
 	},

 	helicopter = {
 		-- recruit = {},

 		-- officer = {},

 		-- sergeant = {},

		-- lieutenant = {
		-- 	{model = 'polmav', props = {modLivery = 0}, price = 200000}
 		-- },

 		-- boss = {
 		-- 	{model = 'polmav', props = {modLivery = 0}, price = 100000}
 		-- }
 	}
 }

 Config.CustomPeds = {
 	-- shared = {
 	-- 	{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
 	-- 	{label = 'cnp Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
 	-- },

 	-- recruit = {},

 	-- officer = {},

 	-- sergeant = {},

 	-- lieutenant = {},
 	-- boss = {
 	-- 	{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
 	-- }
}

 -- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
 Config.Uniforms = {
 	practicas = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 88,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 31,
             pants_1 = 36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 40,     bproof_2= 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 126,    chain_2 = 0,

         },
 		female = {
             tshirt_1 = 14,  tshirt_2 = 0,
             torso_1 = 56,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 0,    chain_2 = 0,

         }
 	},

 	cadete = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 88,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 31,
             pants_1 = 36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 0,     bproof_2= 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 126,    chain_2 = 0,

         },
 		female = {
             tshirt_1 = 14,  tshirt_2 = 0,
             torso_1 = 56,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 0,    chain_2 = 0,

         }
 	},

 	oficial1 = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 88,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 31,
             pants_1 = 36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 126,    chain_2 = 0,

         },
 		female = {
             tshirt_1 = 14,  tshirt_2 = 0,
             torso_1 = 56,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 0,    chain_2 = 0,

         }
 	},

 	oficial2 = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 88,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 31,
             pants_1 = 36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 126,    chain_2 = 0,

         },
 		female = {
             tshirt_1 = 14,  tshirt_2 = 0,
             torso_1 = 56,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 0,    chain_2 = 0,

         }
 	},

 	oficial3 = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 88,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 31,
             pants_1 = 36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 126,    chain_2 = 0,

         },
 		female = {
             tshirt_1 = 14,  tshirt_2 = 0,
             torso_1 = 56,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             helmet_1 = -1,  helmet_2 = 0,
             chain_1 = 0,    chain_2 = 0,

         }
 	},

 	sargento = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 70,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 34,
             pants_1 =36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             chain_1 = 126,    chain_2 = 0,
         },
 		female = {
             tshirt_1 = 38,  tshirt_2 = 0,
             torso_1 = 229,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,

         }
 	},

 	teniente = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 70,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 34,
             pants_1 =36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             chain_1 = 126,    chain_2 = 0,
         },
 		female = {
             tshirt_1 = 38,  tshirt_2 = 0,
             torso_1 = 229,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
         }
 	},

 	subinspector = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 70,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 34,
             pants_1 =36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             chain_1 = 126,    chain_2 = 0,
         },
 		female = {
             tshirt_1 = 38,  tshirt_2 = 0,
             torso_1 = 229,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
         }
 	},

 	inspector = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 70,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 34,
             pants_1 =36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             chain_1 = 126,    chain_2 = 0,
         },
 		female = {
             tshirt_1 = 38,  tshirt_2 = 0,
             torso_1 = 229,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
         }
 	},

 	inspectorjefe = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 70,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 34,
             pants_1 =36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             chain_1 = 126,    chain_2 = 0,
         },
 		female = {
             tshirt_1 = 38,  tshirt_2 = 0,
             torso_1 = 229,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
         }
 	},

 	subcomisario = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 70,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 34,
             pants_1 =36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
             chain_1 = 126,    chain_2 = 0,
         },
 		female = {
             tshirt_1 = 38,  tshirt_2 = 0,
             torso_1 = 229,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 44,
             pants_1 = 58,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 7,     bproof_2= 0,
         }
 	},

 	ropageo = {
 		male = {
             tshirt_1 = 82,  tshirt_2 = 0,
             torso_1 = 131,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 97,
             pants_1 =36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 37,     bproof_2= 0,
             helmet_1 = 0,  helmet_2 = 0,
             chain_1 = 126,    chain_2 = 0,
             ears_1 = 2,     ears_2 = 0
         },
 		female = {
             tshirt_1 = 16,  tshirt_2 = 0,
             torso_1 = 54,   torso_2 = 0,
             decals_1 = 0,   decals_2 = 0,
             arms = 23,
             pants_1 = 36,   pants_2 = 0,
             shoes_1 = 25,   shoes_2 = 0,
             bproof_1 = 54,     bproof_2= 0,
             -- helmet_1 = 0,  helmet_2 = 0,
             chain_1 = 0,    chain_2 = 0,
             ears_1 = -1,     ears_2 = 0
         }
     },

    ropauip = {
		male = {
            tshirt_1 = 2,  tshirt_2 = 0,
            torso_1 = 10,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 42,   pants_2 = 0,
            shoes_1 = 24,   shoes_2 = 0,
            bproof_1 = 52,     bproof_2= 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 69,    chain_2 = 0,
            ears_1 = 2,     ears_2 = 0
        },
		female = {
            tshirt_1 = 1,  tshirt_2 = 0,
            torso_1 = 56,   torso_2 = 0,
            decals_1 = 25,   decals_2 = 0,
            arms = 14,
            pants_1 = 18,   pants_2 = 0,
            shoes_1 = 24,   shoes_2 = 0,
            bproof_1 = 7,     bproof_2= 0,
            -- helmet_1 = 0,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0
        }
    },

 	mossos = {
 		male = {
 			tshirt_1 = 25,  tshirt_2 = 0,
 			torso_1 = 2,   torso_2 = 0,
 			arms = 42,
 			pants_1 = 36,   pants_2 = 2,
 			shoes_1 = 24,   shoes_2 = 0,
 			helmet_1 = 106,  helmet_2 = 0,
 			ears_1 = 2,     ears_2 = 0,
 			bproof_1 = 8, 	bproof_2 = 0
 		},
 		female = {
 			tshirt_1 = 1,  tshirt_2 = 0,
 			torso_1 = 151,   torso_2 = 0,
 			arms = 44,
 			pants_1 = 3,   pants_2 = 0,
 			shoes_1 = 27,   shoes_2 = 0,
 			helmet_1 = 105,  helmet_2 = 20,
 			ears_1 = 2,     ears_2 = 0,
 			bproof_1 = 3, 	bproof_2 = 0
 		}
 	},

	boss = {
		male = {
            tshirt_1 = 82,  tshirt_2 = 0,
            torso_1 = 70,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 34,
            pants_1 =36,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            bproof_1 = 7,     bproof_2= 0,
            chain_1 = 126,    chain_2 = 0,
        },
		female = {
            tshirt_1 = 38,  tshirt_2 = 0,
            torso_1 = 229,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 44,
            pants_1 = 58,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            bproof_1 = 7,     bproof_2= 0,
        }
	},

 	chaleco1 = {
 		male = {
 			bproof_1 = 7,  bproof_2 = 0
 		},
 		female = {
 			bproof_1 = 34,  bproof_2 = 0
 		}
 	},

 	chaleco2 = {
 		male = {
 			bproof_1 = 46,  bproof_2 = 0
 		},
 		female = {
 			bproof_1 = 0,  bproof_2 = 0
 		}
 	},

 	quitarsechaleco = {
 		male = {
 			bproof_1 = 0,  bproof_2 = 0
 		},
 		female = {
 			bproof_1 = 0,  bproof_2 = 0
 		}
 	},


 	blindaje = {
 		male = {
 		},
 		female = {
 		}
 	},

 	chalecoreflectante = {
 		male = {
 			bproof_1 = 40,  bproof_2 = 0
 		},
 		female = {
 			bproof_1 = 24,  bproof_2 = 0
 		}
 	}
 }
--------------------------------
------- Created by Hamza -------
-------------------------------- 

