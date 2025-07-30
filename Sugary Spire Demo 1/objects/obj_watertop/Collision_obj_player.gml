with (obj_player)
{
    if (state == 85 || state == 94 || state == 95)
    {
        scr_sound(23);
        state = 0;
        sprite_index = spr_idle;
        instance_create(x, y, obj_poofeffect);
        image_index = 0;
    }
}
