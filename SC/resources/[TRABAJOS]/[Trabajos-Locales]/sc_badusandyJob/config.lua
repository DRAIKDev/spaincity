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
      Name = "Badu Sandy",
      Pos     = vector3(1966.13, 3738.61, 32.32),
	  Sprite  = 52,
	  Display = 4,
	  Scale   = 0.9,
	  Colour  = 57,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = 1958.91, y = 3746.72, z = 32.34 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = { x = 1956.16, y = 3747.18, z = 31.36 },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = 1971.09, y = 3742.11, z = 31.35 },
            SpawnPoint = { x = 1974.28, y = 3743.87, z = 32.2 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 208.66,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = 1974.28, y = 3743.87, z = 31.2 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = 1959.2, y = 3748.89, z = 32.34 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}