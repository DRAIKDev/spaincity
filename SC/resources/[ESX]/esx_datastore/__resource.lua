shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield


resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Data Store'

version '1.0.2'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/datastore.lua',
	'server/main.lua'
}












