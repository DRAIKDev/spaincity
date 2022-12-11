Config                            = {}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableLicenses             = false -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 15 * 60000 -- 10 minutes.

Config.Locale                     = 'es'

Config.Zones = {

	mafia01 = {

		Cloakrooms = {
			Opciones = {
				Pos   = { x = -1503.41, y = 102.2796, z = 55.65816 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 205, g = 205, b = 205 },
				Type  = 20
			}
		},

		Armories = {
			Opciones = {
				Pos   = { x = -1518.32, y = 112.3908, z = 48.047 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 27,

				Armeria = true
			}
		},

		BossActions = {
			Opciones = {
				Pos   = { x = -1498.379, y = 128.9401, z = 55.66811 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 255, g = 0, b = 0 },
				Type  = 22
			}
		},

		HeliZones = {
			Opciones = {
				Pos   = { x = -1491.63,  y = 172.64, z = 55.48 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 50, g = 50, b = 204 },
				Type  = 34,

				Vehiculos = {
					{ model = 'supervolito2', label = 'Super Volito', price = 15000 }
				}
			}
		},

		CarZones = {
			Opciones = {
				Pos   = { x = -1527.34, y = 91.32839, z = 56.576 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 36,

				Vehiculos = {
					{ model = 'africat', label = 'Africa Twin', price = 0 },
					{ model = 'rsvr16', label = 'Range Rover', price = 0 }
				}
			}
		},

		-- Cloakrooms = {
		-- 	Opciones = {
		-- 		Pos   = { x = -1742.8787, y = 151.6308, z = 64.3710 },
		-- 		Size  = { x = 0.3, y = 0.3, z = 0.3 },
		-- 		Color = { r = 205, g = 205, b = 205 },
		-- 		Type  = 20
		-- 	}
		-- },

		-- Armories = {
		-- 	Opciones = {
		-- 		Pos   = { x = -1731.7107, y = 137.6918, z = 63.20 },
		-- 		Size  = { x = 0.3, y = 0.3, z = 0.3 },
		-- 		Color = { r = 0, g = 0, b = 0 },
		-- 		Type  = 27,

		-- 		Armeria = true
		-- 	}
		-- },

		-- BossActions = {
		-- 	Opciones = {
		-- 		Pos   = { x = -1739.5378, y = 151.4859, z = 64.3710 },
		-- 		Size  = { x = 0.3, y = 0.3, z = 0.3 },
		-- 		Color = { r = 255, g = 0, b = 0 },
		-- 		Type  = 22
		-- 	}
		-- },

		-- HeliZones = {
		-- 	Opciones = {
		-- 		Pos   = { x = -1741.0433, y = 153.3549, z = 64.3710 },
		-- 		Size  = { x = 0.5, y = 0.5, z = 0.5 },
		-- 		Color = { r = 50, g = 50, b = 204 },
		-- 		Type  = 34,

		-- 		Vehiculos = {
		-- 			{ model = 'supervolito2', label = 'Super Volito', price = 15000 }
		-- 		}
		-- 	}
		-- },

		-- CarZones = {
		-- 	Opciones = {
		-- 		Pos   = { x = -1743.1185, y = 153.6976, z = 64.3710 },
		-- 		Size  = { x = 0.5, y = 0.5, z = 0.5 },
		-- 		Color = { r = 0, g = 0, b = 0 },
		-- 		Type  = 36,

		-- 		Vehiculos = {
		-- 			{ model = 'africat', label = 'Africa Twin', price = 0 },
		-- 			{ model = 'rsvr16', label = 'Range Rover', price = 0 }
		-- 		}
		-- 	}
		-- },
	},

	mafia02 = {

		Cloakrooms = {
			Opciones = {
				Pos   = { x = 1394.859, y = 1156.825, z = 114.33 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 205, g = 205, b = 205 },
				Type  = 20
			}
		},

		Armories = {
			Opciones = {
				Pos   = { x = 1404.082, y = 1137.979, z = 107.7456 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 27,

				Armeria = false
			}
		},

		BossActions = {
			Opciones = {
				Pos   = { x = 1392.166, y = 1159.912, z = 114.33},
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 255, g = 0, b = 0 },
				Type  = 22
			}
		},

		HeliZones = {
			Opciones = {
				Pos   = { x = 1456.129, y = 1112.332, z = 114.33 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 50, g = 50, b = 204 },
				Type  = 34,

				Vehiculos = {
					{ model = 'supervolito2', label = 'Super Volito', price = 15000 }
				}
			}
		},

		CarZones = {
			Opciones = {
				Pos   = { x = 1406.135, y = 1117.481, z = 114.83 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 36,

				Vehiculos = {
					{ model = 'africat', label = 'Africa Twin', price = 0 },
					{ model = 'demonhawk', label = 'Jeep SRT-8 2015', price = 0 }
				}
			}
		},

	},

	mafia03 = {

		Cloakrooms = {
			Opciones = {
				Pos   = { x = -1887.16, y = 2070.442, z = 145.57 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 205, g = 205, b = 205 },
				Type  = 20
			}
		},

		Armories = {
			Opciones = {
				Pos   = { x = -1879.33, y = 2063.382, z = 133.91 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 27,
				
				Armeria = false
			}
		},

		BossActions = {
			Opciones = {
				Pos   = { x = -1876.27, y = 2062.061, z = 145.57},
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 255, g = 0, b = 0 },
				Type  = 22
			}
		},

		HeliZones = {
			Opciones = {
				Pos   = { x = -1895.59,  y = 2017.05, z = 140.94 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 255, g = 255, b = 255 },
				Type  = 34,

				Vehiculos = {
					{ model = 'supervolito2', label = 'Super Volito', price = 15000 }
				}
			}
		},

		CarZones = {
			Opciones = {
				Pos   = { x = -1895.796, y = 2034.313, z = 140.7415 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 255, g = 255, b = 255 },
				Type  = 36,

				Vehiculos = {
					{ model = 'africat', label = 'Africa Twin', price = 0 },
					{ model = 'demonhawk', label = 'Jeep SRT-8 2015', price = 0 }
				}
			}
		},

	},

	mafia04 = {

		Cloakrooms = {
			Opciones = {
				Pos   = { x = -66.6800, y = 991.9338, z = 234.56 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 205, g = 205, b = 205 },
				Type  = 20
			}
		},

		Armories = {
			Opciones = {
				Pos   = { x = -85.75018, y = 997.2446, z = 228.6069 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 27,

				Armeria = false
			}
		},

		BossActions = {
			Opciones = {
				Pos   = { x = -59.0492, y = 981.6875, z = 234.57},
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 255, g = 0, b = 0 },
				Type  = 22
			}
		},

		HeliZones = {
			Opciones = {
				Pos   = { x = -124.16,  y = 992.88, z = 235.76 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 50, g = 50, b = 204 },
				Type  = 34,

				Vehiculos = {
					--{ model = 'supervolito2', label = 'Super Volito', price = 15000 }
				}
			}
		},

		CarZones = {
			Opciones = {
				Pos   = { x = -109.72, y = 1005.81, z = 235.78 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 36,

				Vehiculos = {
					{ model = 'africat', label = 'Africa Twin', price = 0 },
					{ model = 'rsvr16', label = 'Range Rover', price = 0 }
				}
			}
		},

	},

	mafia05 = {

		Cloakrooms = {
			Opciones = {
				Pos   = { x = 375.2027, y = 434.1853, z = 138.30 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 205, g = 205, b = 205 },
				Type  = 20
			}
		},

		Armories = {
			Opciones = {
				Pos   = { x = 377.4473, y = 433.2668, z = 138.30 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 27,

				Armeria = false
			}
		},

		BossActions = {
			Opciones = {
				Pos   = { x = 379.3522, y = 432.9043, z = 138.30 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 255, g = 0, b = 0 },
				Type  = 22
			}
		},

		HeliZones = {
			Opciones = {
				Pos   = { x = 0, y = 0, z = 0 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 50, g = 50, b = 204 },
				Type  = 34,

				Vehiculos = {
					{ model = 'supervolito2', label = 'Super Volito', price = 15000 }
				}
			}
		},

		CarZones = {
			Opciones = {
				Pos   = { x = 0, y = 0, z = 0 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 36,

				Vehiculos = {
					{ model = 'africat', label = 'Africa Twin', price = 0 },
					{ model = 'bentaygast', label = 'Bentley Bentaygast', price = 0 }
				}
			}
		},

	},

	mafia06 = {

		Cloakrooms = {
			Opciones = {
				Pos   = { x = -576.0341, y =  231.914, z = 74.8909 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 205, g = 205, b = 205 },
				Type  = 20
			}
		},

		Armories = {
			Opciones = {
				Pos   = { x = -580.24, y = 230.06, z = 72.93 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 27,

				Armeria = true
			}
		},

		BossActions = {
			Opciones = {
				Pos   = { x = -566.89, y = 226.15, z = 74.89 },
				Size  = { x = 0.3, y = 0.3, z = 0.3 },
				Color = { r = 255, g = 0, b = 0 },
				Type  = 22
			}
		},

		HeliZones = {
			Opciones = {
				Pos   = { x = -745.65, y = -1468.62, z = 5.0 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 50, g = 50, b = 204 },
				Type  = 34,

				Vehiculos = {
					{ model = 'supervolito2', label = 'Buzzard (sin armas)', price = 15000 }
				}
			}
		},

		CarZones = {
			Opciones = {
				Pos   = { x = -588.74, y = 197.5, z = 71.46 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 255, g = 255, b = 255 },
				Type  = 36,

				Vehiculos = {
					{ model = 'africat', label = 'Africa Twin', price = 0 },
					{ model = 'hilux1', label = 'Toyota Hilux', price = 0 }
				}
			}
		},

	}

}

Config.AuthorizedWeapons = {
	novato = {
		{weapon = 'WEAPON_SWITCHBLADE', price = 5400},
        {weapon = 'WEAPON_MACHETE', price = 444},
        {weapon = 'WEAPON_KNIFE', price = 360},
        {weapon = 'WEAPON_HATCHET', price = 1800},
        {weapon = 'WEAPON_poolcue', price = 1000}
	},

	camello = {
		{weapon = 'WEAPON_SWITCHBLADE', price = 5400},
        {weapon = 'WEAPON_MACHETE', price = 444},
        {weapon = 'WEAPON_KNIFE', price = 360},
        {weapon = 'WEAPON_HATCHET', price = 1800},
        {weapon = 'WEAPON_poolcue', price = 1000}
	},

	sicario = {
		{weapon = 'WEAPON_SWITCHBLADE', price = 5400},
        {weapon = 'WEAPON_MACHETE', price = 444},
        {weapon = 'WEAPON_KNIFE', price = 360},
        {weapon = 'WEAPON_HATCHET', price = 1800},
        {weapon = 'WEAPON_poolcue', price = 1000}
	},

	viceboss = {
		{weapon = 'WEAPON_SWITCHBLADE', price = 5400},
        {weapon = 'WEAPON_MACHETE', price = 444},
        {weapon = 'WEAPON_KNIFE', price = 360},
        {weapon = 'WEAPON_HATCHET', price = 1800},
        {weapon = 'WEAPON_SNIPERRIFLE', price = 240000},
        {weapon = 'WEAPON_BULLPUPRIFLE', price = 140400},
        {weapon = 'WEAPON_ADVANCEDRIFLE', components= {0, 0, 0, 0, 0},  price = 108000},
        {weapon = 'WEAPON_ASSAULTRIFLE', components= {0, 0, 0, 0, 0, 0, 0, 0}, price = 82800},
        {weapon = 'WEAPON_MINISMG', price = 33600},
        {weapon = 'WEAPON_MACHINEPISTOL', price = 26400},
        {weapon = 'WEAPON_ASSAULTSMG', price = 48000},
        {weapon = 'WEAPON_KNUCKLE', price = 1440},
        {weapon = 'WEAPON_MICROSMG', price = 44400},
        {weapon = 'WEAPON_DOUBLEACTION', price = 50400},
       	{weapon = 'WEAPON_VINTAGEPISTOL', price = 7800},
        {weapon = 'WEAPON_HEAVYPISTOL', price = 20400},
        {weapon = 'WEAPON_PISTOL50', components= {0, 0, 0, 0, 0}, price = 78000},
        {weapon = 'WEAPON_APPISTOL', price = 25800},
		{weapon = 'weapon_smokegrenade', price = 15000},
		{weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 60000},
		{weapon = 'WEAPON_GUSENBERG', price = 150000},
        {weapon = 'WEAPON_poolcue', price = 1000}
	},
	
	boss = {
		{weapon = 'WEAPON_SWITCHBLADE', price = 5400},
        {weapon = 'WEAPON_MACHETE', price = 444},
        {weapon = 'WEAPON_KNIFE', price = 360},
        {weapon = 'WEAPON_HATCHET', price = 1800},
        {weapon = 'WEAPON_SNIPERRIFLE', price = 240000},
        {weapon = 'WEAPON_BULLPUPRIFLE', price = 140400},
        {weapon = 'WEAPON_ADVANCEDRIFLE', components= {0, 0, 0, 0, 0},  price = 108000},
        {weapon = 'WEAPON_ASSAULTRIFLE', components= {0, 0, 0, 0, 0, 0, 0, 0}, price = 82800},
        {weapon = 'WEAPON_MINISMG', price = 33600},
        {weapon = 'WEAPON_MACHINEPISTOL', price = 26400},
        {weapon = 'WEAPON_ASSAULTSMG', price = 48000},
        {weapon = 'WEAPON_KNUCKLE', price = 1440},
        {weapon = 'WEAPON_MICROSMG', price = 44400},
		{weapon = 'WEAPON_GUSENBERG', price = 150000},
		{weapon = 'weapon_smokegrenade', price = 15000},
        {weapon = 'WEAPON_DOUBLEACTION', price = 50400},
       	{weapon = 'WEAPON_VINTAGEPISTOL', price = 7800},
        {weapon = 'WEAPON_HEAVYPISTOL', price = 20400},
        {weapon = 'WEAPON_PISTOL50', components= {0, 0, 0, 0, 0}, price = 78000},
        {weapon = 'WEAPON_APPISTOL', price = 25800},
		{weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 60000},
        {weapon = 'WEAPON_poolcue', price = 1000}
	}
}

Config.AuthorizedWeaponsFalse = {
	novato = {
		-- {weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		-- {weapon = 'WEAPON_NIGHTSTICK', price = 0},
		-- {weapon = 'WEAPON_STUNGUN', price = 1500},
		-- {weapon = 'WEAPON_FLASHLIGHT', price = 80}
	},

	camello = {
		-- {weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		-- {weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		-- {weapon = 'WEAPON_NIGHTSTICK', price = 0},
		-- {weapon = 'WEAPON_STUNGUN', price = 500},
		-- {weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	sicario = {
		-- {weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		-- {weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		-- {weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		-- {weapon = 'WEAPON_NIGHTSTICK', price = 0},
		-- {weapon = 'WEAPON_STUNGUN', price = 500},
		-- {weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	viceboss = {
		{weapon = 'WEAPON_SNSPISTOL', price = 9000},
		{weapon = 'WEAPON_KNIFE', price = 1500},
		{weapon = 'WEAPON_POOLCUE', price = 1000}
	},

	boss = {
		{weapon = 'WEAPON_SNSPISTOL', price = 9000},
		{weapon = 'WEAPON_KNIFE', price = 1500},
		{weapon = 'WEAPON_POOLCUE', price = 1000}
	}
}
