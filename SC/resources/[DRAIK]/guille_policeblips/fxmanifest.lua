shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'

game 'gta5'

version '1.0'

lua54 'yes'


shared_scripts {
    '@es_extended/imports.lua',
    './Shared/Config.lua'
}


client_scripts {
    './Client/CMain.lua',

    './Client/Commands.lua',
    './Client/Menu.lua',
}

server_scripts {
    
    './Server/SMain.lua',

    './Server/Classes/Ref.lua',
    './Server/Functions/Functions.lua',
}