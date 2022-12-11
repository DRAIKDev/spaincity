Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 20000-- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(28000, 30000),
		nameOfStore = "24/7. (Paleto Bay)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(28000, 30000),
		nameOfStore = "24/7. (Sandy Shores)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(28000, 30000),
		nameOfStore = "24/7. (Little Seoul)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["ocean_liquor"] = {
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(28000, 30000),
		nameOfStore = "Robs Liquor. (Great Ocean Highway)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(28000, 30000),
		nameOfStore = "Robs Liquor. (El Rancho Blvd)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(28000, 30000),
		nameOfStore = "Robs Liquor. (San Andreas Avenue)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(28000, 30000),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["vanilla_ltd"] = {
		position = { x = 30.36617, y = -1340.115, z = 29.49 },
		reward = math.random(28000, 30000),
		nameOfStore = "24/7. (Innocence Boulevard)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["route13_ltd"] = {
		position = { x = 2674.1, y = 3287.114, z = 55.24 },
		reward = math.random(28000, 30000),
		nameOfStore = "LTD Gasoline. (Route 13)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["grapessed_ltd"] = {
		position = { x = 1707.066, y = 4919.812, z = 42.06 },
		reward = math.random(28000, 30000),
		nameOfStore = "LTD Gasoline. (Grapessed Main Street)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["algonquin_liquor"] = {
		position = { x = 1396.522, y = 3611.727, z = 34.98 },
		reward = math.random(28000, 30000),
		nameOfStore = "Robs Liquor. (Algonquin Boulevard)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["route68_ltd"] = {
		position = { x = 545.0425, y = 2663.713, z = 42.0 },
		reward = math.random(28000, 30000),
		nameOfStore = "24/7. (Route 68)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(28000, 30000),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["boulevard_liquor"] = {
		position = { x = -1479.17, y = -374.341, z = 39.163 },
		reward = math.random(28000, 30000),
		nameOfStore = "Robs Liquor. (Boulevard Del perro)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	}
}
