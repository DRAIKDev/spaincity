Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'paradise',  label = 'Paradise' },
    { name = 'taco2',  label = 'taco' }
}

Config.Blips = {
    Blip = {
      Name =  "Cafeteria Paleto Bay",
      Pos     = vector3(-697.987, 5803.249, 17.330),
	  Sprite  = 480,
	  Display = 4,
	  Scale   = 0.8,
	  Colour  = 21
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = -691.942, y = 5792.863, z = 17.331 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = { x = -695.211, y = 5787.745, z = 16.331 },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = -684.833, y = 5782.903, z = 16.330 },
            SpawnPoint = { x = -676.35, y = 5776.1, z = 16.33 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = -674.27, y = 5779.12, z = 16.33 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = -686.898, y = 5797.795, z = 17.331 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}