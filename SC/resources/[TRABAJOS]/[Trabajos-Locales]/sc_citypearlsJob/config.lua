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
    { name = 'taco',  label = 'Taco' },
}

Config.Blips = {
    Blip = {
      Name = "Pearls",
      Pos     = vector3( -1816.17, -1192.51, 14.305 ),
      Sprite  = 266,
      Display = 4,
      Scale   = 0.8,
      Colour  = 57,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = -1849.693, y = -1202.053, z = 14.32824 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = {
                { x = -1840.19, y = -1189.18, z = 13.325 },
                { x = -1820.139, y = -1192.79, z = 18.173 }
            },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = -1795.35, y = -1181.44, z = 12.017 },
            SpawnPoint = { x = -1799.8, y = -1177.8, z = 12.017 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 310.7,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = -1790.8, y = -1184.7, z = 12.017 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = -1837.871, y = -1180.39, z = 14.32822 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}