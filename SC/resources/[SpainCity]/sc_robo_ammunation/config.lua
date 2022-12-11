Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 5
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a Armory after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Armories = {
	["paleto_ammunation"] = {
		position = { x = -330.185, y = 6086.812, z = 31.454 },
		reward = math.random(9000, 15000),
		nameOfArmory = "Ammunation - Paleto Bay",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0
	},
	["sandyshores_ammunation"] = {
		position = { x = 1693.364, y = 3762.575, z = 34.705 },
		reward = math.random(9000, 15000),
		nameOfArmory = "Ammunation - Sandy Shores",
		secondsRemaining = 400, -- seconds
		lastRobbed = 0
	},
	["pillboxhill_ammunation"] = {
		position = { x = 24.08405, y = -1105.65, z = 29.797 },
		reward = math.random(9000, 15000),
		nameOfArmory = "Ammunation - Pillbox Hill",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["vinewood_ammunation"] = {
		position = { x = 253.3711, y = -52.68761, z = 68.94 },
		reward = math.random(9000, 15000),
		nameOfArmory = "Ammunation - Vinewood",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["zancudo_ammunation"] = {
		position = { x = -1117.195, y = 2701.319, z = 17.55 },
		reward = math.random(9000, 15000),
		nameOfArmory = "Ammunation - Fort Zancudo",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["route15_ammunation"] = {
		position = { x = 2565.831, y = 292.4853, z = 107.73 },
		reward = math.random(9000, 15000),
		nameOfArmory = "Ammunation - Route 15",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["puerto_ammunation"] = {
		position = { x = 808.6657, y = -2159.34, z = 29.619 },
		reward = math.random(9000, 15000),
		nameOfArmory = "Ammunation - Puerto",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	}
}
