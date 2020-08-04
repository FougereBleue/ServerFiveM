fx_version 'adamant'

game 'gta5'

author "Shinteisu"
name "FlashCore"
description 'Flash core file'
version '1.0.0'


------------------{ Gameplay }------------------
----------------{ CarAccident }-----------------


files {
    '**/carAccident/html/index.html',
    '**/carAccident/html/sounds/heartbeat.ogg'
}

client_scripts {
  '**/carAccident/client.lua'
}

ui_page '**/carAccident/html/index.html'


--[[ 
client_script 'dist/client.js'
server_script 'dist/server.js'

dependency 'yarn'
dependency 'webpack'

webpack_config 'client.config.js'
webpack_config 'server.config.js'
webpack_config 'ui.config.js'

files {
    'dist/ui.html'
}

client_scripts {
    "AC-Sync.lua",
}

ui_page 'dist/ui.html'
 ]]

-------------------{ HUD }----------------------
------------------{ F5MEnu }--------------------

dependency 'es_extended'

server_scripts {

	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'**/FlashPersonalMenu/locales/br.lua',
	'**/FlashPersonalMenu/locales/en.lua',
	'**/FlashPersonalMenu/locales/fr.lua',
	'**/FlashPersonalMenu/config.lua',
    '**/FlashPersonalMenu/server/main.lua',
    
}


client_scripts {
	"**/FlashPersonalMenu/dependencies/Wrapper/Utility.lua",
	
	"**/FlashPersonalMenu/dependencies/UIElements/UIVisual.lua",
	"**/FlashPersonalMenu/dependencies/UIElements/UIResRectangle.lua",
	"**/FlashPersonalMenu/dependencies/UIElements/UIResText.lua",
	"**/FlashPersonalMenu/dependencies/UIElements/Sprite.lua",

	"**/FlashPersonalMenu/dependencies/UIMenu/elements/Badge.lua",
	"**/FlashPersonalMenu/dependencies/UIMenu/elements/Colours.lua",
	"**/FlashPersonalMenu/dependencies/UIMenu/elements/StringMeasurer.lua",
	"**/FlashPersonalMenu/dependencies/UIMenu/items/UIMenuItem.lua",
	"**/FlashPersonalMenu/dependencies/UIMenu/items/UIMenuCheckboxItem.lua",
	"**/FlashPersonalMenu/dependencies/UIMenu/items/UIMenuListItem.lua",
	"**/FlashPersonalMenu/dependencies/UIMenu/UIMenu.lua",
	"**/FlashPersonalMenu/dependencies/UIMenu/MenuPool.lua",

	"**/FlashPersonalMenu/dependencies/NativeUI.lua",
}

client_scripts {
	'@es_extended/locale.lua',
	'**/FlashPersonalMenu/locales/br.lua',
	'**/FlashPersonalMenu/locales/en.lua',
	'**/FlashPersonalMenu/locales/fr.lua',
	'**/FlashPersonalMenu/config.lua',
	'**/FlashPersonalMenu/client/main.lua',
	'**/FlashPersonalMenu/other/handsup.lua',
	'**/FlashPersonalMenu/other/pointing.lua',
	'**/FlashPersonalMenu/other/crouch.lua',
}

------------------{ Emotes }--------------------

client_scripts {
	'**/dpemotes/NativeUI.lua',
	'**/dpemotes/Config.lua',
	'**/dpemotes/Client/*.lua'
}

server_scripts {
	'**/dpemotes/Config.lua',
	'@mysql-async/lib/MySQL.lua',
	'**/dpemotes/Server/*.lua'
}
