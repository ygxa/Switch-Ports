if (obj_dogamy_monster.vsplashing && sprite_index == spr_dogaressa_splash && obj_dogamy_monster.sprite_index == spr_dogamy_splash)
{
    if (floor(image_index) == 1 && currIndex != 1)
    {
        sfx_play(snd_splash);
        
        with (instance_create_xy(x + 20, y + 110, obj_dogisplash))
        {
            direction = random_range(120, 170);
            speed = 12;
            image_xscale *= -1;
        }
    }
    
    currIndex = floor(image_index);
}

if (global.flavor_sprites && !spared)
{
    if (global.bev_subtype != 1)
        colorSlide = number_approach_smooth(colorSlide, 0, 0.1);
    
    image_blend = merge_color(flavorColor, c_white, colorSlide);
}
