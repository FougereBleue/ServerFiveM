resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


description 'flash_police'

version '1.0.2'

ui_page 'jsfour-criminalrecord/html/index.html'
ui_page "esx_policemdt/html/warrants_list.html"
ui_page 'esx_police_cad/ui/index.html'

client_scripts {
    "config.lua",
	'**/Bloodutils.lua',
	'**/client.lua',
    "**/client/main.lua",
    '@es_extended/locale.lua',
    'esx_PoliceGarage/locales/en.lua',
    'fn_illegals/locales/en.lua',
	"**/client/utils.lua",
	"**/client/client.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    "config.lua",
	'**/Bloodutils.lua',
    "**/server/main.lua",
	'**/server.lua',
    '@es_extended/locale.lua',
    '**/locales/en.lua',
	"**/server/server.lua"
}


files {
	'jsfour-criminalrecord/html/index.html',
	'jsfour-criminalrecord/html/assets/css/*.css',
	'jsfour-criminalrecord/html/assets/js/*.js',
	'jsfour-criminalrecord/html/assets/fonts/roboto/*.woff',
	'jsfour-criminalrecord/html/assets/fonts/roboto/*.woff2',
	'jsfour-criminalrecord/html/assets/fonts/justsignature/JustSignature.woff',
	'jsfour-criminalrecord/html/assets/fonts/handwritten/Handwritten.woff',
	'jsfour-criminalrecord/html/assets/images/*.png',
	'esx_policemdt/html/css/images/ui-bg_glass_55_fbf9ee_1x400.png',
	'esx_policemdt/html/css/images/ui-bg_glass_65_ffffff_1x400.png',
	'esx_policemdt/html/css/images/ui-bg_glass_75_dadada_1x400.png',
	'esx_policemdt/html/css/images/ui-bg_glass_75_e6e6e6_1x400.png',
	'esx_policemdt/html/css/images/ui-bg_glass_95_fef1ec_1x400.png',
	'esx_policemdt/html/css/images/ui-bg_highlight-soft_75_cccccc_1x100.png',
	'esx_policemdt/html/css/images/ui-icons_2e83ff_256x240.png',
	'esx_policemdt/html/css/images/ui-icons_222222_256x240.png',
	'esx_policemdt/html/css/images/ui-icons_454545_256x240.png',
	'esx_policemdt/html/css/images/ui-icons_888888_256x240.png',
	'esx_policemdt/html/css/images/ui-icons_cd0a0a_256x240.png',
	'esx_policemdt/html/css/jquery-ui.css',
	'esx_policemdt/html/js/jquery-ui.min.js',
	'esx_policemdt/html/script.js',
	'esx_policemdt/html/js/angular.min.js',
	"esx_policemdt/html/warrants_list.html",
	"esx_policemdt/html/bootstrap/css/bootstrap.css",
	"esx_policemdt/html/bootstrap/css/bootstrap.min.css",
	"esx_policemdt/html/bootstrap/fonts/glyphicons-halflings-regular.eot",
	"esx_policemdt/html/bootstrap/fonts/glyphicons-halflings-regular.svg",
	"esx_policemdt/html/bootstrap/fonts/glyphicons-halflings-regular.ttf",
	"esx_policemdt/html/bootstrap/fonts/glyphicons-halflings-regular.woff",
	"esx_policemdt/html/bootstrap/fonts/glyphicons-halflings-regular.woff2",
	"esx_policemdt/html/bootstrap/js/bootstrap.js",
	"esx_policemdt/html/bootstrap/js/bootstrap.min.js",
	"esx_policemdt/html/css/local.css",
	"esx_policemdt/html/js/jquery-1.10.2.min.js",
	"esx_policemdt/html/js/shieldui-all.min.js",
	'esx_policemdt/html/font-awesome/css/font-awesome.min.css',
	'esx_policemdt/html/font-awesome/css/font-awesome.css',
	'esx_policemdt/html/font-awesome/fonts/FontAwesome.otf',
	'esx_policemdt/html/font-awesome/fonts/fontawesome-webfont.eot',
	'esx_policemdt/html/font-awesome/fonts/fontawesome-webfont.svg',
	'esx_policemdt/html/font-awesome/fonts/fontawesome-webfont.ttf',
	'esx_policemdt/html/font-awesome/fonts/fontawesome-webfont.woff',
	'esx_policemdt/html/font-awesome/fonts/fontawesome-webfont.woff2',
	'esx_police_cad/ui/index.html',
	'esx_police_cad/ui/css/style.css',
	'esx_police_cad/ui/scripts/app.js',
	'esx_police_cad/ui/scripts/jquery.js',
	'esx_police_cad/ui/images/LSPD_logo_GTA_V.png',
}

dependencies {
	'es_extended',
	'esx_policejob'
}