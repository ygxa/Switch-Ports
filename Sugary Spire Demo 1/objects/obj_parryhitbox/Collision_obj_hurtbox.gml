audio_stop_sound(sound_parry);
scr_sound(78);

with (obj_baddie)
{
    if (distance_to_object(other.id) < 64 && (object_index != obj_charcherry || (object_index == obj_charcherry && state == 13)))
        instance_destroy();
}

with (obj_player)
{
    state = 90;
    sprite_index = choose(spr_player_parry1, spr_player_parry2, spr_player_parry3);
    image_index = 0;
    movespeed = -8;
    flash = 1;
    
    with (instance_create(x, y, obj_bangeffect))
        sprite_index = spr_parryeffect;
}
