shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield


resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description 'ink - ESX Animations'

version '1.0.0'

client_scripts {
	'config.lua',
	'client/main.lua'

}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua'
}

dependency 'es_extended'














