Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'bmx',         label = 'BMX' },
    { name = 'scorcher',    label = 'Bicicleta de Montaña' },
    { name = 'tribike',     label = 'Bicicleta de Carretera' },
    { name = 'caddy',       label = 'Carrito de Golf' }
}

Config.Blips = {
    Blip = {
      Name = "Gym",
      Pos     = vector3(-1201.2257, -1568.8670, 4.6101),
      Sprite  = 311,
      Display = 4,
      Scale   = 0.5,
      Colour  = 7,
    },
}

Config.Zones = {

    Cloakrooms = {
        Opciones = {
            Pos   = { x = -1196.1311, y = -1579.3383, z = 4.6080 },
            Size  = { x = 0.3, y = 0.3, z = 0.3 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 20,
        }
    },

    Vaults = {
        Opciones = {
            Pos   = { x = -1195.27, y = -1577.28, z = 3.6115 },
            Size  = { x = 0.8, y = 0.8, z = 0.8 },
            Color = { r = 255, g = 255, b = 255 },
            Type  = 27,
        }
    },

    Vehicles = {
        Opciones = {
            Pos        = { x = -1192.5, y = -1569.6, z = 3.4 },
            SpawnPoint = { x = -1185.5, y = -1565.9, z = 4.3 },
            Size       = { x = 1.5, y = 1.5, z = 1.0 },
            Color      = { r = 50, g = 50, b = 204, a = 100 },
            Type       = 27,
            Heading    = 35.71,
        }
    },

    VehicleDeleters = {
        Opciones = {
            Pos   = { x = -1185.5, y = -1565.9, z = 3.3 },
            Size  = { x = 1.5, y = 1.5, z = 0.2 },
            Color = { r = 255, g = 0, b = 0 },
            Type  = 1,
        }
    },

    BossActions = {
        Opciones = {
            Pos   = { x = -1197.5042, y = -1580.0684, z = 4.6080 },
            Size  = { x = 0.5, y = 0.5, z = 0.5 },
            Color = { r = 255, g = 255, b = 0 },
            Type  = 22,
        }
    },
    
}