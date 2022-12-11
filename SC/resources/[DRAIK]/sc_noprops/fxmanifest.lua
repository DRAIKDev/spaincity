shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield


fx_version 'cerulean'

game 'gta5'
lua54 'yes'
author 'Roderic#0001'
description 'Anti no Props'

--Client Scripts-- 
client_scripts {
    'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
    'Server/*.lua'
}

shared_scripts {
    'Shared.lua'
}

escrow_ignore {
    'Shared.lua',
    'Server/*.lua',
}
dependency '/assetpacks'