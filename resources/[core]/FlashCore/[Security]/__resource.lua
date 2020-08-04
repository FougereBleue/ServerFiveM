resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

games { 'gta5', 'rdr3' }

files {
	"Newtonsoft.Json.dll"
}

--[[ client_scripts {
	'FlashAC/cl_anticheat.lua',
	'FlashAC/cl_deleteVehModdeur.lua',
	'Flash/FlashAnticheat.Client.net.dll', 
	'Flash/checkcheater.lua',
} ]]

client_scripts { 'FZAC7/FZAC7C.net.dll' }

--[[ server_scripts {
	'FlashAC/srv_anticheat.lua',
	'FlashAC/srv_init.lua',
	'Flash/FlashAnticheat.Server.net.dll',
	'Flash/webhook.lua',
	'FZAC7/server.lua',
	'FZAC7S.net.dll'
} ]]
server_scripts { 
	'FZAC7/server.lua',
	'FZAC7S.net.dll'
}
