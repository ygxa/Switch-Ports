image_index = 10;
sfx_play(snd_click);

with (obj_bugerpant)
{
    sprite_index = spr_bugerpant_ground;
    image_index = 0;
    image_speed = 0.5;
    y += 8;
    alarm[7] = 1;
    visible = true;
}
