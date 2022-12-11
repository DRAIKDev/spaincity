shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game'gta5'
name 'mrw_minigolf'
description 'script for patoche golf mapping'
author 'Morow'

client_scripts{
    'client/*.lua'
}

server_script{
    'server/*.lua'
}

shared_scripts{
    'shared/*.lua',
    'shared/translation/*.lua'
}

files{
    'ui/ui.html',
    'ui/script/app.js',
    'ui/css/app.css',
    'ui/font/*.woff'
}

ui_page 'ui/ui.html'



