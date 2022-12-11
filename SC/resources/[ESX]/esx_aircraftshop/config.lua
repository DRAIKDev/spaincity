Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnablePaCommand            = false
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 0
Config.Locale                     = 'en'
Config.EnableLicense              = true -- only turn this on if you are using esx_license
Config.LicensePrice               = 90000

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

  ShopEntering = { -- Marker for accessing sho
    Pos   = { x = -941.073, y = -2954.556, z = 19.845 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 30,
  },

  ShopInside = { -- Marker for viewing Vehicles
    Pos     = { x = -1075.01, y = -2933.22, z = 14.55 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 59.9,
    Type    = -1,
  },

  ShopOutside = { -- Marker after purchasing vehicle
    Pos     = { x = -965.25, y = -2983.56, z = 14.55 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 59.9,
    Type    = -1,
  },

  GiveBackVehicle = { -- Marker for Player Management
    Pos   = { x = -1040.79, y = -2991.23, z = 14.55 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

}
