if (vsplashing && sprite_index == spr_dogamy_splash && obj_dogaressa_monster.sprite_index == spr_dogaressa_splash)
{
    if (floor(image_index) == 1 && currIndex != 1)
    {
        sfx_play(snd_splash);
        
        with (instance_create_xy(x + 100, y + 110, obj_dogisplash_notabullet))
        {
            direction = random_range(10, 60);
            speed = 12;
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
