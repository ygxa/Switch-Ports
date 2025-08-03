with (obj_mettalot_monster)
{
    event_user(13);
    face = spr_metfaceb_shock;
}

shaking = false;
sfx_play(snd_bang, 80, false);
music_gain(origVolume, 500);
image_index = 1;
