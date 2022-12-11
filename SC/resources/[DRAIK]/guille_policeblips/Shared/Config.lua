Cfg = {} or Cfg

Cfg.Colors = { -- https://docs.fivem.net/docs/game-references/blips/ Bottom of the page
    {label = "CNP MANDO", color = 3},
    {label = "CNP 4-88", color = 48},
    {label = "CNP SIERRA/FALCON", color = 2},
    {label = "CNP GEO", color = 46},
    {label = "MOSSOS", color = 17}
}

Cfg.AllowedJobs = { -- Jobs allowed to use references
    [1] = "cnp",
    [2] = "military"
}

Cfg.JobsIcons = { -- Icons in the beginning of https://docs.fivem.net/docs/game-references/blips/ (You can leave this white)
    ["cnp"] = 60,
    ["military"] = 60
}

Cfg.RefreshRate = 3000 -- Refresh rate from server to client

Cfg.OpenCommand = "refs" -- Command to open the reference menu

Cfg.Strings = {
    [1] = "Has activado tu radar",
    [2] = "Has desactivado tu radar",
    [3] = "Activa todas las referencias antes",
    [4] = 'Referencias activadas',
    [5] = 'Referencias desactivadas',
    [6] = 'Tu trabajo no usa referencias',
    [7] = "Abre el menu de referencias",
    [8] = "Menu de referencias",
    [9] = "Ensenar/ocultar referencias",
    [10] = "Ensenar/ocultar tu propio radar",
    [11] = "Color",
    [12] = "Colores",
}