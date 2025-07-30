with (other)
{
    if (state != 188 && state != 11)
    {
        image_index = 0;
        state = 11;
        vsp = -21;
        sprite_index = spr_scaredjump1;
        scr_monster_activate();
    }
}
