Config = {}
Config.DoorList = {}
Config.ShowUnlockedText = false
Config.CheckVersion = true

-- Allow players with access to /newdoor to open any door
Config.AdminAccess = false


-- 
table.insert(Config.DoorList, {
	locked = true,
	authorizedJobs = { ['cnp']=0 },
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -96679321, objHeading = 270.00003051758, objCoords = vector3(479.7534, -988.6204, 30.82319)},
		{objHash = -1406685646, objHeading = 270.00003051758, objCoords = vector3(479.7534, -986.2151, 30.82319)}
 },
	audioRemote = false,
	lockpick = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	authorizedJobs = { ['cnp']=0 },
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -288803980, objHeading = 89.999977111816, objCoords = vector3(469.4406, -987.4377, 30.82319)},
		{objHash = -288803980, objHeading = 270.00003051758, objCoords = vector3(469.4406, -985.0313, 30.82319)}
 },
	audioRemote = false,
	lockpick = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	audioRemote = false,
	objHash = 149284793,
	garage = false,
	authorizedJobs = { ['cnp']=0 },
	lockpick = false,
	maxDistance = 2.0,
	objHeading = 225.02824401855,
	fixText = false,
	objCoords = vector3(458.0894, -995.5247, 30.82319),			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	audioRemote = false,
	objHash = -96679321,
	garage = false,
	authorizedJobs = { ['cnp']=0 },
	lockpick = false,
	maxDistance = 2.0,
	objHeading = 270.00003051758,
	fixText = false,
	objCoords = vector3(458.6543, -990.6498, 30.82319),			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['ambulance']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 665455406, objHeading = 21.999935150146, objCoords = vector3(-445.4264, -320.6447, 35.06686)},
		{objHash = 665455406, objHeading = 202.0, objCoords = vector3(-443.0124, -319.6694, 35.06686)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['ambulance']=0 },
	objCoords = vector3(-451.4746, -309.0658, 35.06632),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 493136920,
	slides = false,
	lockpick = false,
	objHeading = 112.0,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['ambulance']=0 },
	objCoords = vector3(-442.589, -317.0564, 35.06619),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 493136920,
	slides = false,
	lockpick = false,
	objHeading = 112.0,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['ambulance']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 665455406, objHeading = 202.00001525879, objCoords = vector3(-455.8128, -288.2954, 35.06949)},
		{objHash = 665455406, objHeading = 21.999977111816, objCoords = vector3(-458.2174, -289.2669, 35.06949)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-205.6828, -1310.683, 30.29572),
	audioRemote = false,
	garage = true,
	locked = true,
	objHash = -427498890,
	slides = true,
	lockpick = false,
	objHeading = 0.0,
	fixText = false,
	maxDistance = 6.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-206.2869, -1342.289, 35.05238),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1289778077,
	slides = false,
	lockpick = false,
	objHeading = 89.999977111816,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-206.2711, -1330.755, 35.05238),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1289778077,
	slides = false,
	lockpick = false,
	objHeading = 270.0,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-205.2142, -1328.09, 29.84439),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 161378502,
	slides = true,
	lockpick = false,
	objHeading = 0.0,
	fixText = false,
	maxDistance = 6.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['taxi']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 245182344, objHeading = 327.72875976563, objCoords = vector3(901.7643, -163.4973, 74.24893)},
		{objHash = -681066206, objHeading = 148.55776977539, objCoords = vector3(899.5616, -162.1285, 74.24893)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['taxi']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -2023754432, objHeading = 237.93087768555, objCoords = vector3(895.3171, -177.8906, 74.84023)},
		{objHash = -2023754432, objHeading = 57.945709228516, objCoords = vector3(893.9391, -180.0906, 74.84023)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1849.949, 3688.95, 34.42121),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1425448544,
	slides = false,
	lockpick = false,
	objHeading = 29.999992370605,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1856.371, 3688.958, 34.42121),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1425448544,
	slides = false,
	lockpick = false,
	objHeading = 345.00003051758,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1849.517, 3681.392, 34.42121),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1425448544,
	slides = false,
	lockpick = false,
	objHeading = 300.0,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1851.186, 3682.832, 30.42789),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1196497453,
	slides = false,
	lockpick = false,
	objHeading = 29.999992370605,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1425448544, objHeading = 29.999992370605, objCoords = vector3(1849.6, 3680.882, 30.41899)},
		{objHash = -1425448544, objHeading = 210.0, objCoords = vector3(1847.588, 3679.721, 30.41899)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1856.628, 3685.281, 30.42789),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1196497453,
	slides = false,
	lockpick = false,
	objHeading = 29.999992370605,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1864.683, 3689.031, 30.42393),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1486622150,
	slides = false,
	lockpick = false,
	objHeading = 119.99995422363,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1863.026, 3691.902, 30.42393),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1486622150,
	slides = false,
	lockpick = false,
	objHeading = 119.99995422363,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1860.672, 3695.978, 30.42393),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1486622150,
	slides = false,
	lockpick = false,
	objHeading = 119.99995422363,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1855.669, 3701.032, 30.42789),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1196497453,
	slides = false,
	lockpick = false,
	objHeading = 30.000001907349,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(1857.579, 3698.254, 34.42121),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1425448544,
	slides = false,
	lockpick = false,
	objHeading = 29.999992370605,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -2023754432, objHeading = 135.00007629395, objCoords = vector3(-447.7283, 6006.702, 31.86523)},
		{objHash = -2023754432, objHeading = 315.01037597656, objCoords = vector3(-449.5656, 6008.538, 31.86523)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(-450.7136, 6016.371, 31.86523),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -2023754432,
	slides = false,
	lockpick = false,
	objHeading = 315.22174072266,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -2023754432, objHeading = 225.06103515625, objCoords = vector3(-441.0185, 6012.795, 31.86523)},
		{objHash = -2023754432, objHeading = 44.84232711792, objCoords = vector3(-442.8578, 6010.958, 31.86523)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(-439.1576, 5998.157, 31.86815),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 749848321,
	slides = false,
	lockpick = false,
	objHeading = 225.0,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(-450.9664, 6006.086, 31.99004),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -2023754432,
	slides = false,
	lockpick = false,
	objHeading = 135.00007629395,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(-447.2363, 6002.317, 31.84003),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -2023754432,
	slides = false,
	lockpick = false,
	objHeading = 314.99993896484,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['military']=0 },
	objCoords = vector3(-438.228, 6006.167, 28.13558),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1927754726,
	slides = false,
	lockpick = false,
	objHeading = 44.999965667725,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbyellow']=0 },
	objCoords = vector3(1991.106, 3053.105, 47.36529),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -287662406,
	slides = false,
	lockpick = false,
	objHeading = 147.78309631348,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbyellow']=0 },
	objCoords = vector3(1980.096, 3050.508, 50.65685),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -330224254,
	slides = false,
	lockpick = false,
	objHeading = 328.27145385742,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['vanilla']=0 },
	objCoords = vector3(127.9579, -1298.507, 29.41817),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1116041313,
	slides = false,
	lockpick = false,
	objHeading = 29.999952316284,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['vanilla']=0 },
	objCoords = vector3(127.4773, -1277.919, 29.40505),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 634417522,
	slides = false,
	lockpick = false,
	objHeading = 299.82354736328,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['vanilla']=0 },
	objCoords = vector3(102.4414, -1301.2, 29.40505),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 634417522,
	slides = false,
	lockpick = false,
	objHeading = 299.82354736328,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['bahamas']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1119680854, objHeading = 212.48086547852, objCoords = vector3(-1387.07, -586.5471, 30.51987)},
		{objHash = -1119680854, objHeading = 33.4186668396, objCoords = vector3(-1389.234, -587.9568, 30.51987)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['bahamas']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1747430008, objHeading = 346.76397705078, objCoords = vector3(-1379.36, -596.4199, 30.87399)},
		{objHash = -1747430008, objHeading = 166.76397705078, objCoords = vector3(-1377.416, -596.8777, 30.8745)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['bahamas']=0 },
	objCoords = vector3(-1371.195, -607.1619, 30.86444),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 401003935,
	slides = false,
	lockpick = false,
	objHeading = 256.30111694336,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['bahamas']=0 },
	objCoords = vector3(-1393.305, -624.9542, 30.4685),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 401003935,
	slides = false,
	lockpick = false,
	objHeading = 346.07363891602,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['bahamas']=0 },
	objCoords = vector3(-1394.165, -635.7523, 29.57242),
	audioRemote = false,
	garage = true,
	locked = true,
	objHash = -822900180,
	slides = true,
	lockpick = false,
	objHeading = 302.79895019531,
	fixText = false,
	maxDistance = 6.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['bahamas']=0 },
	objCoords = vector3(-1391.636, -640.3448, 28.87561),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -2003105485,
	slides = false,
	lockpick = false,
	objHeading = 122.99992370605,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['tequila']=0 },
	objCoords = vector3(-565.1712, 276.6259, 83.28626),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 993120320,
	slides = false,
	lockpick = false,
	objHeading = 355.00003051758,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['tequila']=0 },
	objCoords = vector3(-561.2866, 293.5044, 87.77851),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 993120320,
	slides = false,
	lockpick = false,
	objHeading = 175.00003051758,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['tequila']=0 },
	objCoords = vector3(-560.2373, 293.0106, 82.32609),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -626684119,
	slides = false,
	lockpick = false,
	objHeading = 265.00006103516,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['galaxy']=0 },
	objCoords = vector3(355.6923, 301.0186, 104.2022),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1989765534,
	slides = false,
	lockpick = false,
	objHeading = 165.6577911377,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbbadunorte']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 997554217, objHeading = 314.88967895508, objCoords = vector3(163.4288, 6636.119, 31.86056)},
		{objHash = 1196685123, objHeading = 134.88967895508, objCoords = vector3(161.5932, 6637.961, 31.86056)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbdiscoteca']=0 },
	objCoords = vector3(-308.903, 6272.304, 31.86108),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1671830748,
	slides = false,
	lockpick = false,
	objHeading = 223.29232788086,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbdiscoteca']=0 },
	objCoords = vector3(-301.8045, 6271.441, 31.66054),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1743859485,
	slides = false,
	lockpick = false,
	objHeading = 313.29232788086,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbcafeteria']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1033983061, objHeading = 65.081565856934, objCoords = vector3(-694.7182, 5803.066, 17.52943)},
		{objHash = -1033983061, objHeading = 245.09957885742, objCoords = vector3(-695.6858, 5800.984, 17.5304)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbcafeteria']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 473423708, objHeading = 64.716606140137, objCoords = vector3(-701.7103, 5790.468, 17.64076)},
		{objHash = 473423708, objHeading = 245.09957885742, objCoords = vector3(-702.7004, 5788.391, 17.64029)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbcafeteria']=0 },
	objCoords = vector3(-687.3004, 5794.58, 17.5999),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1890297615,
	slides = false,
	lockpick = false,
	objHeading = 243.54058837891,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['pbcafeteria']=0 },
	objCoords = vector3(-688.7421, 5793.461, 17.49037),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1128607325,
	slides = false,
	lockpick = false,
	objHeading = 334.13137817383,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1843224684, objHeading = 139.86227416992, objCoords = vector3(-1909.624, 2073.472, 140.9152)},
		{objHash = 1843224684, objHeading = 319.82238769531, objCoords = vector3(-1907.732, 2071.878, 140.9131)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1843224684, objHeading = 139.86227416992, objCoords = vector3(-1912.101, 2075.56, 140.9149)},
		{objHash = 1843224684, objHeading = 319.82238769531, objCoords = vector3(-1910.209, 2073.969, 140.9131)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1843224684, objHeading = 49.61771774292, objCoords = vector3(-1910.202, 2080.679, 140.9115)},
		{objHash = 1843224684, objHeading = 229.58535766602, objCoords = vector3(-1911.81, 2078.795, 140.9115)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1843224684, objHeading = 229.58535766602, objCoords = vector3(-1907.596, 2083.744, 140.9115)},
		{objHash = 1843224684, objHeading = 49.61771774292, objCoords = vector3(-1905.994, 2085.627, 140.9115)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1843224684, objHeading = 139.72131347656, objCoords = vector3(-1902.882, 2086.545, 140.9168)},
		{objHash = 1843224684, objHeading = 319.81390380859, objCoords = vector3(-1900.994, 2084.947, 140.9188)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1843224684, objHeading = 139.72131347656, objCoords = vector3(-1900.406, 2084.447, 140.9146)},
		{objHash = 1843224684, objHeading = 319.81390380859, objCoords = vector3(-1898.514, 2082.852, 140.9153)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1077118233, objHeading = 140.69152832031, objCoords = vector3(-1894.73, 2075.967, 141.3125)},
		{objHash = 1077118233, objHeading = 319.49935913086, objCoords = vector3(-1892.833, 2074.381, 141.3085)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1077118233, objHeading = 159.57081604004, objCoords = vector3(-1887.243, 2074.308, 141.3125)},
		{objHash = 1077118233, objHeading = 340.16311645508, objCoords = vector3(-1884.921, 2073.462, 141.3085)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1077118233, objHeading = 159.57081604004, objCoords = vector3(-1875.614, 2070.068, 141.3125)},
		{objHash = 1077118233, objHeading = 340.16311645508, objCoords = vector3(-1873.294, 2069.22, 141.3085)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia03']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1077118233, objHeading = 179.76045227051, objCoords = vector3(-1861.689, 2054.116, 141.3536)},
		{objHash = 1077118233, objHeading = 0.50771337747574, objCoords = vector3(-1859.214, 2054.118, 141.3535)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 1901183774, objHeading = 0.0, objCoords = vector3(0, 0, 0)},
		{objHash = 262671971, objHeading = 89.999961853027, objCoords = vector3(1395.92, 1140.705, 114.7902)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1032171637, objHeading = 89.667892456055, objCoords = vector3(1395.877, 1151.659, 114.4666)},
		{objHash = -52575179, objHeading = 89.667892456055, objCoords = vector3(1395.891, 1153.858, 114.4666)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1032171637, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1144.054, 114.4869)},
		{objHash = -52575179, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1146.254, 114.4869)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1032171637, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1146.254, 114.4869)},
		{objHash = -52575179, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1148.454, 114.4869)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1032171637, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1148.454, 114.4869)},
		{objHash = -52575179, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1150.654, 114.4869)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -52575179, objHeading = 90.11840057373, objCoords = vector3(1408.167, 1161.155, 114.4873)},
		{objHash = -1032171637, objHeading = 89.667892456055, objCoords = vector3(1408.157, 1158.956, 114.4873)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1032171637, objHeading = 179.99998474121, objCoords = vector3(1399.393, 1128.314, 114.4836)},
		{objHash = -52575179, objHeading = 179.99998474121, objCoords = vector3(1399.393, 1128.314, 114.4836)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	lockpick = false,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -1032171637, objHeading = 179.99998474121, objCoords = vector3(1401.59, 1128.314, 114.4836)},
		{objHash = -52575179, objHeading = 179.99998474121, objCoords = vector3(1401.588, 1128.314, 114.4836)}
 },
	maxDistance = 2.5,
	locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia02']=0 },
	objCoords = vector3(1407.547, 1128.329, 114.4855),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 262671971,
	slides = false,
	lockpick = false,
	objHeading = 180.06739807129,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia01']=0 },
	objCoords = vector3(-1535.985, 130.4704, 57.75053),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = 1033441082,
	slides = false,
	lockpick = false,
	objHeading = 137.45500183105,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia01']=0 },
	objCoords = vector3(-1500.401, 104.144, 55.80867),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1563640173,
	slides = false,
	lockpick = false,
	objHeading = 227.32369995117,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['mafia01']=0 },
	objCoords = vector3(-1523.062, 143.6533, 55.80905),
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1563640173,
	slides = false,
	lockpick = false,
	objHeading = 316.63739013672,
	fixText = false,
	maxDistance = 2.0,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 159.57081604004,
	locked = true,
	maxDistance = 2.0,
	audioRemote = false,
	fixText = false,
	lockpick = false,
	objCoords = vector3(-1890.225, 2052.236, 141.3125),
	slides = false,
	objHash = 1077118233,
	garage = false,
	authorizedJobs = { ['mafia03']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	doors = {
		{objHash = -956579645, objHeading = 0.0, objCoords = vector3(0, 0, 0)},
		{objHash = 218085040, objHeading = 165.00001525879, objCoords = vector3(299.8297, -907.4099, 28.28801)}
 },
	slides = true,
	locked = true,
	maxDistance = 6.0,
	authorizedJobs = { ['cyber']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 0.0,
	locked = true,
	maxDistance = 2.0,
	audioRemote = false,
	fixText = false,
	lockpick = false,
	objCoords = vector3(341.4532, -939.6378, 29.56765),
	slides = false,
	objHash = 1925421092,
	garage = false,
	authorizedJobs = { ['cyber']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 149.43891906738,
	locked = true,
	maxDistance = 2.0,
	audioRemote = false,
	fixText = false,
	lockpick = false,
	objCoords = vector3(-1835.857, -1183.187, 14.41285),
	slides = false,
	objHash = 1226684428,
	garage = false,
	authorizedJobs = { ['citypearls']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 329.80181884766,
	locked = true,
	maxDistance = 2.0,
	audioRemote = false,
	fixText = false,
	lockpick = false,
	objCoords = vector3(-1840.717, -1191.361, 13.33504),
	slides = false,
	objHash = 1044811355,
	garage = false,
	authorizedJobs = { ['citypearls']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	doors = {
		{objHash = -845944160, objHeading = 150.68878173828, objCoords = vector3(-1816.14, -1194.73, 13.32605)},
		{objHash = -845944160, objHeading = 329.57287597656, objCoords = vector3(-1817.696, -1193.834, 13.32605)}
 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	authorizedJobs = { ['citypearls']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	doors = {
		{objHash = -845944160, objHeading = 59.678939819336, objCoords = vector3(-1842.927, -1199.793, 13.32605)},
		{objHash = -845944160, objHeading = 239.82064819336, objCoords = vector3(-1842.026, -1198.24, 13.32605)}
 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	authorizedJobs = { ['citypearls']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 329.45733642578,
	locked = true,
	maxDistance = 2.0,
	audioRemote = false,
	fixText = false,
	lockpick = false,
	objCoords = vector3(-1831.589, -1181.016, 13.32241),
	slides = false,
	objHash = 175957109,
	garage = false,
	authorizedJobs = { ['citypearls']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	locked = true,
	maxDistance = 2.5,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 546378757, objHeading = 336.21197509766, objCoords = vector3(-137.7991, 973.7089, 236.1143)},
		{objHash = -1249591818, objHeading = 336.21197509766, objCoords = vector3(-132.7885, 971.5002, 236.1143)}
 },
	authorizedJobs = { ['mafia04']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(-1462.425, 65.71588, 53.38676),
	garage = false,
	objHeading = 9.4999742507935,
	authorizedJobs = { ['mafia01']=0 },
	objHash = -1859471240,
	locked = true,
	maxDistance = 2.0,
	lockpick = false,
	audioRemote = false,
	slides = false,
	fixText = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(-1474.129, 68.38937, 52.52709),
	garage = false,
	objHeading = 4.9999694824219,
	authorizedJobs = { ['mafia01']=0 },
	objHash = -2125423493,
	locked = true,
	maxDistance = 6.0,
	lockpick = false,
	audioRemote = false,
	slides = true,
	fixText = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(-1616.232, 79.7792, 60.7787),
	garage = false,
	objHeading = 329.00003051758,
	authorizedJobs = { ['mafia01']=0 },
	objHash = -2125423493,
	locked = true,
	maxDistance = 6.0,
	lockpick = false,
	audioRemote = false,
	slides = true,
	fixText = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})