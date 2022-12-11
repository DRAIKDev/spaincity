Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {

    --------------- CEO ---------------

    ["steam:1100001132b99e9"] = 20000, -- Bufas
    ["steam:1100001355bc25a"] = 20000, -- Sergio
    ["steam:11000013738d165"] = 20000, -- Ian
    ["steam:11000013d0c499a"] = 20000, -- Dani
    ["steam:110000118442f1b"] = 20000, --Draik

    --------------- DIRECCIÓN ---------------

    ["steam:11000010399ead1"] = 14000, -- Hoolito | Director de Staff
    ["steam:11000011377a8b4"] = 13000, -- Gabix  | Sub-Director de staff
    ["steam:11000013dec00a3"] = 12000, -- HELENX  | Directora de soportes
    ["steam:11000011cb27678"] = 11000, -- SUNI  | Coordinadora de staff

    -- ADMINISTRADORES --
    ["steam:11000011a00911f"] = 5000, -- ADMIN IC
    ["steam:11000011351f36a"] = 5000, -- ADMIN IC
    ["steam:11000013cdaa0cf"] = 5000, -- ADMIN IC
    ["steam:11000013bdcca91"] = 5000, -- ADMIN IC
    ["steam:11000011b64d8ef"] = 5000, -- ADMIN IC
    ["steam:1100001417bad96"] = 5000, -- ADMIN IC
    ["steam:110000143283d6d"] = 5000, -- ADMIN IC
    ["steam:110000143283d6d"] = 5000, -- ADMIN IC
    ["steam:11000011aef8a84"] = 5000, -- ADMIN IC
    ["steam:11000014026cf03"] = 5000, -- ADMIN IC
    ["steam:11000013cad8922"] = 5000, -- ADMIN IC
    ["steam:11000010952f809"] = 5000, -- ADMIN IC
    ["steam:110000144759b97"] = 5000, -- ADMIN IC
    ["steam:1100001438d16cb"] = 5000, -- ADMIN IC
    ["steam:11000010a2c34fe"] = 5000, -- ADMIN IC
    ["steam:11000010a956bd1"] = 5000, -- ADMIN IC
    ["steam:11000014231107e"] = 5000, -- ADMIN IC
    
 
    ----- VIP -----
    ["steam:11000014304e723"] = 2000, -- VIP FUNDADOR
    ["steam:11000011980ce7e"] = 2000, -- VIP FUNDADOR
    ["steam:11000013e71028e"] = 2000, -- VIP FUNDADOR
    ["steam:1100001430f851c"] = 2000, -- VIP FUNDADOR
    ["steam:110000142f3893a"] = 2000, -- VIP FUNDADOR
    ["steam:1100001198265e4"] = 2000, -- VIP FUNDADOR
    ["steam:110000106d63ff5"] = 2000, -- VIP FUNDADOR
    ["steam:110000108380bae"] = 2000, -- VIP FUNDADOR
    ["steam:11000013660a9d5"] = 2000, -- VIP FUNDADOR
    ["steam:110000142da05cd"] = 2000, -- VIP FUNDADOR
    ["steam:11000010a2ef0d8"] = 2000, -- VIP FUNDADOR
    ["steam:1100001177d192d"] = 2000, -- VIP FUNDADOR
    ["steam:11000014436a045"] = 2000, -- VIP FUNDADOR
    ["steam:11000013b6fb53e"] = 2000, -- VIP FUNDADOR
    ["steam:11000014564d5cf"] = 2000, -- VIP FUNDADOR
    ["steam:11000013c903cdb"] = 2000, -- VIP FUNDADOR
    ["steam:110000105a34a8c"] = 2000, -- VIP FUNDADOR
    ["steam:1100001187fdf0e"] = 2000, -- VIP FUNDADOR
    ["steam:11000013614053d"] = 2000, -- VIP FUNDADOR
    ["steam:110000143b46d77"] = 2000, -- VIP FUNDADOR
    ["steam:11000014585126b"] = 2000, -- VIP FUNDADOR
    ["steam:1100001442f387d"] = 2000, -- VIP FUNDADOR
    ["steam:110000133278bce"] = 2000, -- VIP FUNDADOR
    ["steam:110000111e1a76c"] = 2000, -- VIP FUNDADOR
    ["steam:110000144429050"] = 2000, -- VIP FUNDADOR
    ["steam:1100001000215dc"] = 2000, -- VIP FUNDADOR
    ["steam:110000145a01714"] = 2000, -- VIP FUNDADOR
    ["steam:11000010685e842"] = 2000, -- VIP FUNDADOR
    ["steam:11000013bc23e86"] = 2000, -- VIP FUNDADOR
    ["steam:1100001132b99e9"] = 2000, -- VIP FUNDADOR
    ["steam:110000140c805c7"] = 2000, -- VIP FUNDADOR
    ["steam:11000013dc48ca7"] = 2000, -- VIP FUNDADOR
    ["steam:11000013fd52fd2"] = 2000, -- VIP FUNDADOR
    ["steam:110000141802907"] = 2000,  -- VIP FUNDADOR
    ["steam:1100001436836af"] = 2000,  -- VIP FUNDADOR
    
}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 90

Config.MaxClients = 125
Config.Update = 2000
-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = true

-- how much priority power grace time will give
Config.GracePower = 5

-- how long grace time lasts in seconds
Config.GraceTime = 480

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 40000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Entrando...",
    connecting = "\xE2\x8F\xB3Conectando...",
    idrr = "\xE2\x9D\x97[Cola] Error: No puedo identificarte, intenta reiniciar.",
    err = "\xE2\x9D\x97[Cola] Hubo un error",
    pos = "\xF0\x9F\x90\x8CEstás %d/%d en cola \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Cola] Error: Ha ocurrido un error al conectarte a la cola, por favor reinicia FiveM",
    timedout = "\xE2\x9D\x97[Cola] Error: ¿Desconectado?",
    steam = "\xE2\x9D\x97 [Cola] Error: Se necesita Steam para jugar en este servidor",
    reinicio = "\xE2\x9D\x97 [Cola] El servidor se está reiniciando, espera por favor"
}