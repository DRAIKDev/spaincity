Config = {}

Config.Locale                     = 'es'
Config.HabilitarDiscordLogs       = true

Config.Cajas = {
    caja1  = {
        { label = 'un Celular', tipo = 'item', nombre = 'phone', cantidad = 1, porcentaje = 20 },
        { label = 'una Zanellita', tipo = 'auto', nombre = '{"color2":0,"modAPlate":-1,"windowTint":-1,"modDoorSpeaker":-1,"modGrille":-1,"pearlescentColor":2,"modSteeringWheel":-1,"modStruts":-1,"modVanityPlate":-1,"modSideSkirt":-1,"modArmor":-1,"model":-1842748181,"modTank":-1,"modArchCover":-1,"modFrame":-1,"modBackWheels":-1,"modShifterLeavers":-1,"modTurbo":false,"tyreSmokeColor":[255,255,255],"modAerials":-1,"modHood":-1,"modHydrolic":-1,"modXenon":false,"dirtLevel":8.0001668930054,"modRearBumper":-1,"modSuspension":-1,"modDial":-1,"modFender":-1,"wheelColor":1,"modAirFilter":-1,"extras":[],"modTrimB":-1,"modDashboard":-1,"modTransmission":-1,"modTrunk":-1,"modSpeakers":-1,"modBrakes":-1,"modOrnaments":-1,"health":1000,"modRightFender":-1,"modExhaust":-1,"modSmokeEnabled":false,"modSpoilers":-1,"modFrontWheels":-1,"modFrontBumper":-1,"modRoof":-1,"modEngine":-1,"modHorns":-1,"modSeats":-1,"modWindows":-1,"plateIndex":0,"plate":"AAA 111","modEngineBlock":-1,"wheels":6,"color1":42,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"neonColor":[255,0,255],"modLivery":-1,"modTrimA":-1}', porcentaje = 55 },
        { label = '$100000', tipo = 'dinero', nombre = 'bank', cantidad = 100000, porcentaje = 20 },
        { label = 'un Rango de Donador', tipo = 'rango', nombre = 'a', porcentaje = 5 }
    },
}

Config.Suministros = {
		ak = {
            { arma = 'weapon_assaultrifle', municion = 250 },
		},
		gusen = {
            { arma = 'weapon_compactrifle', municion = 250 },
        },
		sniper = {
            { arma = 'weapon_sniperrifle', municion = 250 },
        }   	 		
}


Config.Rangos = {

    basico = {
        dinero =    {{ cuenta = 'bank', cantidad = 4500 }}
    },

    oro = {
        dinero =    {{ cuenta = 'bank', cantidad = 12000 }},
    },

    premium = {
        dinero =    {{ cuenta = 'bank', cantidad = 24000 }},
    },

    deluxe = {
        dinero =    {{ cuenta = 'bank', cantidad = 48000 }},
    },

    fundador = {
        dinero =    {{ cuenta = 'bank', cantidad = 96000 }},
    }

}

Config.Autos = {
    camaro = {
         codigo = {'{"modStruts":-1,"modGrille":-1,"modTrimA":-1,"modTank":-1,"modDoorSpeaker":-1,"color2":0,"modArmor":-1,"pearlescentColor":6,"extras":{"5":false,"1":false,"2":true,"3":false,"4":false},"wheels":7,"wheelColor":0,"plate":"AAA 111","modSteeringWheel":-1,"modVanityPlate":-1,"model":986848968,"modHood":-1,"modRearBumper":-1,"modOrnaments":-1,"modBackWheels":-1,"modLivery":-1,"modSpoilers":-1,"modSmokeEnabled":false,"modFrontWheels":-1,"modDial":-1,"modSideSkirt":-1,"modArchCover":-1,"windowTint":-1,"modRoof":-1,"modPlateHolder":-1,"modTrimB":-1,"modHorns":-1,"modSuspension":-1,"modXenon":false,"tyreSmokeColor":[255,255,255],"modTransmission":-1,"modShifterLeavers":-1,"modFender":-1,"modEngine":-1,"color1":0,"modFrame":-1,"modAPlate":-1,"modTurbo":false,"modAirFilter":-1,"modHydrolic":-1,"plateIndex":0,"modFrontBumper":-1,"modSeats":-1,"health":1000,"modExhaust":-1,"modEngineBlock":-1,"modDashboard":-1,"modSpeakers":-1,"modWindows":-1,"neonColor":[255,0,255],"modRightFender":-1,"neonEnabled":[false,false,false,false],"dirtLevel":6.0,"modAerials":-1,"modBrakes":-1,"modTrunk":-1}'}
    },
    mustang = {
        codigo =  {'{"modSpoilers":-1,"modHydrolic":-1,"modDoorSpeaker":-1,"modTank":-1,"modSteeringWheel":-1,"modPlateHolder":-1,"modEngineBlock":-1,"modSuspension":-1,"modBackWheels":-1,"wheelColor":0,"color1":134,"modFrontBumper":-1,"modLivery":-1,"pearlescentColor":0,"color2":134,"modSmokeEnabled":1,"modSeats":-1,"modVanityPlate":-1,"modEngine":-1,"modSpeakers":-1,"wheels":0,"modRightFender":-1,"plateIndex":4,"modFrame":-1,"modSideSkirt":-1,"modHorns":-1,"modDashboard":-1,"plate":"AAA 111","modTrimB":-1,"modDial":-1,"modTrimA":-1,"modAerials":-1,"modAirFilter":-1,"modArmor":-1,"modBrakes":-1,"modGrille":-1,"modTransmission":-1,"modFrontWheels":-1,"modArchCover":-1,"modStruts":-1,"modOrnaments":-1,"modWindows":-1,"modShifterLeavers":-1,"modHood":-1,"neonEnabled":[false,false,false,false],"extras":[],"windowTint":-1,"modRoof":-1,"modTrunk":-1,"neonColor":[255,0,255],"health":1000,"dirtLevel":1.4432698488235,"modFender":-1,"tyreSmokeColor":[255,255,255],"modRearBumper":-1,"modExhaust":-1,"modXenon":false,"model":-372000475,"modTurbo":false,"modAPlate":-1}'}
    },
    a8 = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":0,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":8,"color2":8,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":{"1":true},"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":0,"model":-1997505609,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":134,"dirtLevel":3.349256439833e-05,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":156,"modEngine":-1,"modLivery":-1,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    },
    r8 = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":0,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":31,"color2":0,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":{"5":true,"2":false},"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":7,"model":-2015862033,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":150,"dirtLevel":4.0,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":42,"modEngine":-1,"modLivery":0,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    },
    s1000rr = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":1,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":0,"color2":0,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":{"12":false,"10":false,"11":false},"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":6,"model":-1352072853,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":0,"dirtLevel":10.000004768372,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":0,"modEngine":-1,"modLivery":-1,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    },
    maserati = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":3,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":73,"color2":73,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":[],"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":7,"model":-1907071539,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":60,"dirtLevel":6.0,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":156,"modEngine":-1,"modLivery":1,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    },
    h2 = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":0,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":53,"color2":120,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":{"1":true},"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":6,"model":-1371768796,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":0,"dirtLevel":5.0000157356262,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":55,"modEngine":-1,"modLivery":-1,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    },
    yzf = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":2,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":75,"color2":0,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":[],"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":6,"model":2092873772,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":0,"dirtLevel":6.0000143051147,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":37,"modEngine":-1,"modLivery":4,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    },
    rs7 = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":3,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":4,"color2":4,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":[],"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":7,"model":1813965170,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":111,"dirtLevel":2.0000002384186,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":156,"modEngine":-1,"modLivery":-1,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    },
    startech = {
        codigo =  {'{"modSpoilers":-1,"wheelColor":0,"extras":{"1":false,"2":true},"tyreSmokeColor":[255,255,255],"modTrunk":-1,"modHorns":-1,"modStruts":-1,"model":-2011568302,"modSpeakers":-1,"modWindows":-1,"modAerials":-1,"modTurbo":false,"color1":36,"modEngineBlock":-1,"neonColor":[255,0,255],"plateIndex":0,"modFender":-1,"modSmokeEnabled":false,"modLivery":0,"modEngine":-1,"modFrame":-1,"modExhaust":-1,"modDoorSpeaker":-1,"modSuspension":-1,"modTrimB":-1,"modVanityPlate":-1,"modGrille":-1,"modRearBumper":-1,"modTrimA":-1,"modAPlate":-1,"modOrnaments":-1,"modArchCover":-1,"modRightFender":-1,"modXenon":false,"dirtLevel":2.5701526737976e-06,"modDial":-1,"pearlescentColor":6,"modSeats":-1,"color2":107,"modTransmission":-1,"neonEnabled":[false,false,false,false],"plate":"AAA 111","modAirFilter":-1,"modSteeringWheel":-1,"modRoof":-1,"modPlateHolder":-1,"modBackWheels":-1,"modTank":-1,"wheels":3,"modArmor":-1,"modShifterLeavers":-1,"modHood":-1,"modFrontBumper":-1,"windowTint":-1,"modDashboard":-1,"modSideSkirt":-1,"modBrakes":-1,"health":1000,"modFrontWheels":-1,"modHydrolic":-1}'}
    },
    r32 = {
        codigo =  {'{"modSteeringWheel":-1,"modTank":-1,"modXenon":false,"modDial":-1,"modAirFilter":-1,"pearlescentColor":111,"modExhaust":-1,"modPlateHolder":-1,"modStruts":-1,"modRearBumper":-1,"modSpeakers":-1,"modTransmission":-1,"windowTint":-1,"health":1000,"modSpoilers":-1,"modShifterLeavers":-1,"modHood":-1,"modTrimA":-1,"modFrontBumper":-1,"modSmokeEnabled":false,"modBrakes":-1,"modDashboard":-1,"extras":[],"modRoof":-1,"model":-1045541610,"color2":111,"modSeats":-1,"dirtLevel":2.0,"modFrame":-1,"modArmor":-1,"modSideSkirt":-1,"color1":111,"modOrnaments":-1,"plate":"AAA 111","modRightFender":-1,"wheelColor":156,"modBackWheels":-1,"neonColor":[255,0,255],"modHorns":-1,"modGrille":-1,"tyreSmokeColor":[255,255,255],"plateIndex":3,"modTurbo":false,"wheels":0,"modVanityPlate":-1,"modFrontWheels":-1,"modDoorSpeaker":-1,"modSuspension":-1,"modFender":-1,"modAerials":-1,"modArchCover":-1,"modLivery":-1,"modHydrolic":-1,"modEngine":-1,"modAPlate":-1,"modTrunk":-1,"neonEnabled":[false,false,false,false],"modWindows":-1,"modTrimB":-1,"modEngineBlock":-1}'}
    },
    amg = {
        codigo =  {'{"color1":0,"modTurbo":false,"modTransmission":-1,"windowTint":-1,"modDashboard":-1,"health":1000,"modFrontWheels":-1,"modFrontBumper":-1,"plate":"AAA 111","modDial":-1,"modHorns":-1,"modFender":-1,"wheels":0,"modVanityPlate":-1,"modBrakes":-1,"extras":[],"modArchCover":-1,"modRightFender":-1,"modEngineBlock":-1,"modStruts":-1,"color2":0,"modDoorSpeaker":-1,"modLivery":-1,"plateIndex":0,"modTrimB":-1,"modWindows":-1,"modSuspension":-1,"modRoof":-1,"modRearBumper":-1,"modHood":-1,"pearlescentColor":156,"modSmokeEnabled":false,"modPlateHolder":-1,"modTank":-1,"modFrame":-1,"modArmor":-1,"wheelColor":156,"neonColor":[255,0,255],"modEngine":-1,"modSeats":-1,"neonEnabled":[false,false,false,false],"modSpoilers":-1,"modTrimA":-1,"modOrnaments":-1,"modSideSkirt":-1,"modAirFilter":-1,"modAPlate":-1,"dirtLevel":2.0,"modBackWheels":-1,"modHydrolic":-1,"modSpeakers":-1,"modGrille":-1,"modAerials":-1,"modXenon":false,"modTrunk":-1,"model":-1485523546,"tyreSmokeColor":[255,255,255],"modExhaust":-1,"modShifterLeavers":-1,"modSteeringWheel":-1}'}
    },
    challenger = {
        codigo =  {'{"modTrimA":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modTrimB":-1,"modSpoilers":-1,"plateIndex":4,"modFrame":-1,"modTank":-1,"health":1000,"modSmokeEnabled":false,"modBackWheels":-1,"modOrnaments":-1,"modRearBumper":-1,"modArmor":-1,"modBrakes":-1,"modTrunk":-1,"modSideSkirt":-1,"modAirFilter":-1,"modStruts":-1,"color1":29,"color2":28,"modHorns":-1,"modDoorSpeaker":-1,"modEngineBlock":-1,"modRightFender":-1,"modVanityPlate":-1,"modSpeakers":-1,"modExhaust":-1,"modAerials":-1,"modDashboard":-1,"modTurbo":false,"modTransmission":-1,"modRoof":-1,"extras":{"1":true},"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modArchCover":-1,"wheels":0,"model":-216150906,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"pearlescentColor":28,"dirtLevel":2.0,"modHood":-1,"modWindows":-1,"plate":"AAA 111","wheelColor":0,"modEngine":-1,"modLivery":2,"modAPlate":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modXenon":false,"modDial":-1,"modSuspension":-1,"modShifterLeavers":-1,"modGrille":-1,"modHydrolic":-1,"modSeats":-1}'}
    }
}


