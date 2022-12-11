shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version "adamant"
games {"gta5"}
author 'Draik'
description 'Script for SC'
version '0.1'
server_script "server/main.lua"
client_script "client/client.lua"
shared_script "config.lua"
ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/script.js',
    'html/main.css'
}