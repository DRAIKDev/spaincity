shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description "Centralized notification system for FiveM by Mole"

ui_page "html/index.html"

client_script "notifications.lua"

export "ShowNotification"
export "ShowAdvancedNotification"
export "ShowProgressBar"
esport "DrawTxt"
export "SetQueueMax"
export "SendNotification"
export "SendSendPrompt"

files {
    "html/*.html",
    "html/*.js",
    "html/*.css",
    "html/themes/*.css",
    "html/*.ttf",
    'html/img/*.png'
}

