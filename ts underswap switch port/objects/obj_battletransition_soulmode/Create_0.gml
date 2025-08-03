event_inherited();
alarm[0] = 110;
alarm[1] = 75;

if (!fake)
{
    with (heart)
    {
        visible = true;
        doDrawOutline(true);
        create_shiner(10);
        sfx_play(snd_click, 80, false);
    }
    
    alarm[2] = 30;
}

swapSprite = spr_owheart_blue;
swapSpriteCenter2x = spr_owheart_blue_center_2x;
