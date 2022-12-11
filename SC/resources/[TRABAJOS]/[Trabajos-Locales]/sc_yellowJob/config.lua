Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'ratloader2',  label = 'Rat-Truck' },
    { name = 'rrocket',  label = 'Rampant Rocket Tricycle' }
}

Config.Blips = {
    Blip = {
      Name = "Yellow Jack",
      Pos  = vector3(1993.338, 3081.908, 47.009),
	  Sprite  = 93,
	  Display = 4,
	  Scale   = 0.8,
	  Colour  = 63
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = 1995.555, y = 3049.949, z = 47.215 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = {
                { x = 1984.678, y = 3049.048, z = 46.215},
                { X = 1983.028, y = 3049.748, z = 49.443}
            },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 205, g = 205, b = 205 },
			Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = 1991.286, y = 3033.888, z = 46.053 },
            SpawnPoint = { x = 1977.19, y = 3039.0, z = 46.06 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = 1989.26, y = 3030.57, z = 46.06 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = 1993.174, y = 3051.375, z = 47.215 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}