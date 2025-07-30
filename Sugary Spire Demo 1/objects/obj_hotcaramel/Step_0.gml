if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        sprite_index = spr_player_fireass;
        state = 103;
        image_index = 0;
        vsp = -20;
        audio_stop_sound(sound_fireass);
        scr_sound(117);
    }
    
    if (obj_player.state == 85 || obj_player.state == 94)
        instance_create(x, y, obj_poofeffect);
}
