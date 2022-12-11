shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'

game 'gta5'

description 'ESX galaxy job'

author 'Juansane'

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

