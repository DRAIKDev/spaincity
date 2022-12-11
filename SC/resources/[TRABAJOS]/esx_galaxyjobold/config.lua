Config                            = {}

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'stretch',  label = 'Limusina Galaxy' }
}

Config.Blips = {
    
    Blip = {
      Pos     = vector3(356.02, 304.88, 103.70),
      Sprite  = 121,
      Display = 4,
      Scale   = 0.7,
      Colour  = 48,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = vector3(393.46, 278.68, 94.0),
        Size  = vector3(1.5, 1.5, 1.5),
        Color = { r = 255, g = 0, b = 0 },
        Type  = 20,
    },

    Vault = {
        Pos   =  vector3(351.75, 288.25, 90.22),
        Size  =  vector3(1.5, 1.5, 1.5),
        Color =  { r = 248, g = 248, b = 255 },
        Type  = 27,
    },

    Vault2 = {
        Pos   =  vector3(356.75, 281.25, 93.22),
        Size  =  vector3(1.0, 1.0, 1.0),
        Color =  { r = 248, g = 248, b = 255 },
        Type  = 27,
    },

    Vehicles = {
        Pos          =  vector3(372.3216, 252.8537, 102.0097),
        SpawnPoint   =  vector3(375.8028, 258.097, 101.906),
        Size         =  vector3(1.8, 1.8, 1.0),
        Color        =  { r = 50, g = 50, b = 204, a = 100 },
        Type         = 27,
        Heading      = 249.98799133301,
    },

    VehicleDeleters = {
        Pos   = vector3(375.8028, 258.097, 101.906),
        Size  = vector3(1.5, 1.5, 0.2),
        Color = { r = 255, g = 0, b = 0 },
        Type  = 1,
    },

    BossActions = {
        Pos   = vector3(390.46, 270.68, 94.0),
        Size  = vector3(1.5, 1.5, 1.0),
        Color = { r = 255, g = 255, b = 0 },
        Type  = 22,
    },
    
}

