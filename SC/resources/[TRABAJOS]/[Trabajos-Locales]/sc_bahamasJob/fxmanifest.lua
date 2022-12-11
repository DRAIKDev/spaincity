fx_version 'adamant'

game 'gta5'

description 'ESX bahamas job'

author 'SpainCity'

version '1.1.0'

client_scripts {
  '@es_extended/locale.lua',
  'locales/es.lua',
  'config.lua',
  'client/main.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'locales/es.lua',
  'config.lua',
  'server/main.lua'
}

shared_script '@es_extended/imports.lua'



















shared_script '@SpainCityAC/xDxDxDxDxD.lua' --this line was automatically written by WaveShield