Config                            = {}
local second = 1000
local minute = 60 * second
Config.Locale = 'en'

Config.DetachKeys = {157, 158, 160, 164, 165, 73, 36}

Config.VehiclesBrancard = { -- Aqui pones los modelos de los coches que quieras sacar camillas
	'sprinter1',
	'sprinter3',
	'inem_vwcrafter',
	'sprinter',
	'wheelchair',
	'fk2',
	'mini',
	'polgs350',
	'vwt6for',
	'ems_gs1200',
	'zendrack',
	'hcampana',
	'polmp4',
	'sheriffx6',
	'f150',
	'towtruck',
	'renmidlium',
	'meratego',
	'suzufire',
	'p280',
	'm939',
	'vwt6',
	'vitofor',
	'partner',
	'voltouran',
	'landb',
	'desfire',
	'rsb_lrdef',
	'firehawk',
	'jayhawk'
}
Config.DrawDistance               = 100.0
Config.Marker                     = { type = 27, x = 1.3, y = 1.3, z = 0.5, r = 230, g = 5, b = 10, a = 100, rotate = true }
Config.ReviveReward               = 750  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders
Config.EarlyRespawnTimer          = 8 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 6 * minute 
Config.EnablePlayerManagement     = true
Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(-811.5213, -1211.226, 6.934116), heading = 51.30 }

Config.Coches = {
	VehicleSpawnPoint = {
		Pos  = { x = -827.46, y =  -1194.261, z = 6.00 },
		Size = { x = 1.5, y = 1.5, z = 1.0 },
			Type = -1
	},
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-830.74, -1216.884, 134.500),
			sprite = 61,
			scale  = 0.7,
			color  = 3
		},

		AmbulanceActions = {
			vector3(-826.29, -1237.26, 6.34)
		},


		Pharmacies = {
			vector3(-819.84, -1242.72, 6.34)
		},

		Vehicles = {
			-- {
			-- 	Spawner = vector3(-825.45, -1227.97, 6.93),
			-- 	InsideShop = vector3(292.16, -611.73, 43.39),
				
			-- 	Marker = { type = 36, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
			-- 	SpawnPoints = {
			-- 		{ coords = vector3(-455.835, -347.505, 34.366), heading = 275.91, radius = 5.0 },
			-- 		{ coords = vector3(-465.668, -346.129, 34.363), heading = 334.5, radius = 5.0 },
			-- 		{ coords = vector3(-469.272, -352.007, 34.369), heading = 335.43, radius = 6.0 }
			-- 	}
			-- },

			{
				Spawner = vector3(-825.45, -1227.97, 6.93),
				InsideShop = vector3(352.52, -589.34, 74.17),
				
				Marker = { type = 36, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-859.26, -1218.2, 6.00), heading = 131.91, radius = 5.0 }
				}
			}
		},



		Helicopters = {
			{
				Spawner = vector3(-789.49, -1206.39, 51.168),
				InsideShop = vector3(-790.86, -1191.74, 53.03),
				Marker = { type = 34, x = 2.5, y = 2.5, z = 2.0, r = 230, g = 5, b = 10, a = 100, rotate = true },
				SpawnPoints = {
					{ coords =vector3(-790.86, -1191.74, 53.03), heading = 10.66, radius = 10.0 }
					--{ coords = vector3(352.0, -587.9, 74.17), heading = 142.7, radius = 10.0 }
				}
			}
		},



		FastTravels = {
			-- {
			-- 	From = vector3(-419.291, -344.822, 23.230),
			-- 	To = { coords = vector3(-435.881, -354.620, 34.910), heading = 0.0 },
			-- 	Marker = { type = 27, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },

			-- {
			-- 	From = vector3(-436.120, -359.619, 34.249),
			-- 	To = { coords = vector3(-425.570, -347.886, 24.229), heading = 0.0 },
			-- 	Marker = { type = 27, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },
			{
				From = vector3(3540.383, 3676.189, 27.13),
				To = { coords = vector3(3540.574, 3671.810, 19.991), heading = 0.0 },
				Marker = { type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
			{
				From = vector3(3540.826, 3676.227, 20.0),
				To = { coords = vector3(3540.186, 3672.119, 27.121), heading = 0.0 },
				Marker = { type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(-800.99, -1251.385, 6.34),
				To = { coords = vector3(-781.69, -1199.47, 51.15), heading = 52.36 },
				Marker = { type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(-773.89, -1207.3, 50.165),
				To = { coords = vector3(-796.19, -1244.02, 7.34), heading = 45.0 },
				Marker = { type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

--------------------- Enfermero --------------------
	ambulance = {
                { model = 'sprinter1', label = 'Ambulancia Cruz Roja', price = 1},
                { model = 'sprinter3', label = 'Ambulancia sprinter 311', price = 1},
                { model = 'inem_vwcrafter', label = 'Ambulancia Volkswagen', price = 1},
                { model = 'sprinter', label = 'Ambulancia Sprinter', price = 1},
                { model = 'fk2', label = 'Peugeot 206', price = 1},
                { model = 'mini', label = 'Smart', price = 1},
                { model = 'polgs350', label = 'Lexus VIR Cruz Roja', price = 1},
                { model = 'ems_gs1200', label = 'Moto GS1200', price = 1},
                { model = 'zendrack', label = 'Mercedes Stilo Zendrack', price = 1},
                { model = 'hcampana', label = 'Hospital de Campaña', price = 1},
                { model = 'polmp4', label = 'MP4', price = 1},
                { model = 'sheriffx6', label = 'BMW X6', price = 1},
                { model = 'f150', label = 'Raptor Jefatura', price = 1},
                { model = 'm939', label = 'Mercedes Atego escalera [Bomberos]', price = 1},
                { model = 'vwt6', label = 'Volkswagen t6 [Bomberos]', price = 1},
                { model = 'partner', label = 'Kangoo [Bomberos]', price = 1},
                { model = 'voltouran', label = 'Volkswagen Touran [Bomberos]', price = 1},
                { model = 'desfire', label = 'Incendios extremos [Bomberos]', price = 1},
                { model = 'rsb_lrdef', label = 'Land Rover Defender [Bomberos]', price = 1}
	},
---------------------------------------------------------------	

--------------------- Residente --------------------
	doctor = {
		{ model = 'sprinter', label = 'Ambulancia', price = 5000},
		{ model = 'polgs350', label = 'Patrulla Lexus', price = 50000}
	},
	
---------------------------------------------------------------	
	
	
--------------------- Medico --------------------
	chief_doctor = {
		{ model = 'sprinter', label = 'Ambulancia', price = 5000},
		{ model = 'polgs350', label = 'Patrulla Lexus', price = 50000},

	},
	
-----------------------------------------------------------------------


--------------------- Medico de Cabezera --------------------
	medicodecabezera = {
		{ model = 'sprinter', label = 'Ambulancia', price = 5000},
		{ model = 'polgs350', label = 'Patrulla Lexus', price = 50000},

	},
	
-----------------------------------------------------------------------

--------------------- Sub Director (es) --------------------
	subdirector = {
		{ model = 'sprinter', label = 'Ambulancia', price = 5000},
		{ model = 'polgs350', label = 'Patrulla Lexus', price = 50000},
		{ model = 'zendrack', label = 'Patrulla Mercedes', price = 500000}

	},
-----------------------------------------------------------------------


--------------------- Director SEM --------------------


	boss = {
		{ model = 'sprinter', label = 'Ambulancia', price = 5000},
		{ model = 'polgs350', label = 'Patrulla Lexus', price = 50000},
		{ model = 'zendrack', label = 'Patrulla Mercedes', price = 500000}

	}

}
---------------------------------------------------------------	

Config.AuthorizedHelicopters = {

    ambulance = {
        { model = 'EC135', label = 'HELI EMS', price = 10 }
    },

    chief_doctor = {
        { model = 'EC135', label = 'HELI EMS', price = 10 }
    },

    medicodecabezera = {
            { model = 'EC135', label = 'HELI EMS', price = 10 }
    },

    enfermero = {
            { model = 'EC135', label = 'HELI EMS', price = 10 }
    },

	doctor = {
		{ model = 'EC135', label = 'HELI EMS', price = 10 }
	},

    subdirector = {
            { model = 'EC135', label = 'HELI EMS', price = 10 }
    },

    boss = {
            { model = 'EC135', label = 'HELI EMS', price = 10 }
    }

}
