resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

author {'POLO'}

client_scripts {
    'dependencies/Wrapper/Utility.lua',
    
    'dependencies/UIElements/UIVisual.lua',
    'dependencies/UIElements/UIResRectangle.lua',
    'dependencies/UIElements/UIResText.lua',
    'dependencies/UIElements/Sprite.lua',

    'dependencies/UIMenu/elements/Badge.lua',
    'dependencies/UIMenu/elements/Colours.lua',
    'dependencies/UIMenu/elements/StringMeasurer.lua',
    'dependencies/UIMenu/items/UIMenuItem.lua',
    'dependencies/UIMenu/items/UIMenuCheckboxItem.lua',
    'dependencies/UIMenu/items/UIMenuListItem.lua',
    'dependencies/UIMenu/UIMenu.lua',
    'dependencies/UIMenu/MenuPool.lua',

    'dependencies/NativeUI.lua'
}

client_scripts {
    'client.lua',
}