Config                            = {}
local second = 1000
local minute = 60 * second
Config.Locale = 'es'

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

Config.DrawDistance               = 25
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

Config.RespawnPoint = {
	coords = vector3(-811.5213, -1211.226, 6.934116),
	heading = 51.30
}

Config.AuthorizedVehicles = {
    { name = 'sprinter1',       label = "Ambulancia Cruz Roja"},
	{ name = 'sprinter3',       label = "Ambulancia sprinter 311"},
	{ name = 'inem_vwcrafter',  label = "Ambulancia Volkswagen"},
	{ name = 'sprinter',        label = "Ambulancia Sprinter"},
	{ name = 'wheelchair',      label = "Silla de Ruedas"},
	{ name = 'fk2',             label = "Peugeot 206"},
	{ name = 'mini',            label = "Smart"},
	{ name = 'polgs350',        label = "Lexus VIR Cruz Roja"},
	{ name = 'ems_gs1200',      label = "Moto GS1200"},
	{ name = 'zendrack',        label = "Mercedes Stilo Zendrack"},
	{ name = 'hcampana',        label = "Hospital de Campaña"},
	{ name = 'polmp4',          label = "MP4"},
	{ name = 'sheriffx6',       label = "BMW X6 Doctor"},
	{ name = 'f150',            label = "Raptor [Jefatura]"},
	{ name = 'pol718',          label = "Porsche [Jefatura]"},
	{ name = 'lguard',          label = "Coche [Socorrista]"},
	{ name = 'blazer2',         label = "Quad [Socorrista]"},
}

Config.AuthorizedHelicopters = {
    { name = 'EC135',       	label = "HELI EMS"}

}

Config.AuthorizedBoats = {
    { name = 'predator',       	label = "Barco EMS"}
}

Config.Hospitals = {

	CentralLosSantos = {
		------------------------------------
		-- TIENE Q SER IGUAL AL DE ARRIBA --
		name = "CentralLosSantos",
		------------------------------------
		Blip = {
			coords = vector3(-830.74, -1216.884, 134.500),
			sprite = 61,
			scale  = 0.7,
			color  = 3
		},

		Cloakrooms = {
			Opciones = {
            	Pos   = {
            	    {x = -826.29, y = -1237.26, z = 6.34 }
            	},
            	Size  = { x = 0.5, y = 0.5, z = 0.5 },
            	Color = { r = 255, g = 0, b = 0 },
            	Type  = 20,
        	}
		},

		Vaults = {
			Opciones = {
            	Pos   = {
            	    {x = -819.84, y = -1242.72, z = 6.34 }
            	},
            	Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 205, g = 205, b = 205 },
				Type  = 27,
        	}
		},

		BossActions = {
			Opciones = {
            	Pos   = { x = -787.34, y = -1247.86, z = 7.34 },
            	Size  = { x = 0.5, y = 0.5, z = 0.5 },
            	Color = { r = 255, g = 255, b = 0 },
            	Type  = 22,
        	}
		},

		Vehicles = {
    	    Opciones = {
    	        Pos        = { x = -825.45, y = -1227.97, z = 6.93 },
    	        SpawnPoint = { x = -827.07, y = -1193.05, z = 5.6 },
    	        Size       = { x = 0.5, y = 0.5, z = 0.5 },
    	        Color      = { r = 255, g = 255, b = 255, a = 60 },
    	        Type       = 36,
    	        Heading    = 140.35,
    	    }
    	},

		Helicopters = {
			Opciones = {
				Pos 		= { x = -789.49, y = -1206.39, z = 51.168 },
				Previev 	= vector3(-790.86, -1191.74, 53.03),
				SpawnPoint  = { x = -790.86, y = -1191.74, z = 53.03 },
				Size       	= { x = 0.5, y = 0.5, z = 0.5 },
    	        Color       = { r = 230, g = 5, b = 10, a = 80 },
    	        Type        = 34,
    	        Heading     = 10.66,
			}
		},

		Boats = {
			Opciones = {
				Pos 		= { x = -806.3804, y = -1496.817, z = 1.595217 },
				SpawnPoint  = { x = -799.4597, y = -1504.365, z = -0.4743996 },
				Size       	= { x = 0.5, y = 0.5, z = 0.5 },
    	        Color       = { r = 255, g = 255, b = 255, a = 80 },
    	        Type        = 35,
    	        Heading     = 105.73590087891,
			}
		},

		VehicleDeleters = {
    		Opciones = {
    		    Pos  = {
					{ x = -841.437, y = -1233.11, z = 5.937201 },
					{ x = -790.86, y = -1191.74, z = 53.03 },
					{ x = -799.3252, y = -1488.57, z = -0.4744618 }
				},
    		    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    		    Color = { r = 255, g = 0, b = 0 },
    		    Type  = 1
    		}
    	},

		FastTravels = {
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

