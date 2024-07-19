fx_version 'cerulean'
game 'gta5'

description 'QB Menu'
version '1.0'

server_scripts {
  '@qb-core/import.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  'config.lua',
  'client/main.lua'
}

dependencies {
  'qb-core'
}