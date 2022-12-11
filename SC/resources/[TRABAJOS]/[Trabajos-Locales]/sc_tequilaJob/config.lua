Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'tourbus',  label = 'Camion Tequila' },
	{ name = 'Stretch',  label = 'Limosina' },
}

Config.Blips = {
    Blip = {
      Name = "Tequila la",
      Pos     = vector3(-565.14, 273.15, 83.01),
      Sprite  = 93,
      Display = 4,
      Scale   = 0.7,
      Colour  = 28,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = -568.46, y = 291.65, z = 79.23 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = {
                {x = -561.82, y = 289.54, z = 81.22 },
                {x = -565.30, y = 284.75, z = 84.41 },
                {x = -565.64, y = 295.79, z = 82.10 },
                {x = -569.52, y = 277.52, z = 93.15 }
            },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 205, g = 205, b = 205 },
			Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = -565.41, y = 300.32, z = 82.14 },
            SpawnPoint = { x = -562.37, y = 301.92, z = 82.2 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = -554.57, y = 307.2, z = 82.34 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = -573.1419, y = 294.0314, z = 79.1767 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}