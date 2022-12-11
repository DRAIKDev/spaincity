Config              = {}
Config.DrawDistance = 5.0
Config.CopsRequired = 4
Config.BlipUpdateTime = 5000 --In milliseconds. I used it on 3000. If you want instant update, 50 is more than enough. Even 100 is good. I hope it doesn't kill FPS and the server.
Config.CooldownMinutes = 50
Config.Locale = 'es'

Config.Blip = false

Config.Zones = {
	VehicleSpawner = {
		Pos   = {x = -1358.57, y = -756.964, z = 21.304},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 0, g = 216, b = 255},
		Type  = 27,
		Colour = 6, --BLIP
		Id     = 229, --BLIP
	},
}

Config.VehicleSpawnPoint = {
      Pos   = {x = -1358.37, y = -756.295, z = 21.304},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Type  = -1,
}

Config.Delivery = {
	--Desert
	--Trevor Airfield 9.22KM
	Delivery1 = {
		Pos      = {x = 2130.68, y = 4781.32, z = 39.87},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 49000,
		Cars = {'IMOLA ','lamboavj','exigev6'},
	},
	--Lighthouse 9.61KM
	Delivery4 = {
		Pos   = {x = 3333.51, y = 5159.91, z = 17.20},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 50000,
		Cars = {'bug300ss','BUGATTI','rmodf40 ','xkgt'},
	},
	--House in Paleto 12.94KM
	Delivery7 = {
		Pos      = {x = -437.56, y = 6254.53, z = 29.02},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 48000,
		Cars = {'bug300ss','BUGATTI','rmodf40 ','xkgt'},
	},
	--Great Ocean Highway 10.47KM
	Delivery10 = {
		Pos      = {x = -2177.51, y = 4269.51, z = 47.93},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 50000,
		Cars = {'bug300ss','BUGATTI','rmodf40 ','xkgt'},
	},
	--Marina Drive Desert 8.15KM
	Delivery13 = {
		Pos      = {x = 895.02, y = 3603.87, z = 31.72},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 49000,
		Cars = {'IMOLA ','lamboavj','exigev6'},
	},
}
