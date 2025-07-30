function clone_faker_deform()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_fakepep_downspecial)
    {
        audio_play_sound(su_fakepep_deform, 50, false);
        sprite_index = s_fakepep_downspecial;
        image_index = 0;
        image_speed = 1;
    }
    
    if (floor(image_index) == (image_number - 1))
        instance_destroy();
}
