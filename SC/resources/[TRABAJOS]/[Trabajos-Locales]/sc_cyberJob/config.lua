Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'youga3',  label = 'Furgoneta' },
    { name = 'blista3',  label = 'Coche Mono' }
}

Config.Blips = {
    Blip = {
      Name = "Cyber Bar",
      Pos     = vector3( 334.65, -910.12, 29.26 ),
      Sprite  = 521,
      Display = 4,
      Scale   = 0.7,
      Colour  = 27,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = 323.81, y = -925.65, z = 29.25 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = { x = 334.65, y = -910.12, z = 28.26 },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = 340.46, y = -950.09, z = 28.41 },
            SpawnPoint = { x = 346.78, y = -950.42, z = 29.41 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = 351.2, y = -950.6, z = 28.4 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = 324.1, y = -928.2, z = 29.25 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}