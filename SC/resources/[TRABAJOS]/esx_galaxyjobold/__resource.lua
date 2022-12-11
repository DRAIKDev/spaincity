shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Unicorn Job'

version '1.1.0'

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/sv.lua',
  'config.lua',
  'client/*.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/sv.lua',
  'config.lua',
  'server/*.lua'
}









