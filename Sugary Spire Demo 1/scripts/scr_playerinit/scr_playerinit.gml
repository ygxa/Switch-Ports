function scr_playerrespawn()
{
    if (state != 48 && state != 96 && !place_meeting(x, y, obj_vertical_hallway) && !instance_exists(obj_fadeout) && room != outer_room2 && room != timesuproom && room != rank_room)
    {
        var _checkpoint = instance_nearest(x, y, obj_checkpoint_invis);
        var _checkpointReal = -4;
        
        with (obj_checkpoint)
        {
            if (Checkpointactivated == true)
                _checkpointReal = id;
        }
        
        if (instance_exists(_checkpoint) && _checkpoint.Checkpointactivated == true)
        {
            x = _checkpoint.x;
            y = _checkpoint.y;
            instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
        }
        else if (instance_exists(_checkpointReal) && _checkpointReal.Checkpointactivated == true)
        {
            x = _checkpointReal.x;
            y = _checkpointReal.y;
            instance_create(_checkpointReal.x, _checkpointReal.y, obj_poofeffect);
        }
        else
        {
            x = roomstartx;
            y = roomstarty;
            instance_create(roomstartx, roomstarty, obj_poofeffect);
        }
        
        if (instance_exists(obj_train))
        {
            with (obj_train)
            {
                x = xstart;
                y = ystart;
                movespeed = 10;
                image_index = 0;
                sprite_index = spr_spray;
                go = 0;
            }
        }
        
        state = 70;
        alarm[8] = 30;
        alarm[7] = 60;
        hurted = 1;
        sprite_index = spr_hurt;
        movespeed = 0;
        vsp = -3;
    }
}

function scr_playerstate()
{
    var _stateFunction = undefined;
    
    switch (state)
    {
        case 0:
            _stateFunction = scr_player_normal;
            break;
        
        case 1:
            _stateFunction = scr_player_titlescreen;
            break;
        
        case 2:
            _stateFunction = scr_playerN_hookshot;
            break;
        
        case 3:
            _stateFunction = scr_player_slap;
            break;
        
        case 4:
            _stateFunction = scr_player_charge;
            break;
        
        case 5:
            _stateFunction = scr_player_cheesepep;
            break;
        
        case 6:
            _stateFunction = scr_player_cheeseball;
            break;
        
        case 7:
            _stateFunction = scr_player_cheesepepstick;
            break;
        
        case 8:
            _stateFunction = scr_player_boxxedpep;
            break;
        
        case 9:
            _stateFunction = scr_player_pistolaim;
            break;
        
        case 10:
            _stateFunction = scr_player_climbwall;
            break;
        
        case 11:
            _stateFunction = scr_player_knightpepslopes;
            break;
        
        case 12:
            _stateFunction = scr_player_portal;
            break;
        
        case 13:
            _stateFunction = scr_player_secondjump;
            break;
        
        case 14:
            _stateFunction = scr_player_chainsawbump;
            break;
        
        case 15:
            _stateFunction = scr_player_handstandjump;
            break;
        
        case 16:
            _stateFunction = scr_player_gottreasure;
            break;
        
        case 17:
            _stateFunction = scr_player_knightpep;
            break;
        
        case 18:
            _stateFunction = scr_player_knightpepattack;
            break;
        
        case 19:
            _stateFunction = scr_player_meteorpep;
            break;
        
        case 20:
            _stateFunction = scr_player_bombpep;
            break;
        
        case 21:
            _stateFunction = scr_player_grabbing;
            break;
        
        case 22:
            _stateFunction = scr_player_chainsawpogo;
            break;
        
        case 23:
            _stateFunction = scr_player_shotgunjump;
            break;
        
        case 24:
            _stateFunction = scr_player_stunned;
            break;
        
        case 25:
            _stateFunction = scr_player_highjump;
            break;
        
        case 26:
            _stateFunction = scr_player_chainsaw;
            break;
        
        case 27:
            _stateFunction = scr_player_facestomp;
            break;
        
        case 28:
            _stateFunction = scr_player_timesup;
            break;
        
        case 29:
            _stateFunction = scr_player_machroll;
            break;
        
        case 30:
            _stateFunction = scr_player_pistol;
            break;
        
        case 31:
            _stateFunction = scr_player_shotgun;
            break;
        
        case 32:
            _stateFunction = scr_player_machfreefall;
            break;
        
        case 33:
            _stateFunction = scr_player_throw;
            break;
        
        case 34:
            _stateFunction = scr_player_superslam;
            break;
        
        case 35:
            _stateFunction = scr_player_slam;
            break;
        
        case 36:
            _stateFunction = scr_player_skateboard;
            break;
        
        case 37:
            _stateFunction = scr_player_grind;
            break;
        
        case 38:
            _stateFunction = scr_player_grab;
            break;
        
        case 39:
            _stateFunction = scr_player_punch;
            break;
        
        case 40:
            _stateFunction = scr_player_backkick;
            break;
        
        case 41:
            _stateFunction = scr_player_uppunch;
            break;
        
        case 42:
            _stateFunction = scr_player_shoulder;
            break;
        
        case 43:
            _stateFunction = scr_player_backbreaker;
            break;
        
        case 44:
            _stateFunction = scr_player_bossdefeat;
            break;
        
        case 45:
            _stateFunction = scr_player_bossintro;
            break;
        
        case 46:
            _stateFunction = scr_player_smirk;
            break;
        
        case 47:
            _stateFunction = scr_player_pizzathrow;
            break;
        
        case 48:
            _stateFunction = scr_player_gameover;
            break;
        
        case 49:
            _stateFunction = scr_player_Sjumpland;
            break;
        
        case 50:
            _stateFunction = scr_player_freefallprep;
            break;
        
        case 51:
            _stateFunction = scr_player_runonball;
            break;
        
        case 52:
            _stateFunction = scr_player_boulder;
            break;
        
        case 53:
            _stateFunction = scr_player_keyget;
            break;
        
        case 54:
            _stateFunction = scr_player_tackle;
            break;
        
        case 55:
            _stateFunction = scr_player_slipnslide;
            break;
        
        case 56:
            _stateFunction = scr_player_ladder;
            break;
        
        case 57:
            _stateFunction = scr_player_jump;
            break;
        
        case 58:
            _stateFunction = scr_player_victory;
            break;
        
        case 59:
            _stateFunction = scr_player_comingoutdoor;
            break;
        
        case 60:
            _stateFunction = scr_player_Sjump;
            break;
        
        case 61:
            _stateFunction = scr_player_Sjumpprep;
            break;
        
        case 62:
            _stateFunction = scr_player_crouch;
            break;
        
        case 63:
            _stateFunction = scr_player_crouchjump;
            break;
        
        case 64:
            _stateFunction = scr_player_crouchslide;
            break;
        
        case 65:
            _stateFunction = scr_player_mach1;
            break;
        
        case 66:
            _stateFunction = scr_player_mach2;
            break;
        
        case 67:
            _stateFunction = scr_player_mach3;
            break;
        
        case 68:
            _stateFunction = scr_player_machslide;
            break;
        
        case 69:
            _stateFunction = scr_player_bump;
            break;
        
        case 70:
            _stateFunction = scr_player_hurt;
            break;
        
        case 71:
            _stateFunction = scr_player_freefall;
            break;
        
        case 72:
            _stateFunction = scr_player_freefallland;
            break;
        
        case 73:
            _stateFunction = scr_player_hang;
            break;
        
        case 74:
            _stateFunction = scr_player_door;
            break;
        
        case 75:
            _stateFunction = scr_player_barrelnormal;
            break;
        
        case 76:
            _stateFunction = scr_player_barrelfall;
            break;
        
        case 77:
            _stateFunction = scr_player_barrelmach1;
            break;
        
        case 78:
            _stateFunction = scr_player_barrelmach2;
            break;
        
        case 79:
            _stateFunction = scr_player_barrelfloat;
            break;
        
        case 80:
            _stateFunction = scr_player_barrelcrouch;
            break;
        
        case 81:
            _stateFunction = scr_player_barrelslipnslide;
            break;
        
        case 82:
            _stateFunction = scr_player_barrelroll;
            break;
        
        case 83:
            _stateFunction = scr_player_current;
            break;
        
        case 84:
            _stateFunction = scr_player_finishingblow;
            break;
        
        case 85:
            _stateFunction = scr_player_cotton;
            break;
        
        case 86:
            _stateFunction = scr_player_uppercut;
            break;
        
        case 87:
            _stateFunction = scr_player_pal;
            break;
        
        case 88:
            _stateFunction = scr_player_shocked;
            break;
        
        case 89:
            _stateFunction = scr_player_bushdisguise;
            break;
        
        case 90:
            _stateFunction = scr_player_parry;
            break;
        
        case 93:
            _stateFunction = scr_player_tumble;
            break;
        
        case 91:
            _stateFunction = scr_player_talkto;
            break;
        
        case 92:
            _stateFunction = scr_player_puddle;
            break;
        
        case 94:
            _stateFunction = scr_player_cottondrill;
            break;
        
        case 95:
            _stateFunction = scr_player_cottonroll;
            break;
        
        case 96:
            _stateFunction = scr_player_fling;
            break;
        
        case 97:
            _stateFunction = scr_player_breakdance;
            break;
        
        case 109:
            _stateFunction = scr_gumbob_propeller;
            break;
        
        case 110:
            _stateFunction = scr_gumbob_mixnbrew;
            break;
        
        case 98:
            _stateFunction = scr_player_minecart;
            break;
        
        case 103:
            _stateFunction = scr_player_fireass;
            break;
        
        case 99:
            _stateFunction = scr_player_squished;
            break;
        
        case 100:
            _stateFunction = scr_player_machtumble;
            break;
        
        case 102:
            _stateFunction = scr_mach_pizzano;
            break;
        
        case 101:
            _stateFunction = scr_rocketfist_pizzano;
            break;
        
        case 106:
            _stateFunction = scr_coneboy_inhale;
            break;
        
        case 107:
            _stateFunction = scr_coneboy_inhale;
            break;
        
        case 108:
            _stateFunction = scr_coneboy_inhale;
            break;
        
        case 104:
            _stateFunction = scr_player_geyser;
            break;
        
        case 111:
            _stateFunction = scr_pizzano_twirl;
            break;
        
        case 112:
            _stateFunction = scr_pizzano_shoulderbash;
            break;
        
        case 113:
            _stateFunction = scr_pizzano_wallcling;
            break;
            break;
        
        case 105:
            _stateFunction = scr_player_actor;
            break;
        
        case 114:
            _stateFunction = scr_player_mini;
            break;
    }
    
    stateName = "states.undefined";
    
    if (!is_undefined(_stateFunction))
    {
        _stateFunction();
        stateName = "states." + string_extract(script_get_name(_stateFunction), "_", 1) + string_extract(script_get_name(_stateFunction), "_", 3);
    }
}
