with (obj_parent_player)
    state = 2;

var skip = input_check_pressed("jump") || input_check_pressed("slap");
var skip2 = input_check("jump") || input_check("attack");

switch (creditPhase)
{
    case -2:
        obj_pizzelleflick.x -= 24
        if (obj_pizzelleflick.x <= -400)
        {
			audio_play_sound(snd_pizzelleCrashingout, 1, 0)
            //event_play_oneshot("event:/SFX/general/creditssplat");
            creditPhase = -1;
            phaseBuffer = 120;
        }
        
        break;
    
    case -1:
        if (!phaseBuffer--)
        {
            if (!showLogo)
            {
                showLogo = true;
                phaseBuffer = 200;
            }
            else if (logoAlpha > 0)
            {
                logoAlpha = approach(logoAlpha, 0, 0.05);
                
                if (logoAlpha == 0)
                    phaseBuffer = 60;
            }
            else
            {
                creditPhase = 1;
				audio_sound_gain(mu_credits, 0.68,1)
				audio_play_sound(mu_credits,1,1)
                showLogo = false;
            }
        }
        
        break;
    
    case 0:
        obj_curtain_exhibclose.image_speed = 0.35;
        obj_curtain_exhibclose.update();
        
        if (sprite_animation_end(obj_curtain_exhibclose.sprite_index, obj_curtain_exhibclose.image_index, obj_curtain_exhibclose.image_number, obj_curtain_exhibclose.image_speed))
            creditPhase = 1;
        
        break;
    
    case 1:
        event_user(1);
        creditsSpeed = approach(creditsSpeed, skip2 ? skipSpeed : defaultSpeed, 0.6);
        
        if (fadein && fadeAlpha == 1)
        {
            fadein = false;
            creditPhase = 2;
            phaseBuffer = 100;
        }
        
        break;
    
    case 2:
        obj_endscreencard.visible = true;
		fmod_studio_event_instance_stop(mu_credits, false)
        phaseBuffer--;
        if audio_sound_get_gain(mu_credits) = 0
			audio_stop_sound(mu_credits)
        if (skip && phaseBuffer <= 0)
            creditPhase = 3;
        
        break;
    
    case 3:
        obj_curtain_exhibclose.image_speed = 0.35;
		obj_curtain_exhibclose.visible = true
        if (obj_curtain_exhibclose.image_index >= 14){
            room_goto_fixed(rm_mainmenu);
			audio_stop_sound(mu_credits)	
		}
        
        break;
}

if (creditPhase >= 1 && creditPhase != 3)
{
    bgCreditsFade = approach(bgCreditsFade, 1, 0.05);
    bgCredits.image_blend = make_color_hsv(0, 0, bgCreditsFade * 255);
}

bgCredits.x++;
fadeAlpha = approach(fadeAlpha, fadein, 0.05);
