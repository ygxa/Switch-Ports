with (obj_larry_monster)
{
    if (isActive)
    {
        sfx_play(snd_larrylaugh);
        sprite_index = spr_larry_laugh;
        image_speed = 1;
        forceDrawSelf = true;
    }
}
