shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield


fx_version 'cerulean'
game 'gta5'

author 'SpainCity'
description 'Script gym Spain'
version '2.0'
 
client_scripts {
  '@es_extended/locale.lua',
  'client/*.lua',
}
server_script {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'server/*.lua',
}


shared_script '@es_extended/imports.lua'










