Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'stretch',  label = 'Limusina Galaxy' },
}

Config.Blips = {
    Blip = {
      Name = "Galaxy",
      Pos     = vector3(356.02, 304.88, 103.70),
      Sprite  = 121,
      Display = 4,
      Scale   = 0.7,
      Colour  = 48,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = 393.46, y = 278.68, z = 94.0 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = {
                {x = 351.75, y = 288.25, z = 90.22},
                {x = 356.75, y = 281.25, z = 93.22}
            },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = 372.3216, y = 252.8537, z = 102.0097 },
            SpawnPoint = { x = 375.8028, y = 258.097, z = 101.906 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = 375.8028, y = 258.097, z = 101.906 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = 390.46, y = 270.68, z = 94.0 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}