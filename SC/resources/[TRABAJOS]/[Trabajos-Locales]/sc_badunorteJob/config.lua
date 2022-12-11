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
      Name = "Badu Norte",
      Pos     = vector3(162.03, 6636.64, 31.56),
	  Sprite  = 52,
	  Display = 4,
	  Scale   = 0.9,
	  Colour  = 57,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = 170.0329, y = 6642.381, z = 31.710 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = { x = 166.7984, y = 6646.663, z = 30.710 },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = 144.78, y = 6643.55, z = 30.54 },
            SpawnPoint = { x = 146.5225, y = 6639.532, z = 31.586 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = 146.5225, y = 6639.532, z = 30.586 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = 169.0342, y = 6644.435, z = 31.710 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}