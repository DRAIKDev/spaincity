Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'stretch',  label = 'Stretch' },
    { name = 'burrito',  label = 'Burrito' }
}

Config.Blips = {
    Blip = {
      Name = "Discoteca Paleto",
      Pos     = vector3(-299.336, 6255.402, 31.533),
	  Sprite  = 614,
      Display = 4,
      Scale   = 0.8,
      Colour  = 7
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = -294.9673, y = 6261.432, z = 25.08531 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = { x = -295.238, y = 6266.363, z = 30.5 },
            Size  = { x = 1.3, y = 1.3, z = 1.0 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = -322.2, y = 6278.1, z = 30.5 },
            SpawnPoint = { x = -327.9, y = 6272.7, z = 31.5 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 131.13,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = -313.2, y = 6287.1, z = 30.5 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = -294.5901, y = 6267.553, z = 34.80166 },
            Size  = { x = 1.0, y = 1.0, z = 1.0 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}