switch (counter)
{
    case 0:
        obj_larry_monster.forceDrawSelf = true;
        obj_larry_monster.sprite_index = spr_larry_slap;
        break;
    
    case 6:
        obj_larry_monster.image_speed = 0;
        obj_larry_monster.image_index = 2;
        obj_harry_monster.forceDrawSelf = true;
        sfx_play(snd_monhurt1, 80, false);
        obj_harry_monster.sprite_index = spr_harry_slap_react;
        obj_harry_monster.hspeed = -1;
        obj_harry_monster.cloudShakeAmt = 3;
        break;
    
    case 10:
        obj_harry_monster.hspeed = 0;
        break;
    
    case 20:
        obj_larry_monster.image_speed = 1;
        obj_larry_monster.sprite_index = spr_larry_laugh;
        sfx_play(snd_larrylaugh, 80, false);
        break;
    
    case 60:
        obj_harry_monster.sprite_index = spr_harry_slap;
        obj_harry_monster.hspeed = 3;
        break;
    
    case 66:
        obj_larry_monster.sprite_index = spr_larry_slap_react;
        obj_larry_monster.hspeed = 0.5;
        obj_larry_monster.cloudShakeAmt = 3;
        sfx_play(snd_click, 80, false);
        obj_larry_monster.image_speed = 0;
        obj_larry_monster.image_index = 0;
        obj_harry_monster.image_speed = 0;
        obj_harry_monster.image_index = 2;
        obj_harry_monster.hspeed = 0;
        break;
    
    case 70:
        obj_larry_monster.hspeed = 0;
        break;
    
    case 80:
        obj_harry_monster.image_speed = 1;
        obj_harry_monster.sprite_index = spr_harry_laugh;
        sfx_play(snd_harrylaugh, 80, false);
        break;
    
    case 120:
        obj_larry_monster.image_index = 0;
        obj_larry_monster.image_speed = 2;
        obj_larry_monster.hspeed = -1;
        obj_larry_monster.sprite_index = spr_larry_slap;
        break;
    
    case 123:
        obj_larry_monster.image_speed = 0;
        obj_larry_monster.image_index = 2;
        obj_larry_monster.hspeed = 0;
        obj_harry_monster.hspeed = -3;
        obj_harry_monster.sprite_index = spr_harry_hurt;
        sfx_play(snd_monhurt1, 80, false);
        break;
    
    case 125:
        obj_harry_monster.hspeed = 0;
        break;
    
    case 140:
        obj_larry_monster.image_speed = 1;
        obj_larry_monster.sprite_index = spr_larry_laugh;
        sfx_play(snd_larrylaugh, 80, false);
        break;
    
    case 170:
        obj_harry_monster.sprite_index = spr_harry_slap;
        obj_harry_monster.hspeed = 1.5;
        break;
    
    case 176:
        obj_larry_monster.sprite_index = spr_larry_slap_react_2;
        obj_larry_monster.hspeed = 0.5;
        obj_larry_monster.cloudShakeAmt = 3;
        sfx_play(snd_click, 80, false);
        obj_larry_monster.image_speed = 0;
        obj_larry_monster.image_index = 0;
        obj_harry_monster.image_speed = 0;
        obj_harry_monster.image_index = 2;
        obj_harry_monster.hspeed = 0;
        break;
    
    case 182:
        obj_harry_monster.image_speed = 1;
        obj_harry_monster.sprite_index = spr_harry_laugh;
        obj_larry_monster.hspeed = 0;
        sfx_play(snd_harrylaugh, 80, false);
        break;
    
    case 212:
        obj_harry_monster.image_speed = 0;
        obj_larry_monster.image_speed = 0;
        obj_harry_monster.sprite_index = spr_harry_slap;
        obj_larry_monster.sprite_index = spr_larry_slap;
        obj_harry_monster.image_index = 0;
        obj_larry_monster.image_index = 0;
        break;
    
    case 232:
        obj_harry_monster.hspeed = 6;
        obj_larry_monster.hspeed = -6;
        break;
    
    case 238:
        obj_harry_monster.hspeed = 0;
        obj_larry_monster.hspeed = 0;
        sfx_play(snd_crash, 80, false);
        visible = true;
        obj_harry_monster.visible = false;
        obj_larry_monster.visible = false;
        break;
    
    case 252:
        sfx = sfx_play(snd_fightloop, 80, true);
        alarm[0] = 1;
        break;
    
    case 380:
        growing = true;
        break;
    
    case 385:
        instance_destroy(obj_speechbubble);
        
        with (obj_battlemanager)
        {
            writer.skippable = false;
            mainState = (5 << 0);
            controlLock = true;
        }
        
        dx_scene("battles.boogie.fightcloud");
        break;
}

if (growing)
{
    image_xscale += 0.05;
    image_yscale += 0.05;
    y += 0.25;
    shakeIntensity = number_approach_linear(shakeIntensity, shakeIntensityMin, 0.025);
    
    if (image_xscale >= (global.lowvfx ? 4 : 7))
    {
        image_index = 0;
        image_speed = 0;
    }
    
    if (image_xscale >= 5 && !fadeToWhite)
    {
        fadeToWhite = true;
        
        with (instance_create(obj_fader))
        {
            color = 16777215;
            fadeSpeed = 0.015;
            destroy = false;
            depth = -500;
        }
    }
    
    if (image_xscale >= 10)
    {
        growing = false;
        audio_sound_gain(sfx, 0, 500);
        
        with (obj_battlemanager)
            battleTriggerEnd();
    }
}

counter += 1;
