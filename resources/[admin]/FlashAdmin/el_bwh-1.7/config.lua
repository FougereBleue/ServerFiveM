Config = {}

Config.admin_groups = {"mod","admin","superadmin"} -- groups that can use admin commands
Config.banformat = "⛔BAN⛔!\nMotif: %s\nExpires: %s\nBan par: %s (Ban ID: #%s)" -- message shown when banned (1st %s = reason, 2nd %s = expire, 3rd %s = banner, 4th %s = ban id)
Config.popassistformat = " [%s] Demande de l'aide\n <span class='text-success'> [ID] %s</span>  🔼 pour accepter ou <span class='text-danger'>🔻</span> pour masquer" -- popup assist message format
Config.chatassistformat = " %s Demande de l'aide\n 🔔%s^7  \n^4Raison^7: %s" -- chat assist message format
Config.enable_ban_json = false -- http://<server-ip>:<server-port>/el_bwh/bans.json
Config.enable_warning_json = false -- http://<server-ip>:<server-port>/el_bwh/warnings.json
Config.assist_keys = {accept=208,decline=207} -- keys for accepting/declining assist messages (default = page up, page down) - https://docs.fivem.net/game-references/controls/
-- Config.assist_keys = nil -- coment the line above and uncomment this one to disable assist keys
Config.warning_screentime = 7.5 * 1000 -- warning display length (in ms)
Config.backup_kick_method = false -- set this to true if banned players don't get kicked
Config.discord_webhook = "https://discordapp.com/api/webhooks/719303721443524619/IUvm6EZTWySUGz93Ukg3JvIbfcva7ej1r4GPyMolAxNB9dEkahEauv-x2ODNk2Z23Uxd"
Config.page_element_limit = 250