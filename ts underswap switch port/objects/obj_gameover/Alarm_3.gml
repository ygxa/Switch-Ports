var scene;

if (choice == 1)
{
    scene = "gameover_quit";
}
else
{
    if (ds_map_find_value(global.pflags, "deaths") == 1)
        scene = "gameover_first";
    else if (fastMode)
        scene = "gameover_several";
    else
        scene = "gameover_random";
    
    switch (global.battle_id)
    {
        case -1:
            if (ds_map_find_value(global.flags, "plot") < 25 && (global.currentroom == rm_ruins3 || global.currentroom == rm_ruins4))
            {
                scene = "gameover_dummy";
            }
            else if (ds_map_find_value(global.flags, "plot") < 56 && (global.currentroom == rm_star22_chase1 || global.currentroom == rm_star23_chase2))
            {
                textSpeed = 1;
                textSound = snd_mdblip;
                scene = "gameover_house";
            }
            else if (global.currentroom == rm_stars_bridge || global.currentroom == rm_crys_start || global.currentroom == rm_crys_start_save || global.currentroom == rm_crys_premines)
            {
                scene = "gameover_navychase";
            }
            else
            {
                scene = "gameover_random";
            }
            
            break;
        
        case 3:
            scene = "gameover_knights";
            break;
        
        case 25:
            if (!ruth_enabled())
                scene = "gameover_mettalot";
            
            break;
        
        case 26:
            if (!ruth_enabled())
                scene = "gameover_greasers";
            
            break;
        
        case 27:
            if (!ruth_enabled())
                scene = "gameover_asgore";
            
            break;
        
        case 34:
            scene = "gameover_subdoggo";
            break;
        
        case 35:
            scene = "gameover_subdoggo_evac";
            break;
        
        case 36:
            scene = "gameover_lesserdog";
            break;
        
        case 37:
            scene = "gameover_greaterdog";
            break;
        
        case 38:
            scene = "gameover_dogi";
            break;
        
        case 39:
            scene = "gameover_muffet";
            textSpeed = 1;
            break;
        
        case 41:
            scene = "gameover_boogie";
            textSpeed = 1;
            break;
        
        case 42:
            scene = "gameover_koffink";
            textSpeed = 1;
            textSound = snd_koffinblip;
            break;
        
        case 43:
            scene = "gameover_crossbones";
            textSpeed = 1;
            textSound = snd_cbblip;
            textType = 3;
            break;
        
        case 46:
            scene = "gameover_sans";
            textSpeed = 1;
            textSound = snd_sansblip;
            textType = 3;
            break;
    }
    
    if (permadeath)
        scene = "gameover_permadeath";
}

dx_scene(scene);
state = 0;
textAlpha = 1;
