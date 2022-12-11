Config                            = {}
Config.Locale                     = 'en'

--- #### BASICS
Config.EnablePrice = true -- false = bikes for free
Config.EnableEffects = false
Config.EnableBlips = true


--- #### PRICES	
Config.PriceTriBike = 1000
Config.PriceScorcher = 1000
Config.PriceCruiser = 1000
Config.PriceBmx = 1000
Config.PriceBmx22 = 1000


--- #### MARKER EDITS
Config.TypeMarker = 27
Config.MarkerScale = { x = 2.000, y = 2.000, z = 0.500}
Config.MarkerColor = { r = 0, g = 255, b = 255}
	
Config.MarkerZones = { 

    {x = -753.346, y = -1362.60, z = 0.0},
    {x = 5145.961 , y = -4646.315, z = 0.0}

}


-- Edit blip titles
Config.BlipZones = { 

   {title="Alquiler de Barcos", colour=2, id=471, x = -753.346, y = -1362.60, z = -0.474},
   {title="Alquiler de Barcos", colour=2, id=471, x = 5145.961, y = -4646.315, z = -0.474}

}
