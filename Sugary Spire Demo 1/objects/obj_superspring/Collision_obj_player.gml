with (obj_player)
{
    if (state != 60)
    {
        scr_sound(68);
        sprite_index = spr_player_superjump;
        state = 60;
        vsp = -12;
        movespeed = 12;
        other.image_index = 0;
        other.image_speed = 0.35;
        freefallsmash = 0;
    }
}

obj_player.x = x;
