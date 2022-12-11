Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'tourbus',  label = 'Camion Vanilla' },
	{ name = 'Stretch',  label = 'Limusina' }
}

Config.Blips = {
    Blip = {
      Name = "Vanilla",
      Pos     = vector3(128.02, -1305.88, 28.22),
      Sprite  = 121,
      Display = 4,
      Scale   = 0.7,
      Colour  = 48,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = 105.2, y = -1303.2, z = 28.8 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = {
                { x = 129.6, y = -1283.7, z = 28.3},
                { x = 135.9, y = -1278.99, z = 28.4}
            },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 205, g = 205, b = 205 },
			Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = 143.74, y = -1290.54, z = 28.39 },
            SpawnPoint = { x = 144.99, y = -1274.36, z = 28.13 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = 145.72, y = -1277.1, z = 28.09 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = 95.2, y = -1295.2, z = 29.3 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}