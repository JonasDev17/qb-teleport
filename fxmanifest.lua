fx_version 'cerulean'
game 'gta5'

description 'QB-Teleport'
version '1.0.0'

shared_script 'config.lua'
server_script 'server/*.lua'
client_script 'client/*.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua'
}

lua54 'yes'