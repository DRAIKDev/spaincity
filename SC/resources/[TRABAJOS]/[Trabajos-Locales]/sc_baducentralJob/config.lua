Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'burrito3',  label = 'Burrito' },
    { name = 'taco',  label = 'Taco' }
}

Config.Blips = {
    Blip = {
      Name = "Badu Central",
      Pos     = vector3(-709.358, -907.051, 19.215),
	  Sprite  = 52,
	  Display = 4,
      Scale   = 0.9,
      Colour  = 57
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = -709.9193, y = -907.3788, z = 19.21559 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = {
                { x = -705.625, y = -905.309, z = 18.215 },
                { x = -699.135, y = -909.604, z = 22.764}
            },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 205, g = 205, b = 205 },
			Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = -727.39, y = -909.19, z = 18.01 },
            SpawnPoint = { x = -730.32, y = -912.02, z = 18.04 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 180.47,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = -729.5614, y = -919.412, z = 18.014 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = -709.439, y = -905.605, z = 19.215 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}