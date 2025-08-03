if (pellet != undefined)
{
    draw_sprite(spr_flowey_owbullet, floor(pelletInd), obj_darktem.x + obj_darktem.sprite_width + 20 + pellet, obj_darktem.y - 20 - pellet);
    pelletInd += 0.2;
    pellet -= 2;
    
    if (pellet <= -30)
    {
        pellet = undefined;
        audio_kill_all();
        sfx_play(snd_monhurt1);
        
        with (obj_darktem)
        {
            hspeed = -5;
            vspeed = -2;
            x += floor(sprite_width / 2);
            y += floor(sprite_height / 2);
            sprite_index = spr_tem_d_notpog_centered;
            image_speed = 0;
            image_index = 0;
            alarm[1] = 1;
        }
    }
}

draw_self();
