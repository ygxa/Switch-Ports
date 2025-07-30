function player_hurt()
{
    Scr_CheckParry();
    
    if (justspawned == 0 && parry == false && state != (16 << 0) && state != (23 << 0) && state != (21 << 0) && inv == false)
    {
        var _damage = argument0;
        var _blast = argument1;
        var _facing = argument2;
        var _hspeed = argument3;
        var _player = object_index;
        
        if (other.damagenull == false)
        {
            if (other.damagemeter != other.damagemetermax)
                other.damagemeter += _damage;
        }
        
        hp -= _damage;
        sprint = false;
        crouch = false;
        flash = 3;
        grv = 0.5;
        randomize();
        ScrPlayer_StopSprintSound();
        
        if (_damage > 0 && _damage < 30)
        {
            switch (irandom_range(1, 2))
            {
                case 1:
                    instance_create_layer(x, y, "part", o_smallpart);
                    break;
                
                case 2:
                    instance_create_layer(x, y, "part", o_bighit);
                    break;
            }
        }
        
        if (_damage > 30)
            instance_create_layer(x, y, "part", o_massivehit);
        
        if (hp > 0)
        {
            pause = 9;
            
            if (object_index != O_Pizzaface)
            {
                vsp = -_blast;
                hsp = _hspeed * _facing;
            }
            
            audio_play_sound(su_hit, 50, false);
            hitstun = 30;
            
            if (object_index == o_player_default || object_index == o_player_default2)
            {
                state = (2 << 0);
                sprite_index = s_test_hurt;
                mask_index = s_test_idl;
                audio_stop_sound(su_pep_dash);
            }
            
            if (object_index == o_player_noise || object_index == o_player_noise2)
            {
                state = (2 << 0);
                sprite_index = s_noise_hurt;
                mask_index = s_noise_idle;
                audio_stop_sound(su_noise_tornado);
                audio_stop_sound(su_noise_dash);
            }
            
            if (object_index == o_player_vigilante || object_index == o_player_vigilante2)
            {
                state = (2 << 0);
                sprite_index = s_vigilante_hurt;
                audio_stop_sound(su_vigi_smg);
                mask_index = s_vigilante_idle;
            }
            
            if (object_index == o_player_fakepep || object_index == o_player_fakepep2)
            {
                state = (2 << 0);
                sprite_index = s_fakepep_hurt;
                mask_index = s_fakepep_idle;
                audio_stop_sound(su_fakepep_bodyslam);
            }
            
            if (object_index == o_player_doise || object_index == o_player_doise2)
            {
                state = (2 << 0);
                sprite_index = s_noise_hurt;
                mask_index = s_noise_idle;
                audio_stop_sound(su_doise_downaerial);
            }
            
            if (object_index == o_NPC_credits)
            {
                state = (2 << 0);
                
                switch (spriteuser)
                {
                    case "Monoe":
                        sprite_index = S_MonoeCredits_DIE;
                        break;
                    
                    case "Fern":
                        sprite_index = S_FernCreditsDie;
                        break;
                    
                    case "Cocoa":
                        switch (irandom_range(1, 6))
                        {
                            case 1:
                                sprite_index = S_CocoaCredits_Die_sad;
                                break;
                            
                            case 2:
                                sprite_index = S_CocoaCredits_Die_Soup;
                                break;
                            
                            case 3:
                                sprite_index = S_CocoaCredits_Die_Squid;
                                break;
                            
                            case 4:
                                sprite_index = S_CocoaCredits_Die_Mario;
                                break;
                            
                            case 5:
                                sprite_index = S_CocoaCredits_Die_Jevil;
                                break;
                            
                            case 6:
                                sprite_index = S_CocoaCredits_Die_Tooth;
                                break;
                        }
                        
                        break;
                    
                    case "Roo":
                        sprite_index = S_GaprooDIE;
                        break;
                    
                    case "Wizz":
                        sprite_index = S_WizzlerDIE;
                        break;
                }
            }
            
            if (object_index == o_trainingdummy)
            {
                state = (2 << 0);
                damagedealt = _damage;
                damagedealttotal += _damage;
                damagedealtshow = damagedealt;
                damagedealttotalshow = damagedealttotal;
                combo++;
                combo_show = combo;
                comboshake = 3;
                sprite_index = s_pizzaboy;
            }
            
            if (object_index == o_cheeseslime)
            {
                state = (2 << 0);
                combo++;
                comboshake = 3;
                combotimer = 60;
                sprite_index = s_cheese_hurt;
            }
        }
        else
        {
            player_kill();
        }
    }
    
    ScreenShake(7, 20);
}
