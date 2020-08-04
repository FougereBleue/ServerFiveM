-- TriggerEvent('esx_policedog:openMenu') to open menu

Config = {
    Job = {'ambulance'},
    Command = 'policechien', -- set to false if you dont want to have a command
    Model = 1318032802,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'bagofdope', 'coke_pooch', 'meth_pooch', 'crack_pooch'}, -- add all drugs here for the dog to detect
    Items = {'water', 'bread', 'phone', 'gps'}, -- add all drugs here for the dog to detect
}

Strings = {
    ['not_police'] = 'Tu es ~r~pas ~s~ un ambulancier!',
    ['menu_title'] = 'Chien Ambulancier',
    ['take_out_remove'] = 'Husky',
    --['take_out_remove1'] = 'Chop',
    ['deleted_dog'] = 'Renvoyez le chien',
    ['spawned_dog'] = 'Appelez le chien',
    ['sit_stand'] = 'Ne bouge pas reste ici!',
    ['no_dog'] = "Tu nas pas de chien",
    ['dog_dead'] = 'Ton chien est mort',
    --['search_items'] = 'Le chien cherche autour de lui des objets suspect',
    --['no_items'] = 'Aucun objet trouvé.',
    --['items_found'] = 'Waf!Waf! un objet suspect trouvé!',
    --['search_drugs'] = 'Le chien cherche autour de lui',
    --['no_drugs'] = 'Aucune drogue trouver.', 
    --['drugs_found'] = 'Waf!Waf! de la drogue!',
    ['dog_too_far'] = 'Le chien est bien trop loin!',
    ['small'] = 'Soigner le Chien!',
    ['heal_inprogress'] = 'Vous soigner le Chien',
    --['attack_closest'] = 'Attaquez joueur proche',
}