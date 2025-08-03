with (obj_harry_monster)
{
    if (isActive)
    {
        sfx_play(snd_harrylaugh);
        sprite_index = spr_harry_laugh;
        image_speed = 1;
        forceDrawSelf = true;
    }
}

if (argState >= 2)
{
    alarm[1] = 8;
}
else
{
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
}
