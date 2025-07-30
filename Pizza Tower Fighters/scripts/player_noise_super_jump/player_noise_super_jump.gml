function player_noise_super_jump()
{
    player_col();
    
    if (sprite_index != s_noise_super_crusherjump)
    {
        inv = true;
        noisebomb = 20;
        image_speed = 1;
        audio_play_sound(su_noise_crusher_up, 50, false);
        sprite_index = s_noise_super_crusherjump;
        image_index = 0;
        vsp = -12;
    }
    
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #FFFFBF;
            sprite_index = other.sprite_index;
            image_alpha = 1.25;
            image_index = other.image_index - 1;
            full = 1;
        }
    }
    else
    {
        blue_aftereffect--;
    }
    
    hsp = 0;
    noisebomb--;
    
    if (noisebomb == 0 || distance_to_object(o_hurt_ceiling) < 100 || key_down)
        state = (24 << 0);
}
