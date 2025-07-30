if (PAUSE == false)
{
    PAUSE = true;
    
    if (sprite_exists(paused_sprite))
        sprite_delete(paused_sprite);
    
    paused_sprite = sprite_create_from_surface(application_surface, 0, 0, 1366, 768, false, false, 0, 0);
    audio_pause_all();
    audio_play_sound(su_deselect, 50, false);
    instance_deactivate_all(true);
    instance_create_depth(384, 192, depth - 1, o_menu_pause);
}
else
{
    if (sprite_exists(paused_sprite))
        sprite_delete(paused_sprite);
    
    PAUSE = false;
    audio_resume_all();
    instance_activate_all();
    
    if (room == R_SecretRoom)
    {
        with (o_secreteye)
            Scr_Pause_Layout_killer();
    }
    
    instance_destroy(o_menu_pause);
}
