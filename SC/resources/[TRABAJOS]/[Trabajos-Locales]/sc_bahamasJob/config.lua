Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'tourbus',  label = 'Camion Bahamas' },
	{ name = 'patriot2',  label = 'Limusina'}
}

Config.Blips = {
    Blip = {
      Name = "Bahamas",
      Pos     = vector3(-1389.39, -585.45, 30.22),
      Sprite  = 93,
      Display = 4,
      Scale   = 0.7,
      Colour  = 61,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = -1367.41, y = -613.6413, z = 30.21942 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = { x = -1386.76, y = -608.66, z = 29.32 },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = -1393.132, y = -639.093, z = 27.7 },
            SpawnPoint = { x = -1398.42, y = -642.66, z = 27.73 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 104.0,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = -1395.96, y = -654.01, z = 27.68 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = -1366.865, y = -625.64, z = 31.3},
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}