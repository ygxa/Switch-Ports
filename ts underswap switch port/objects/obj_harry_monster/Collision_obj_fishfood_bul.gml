if (other.gravity < 0 && fishedState == 0)
{
    fishedState = 1;
    sprite_index = spr_harry_feed_eyes;
    image_index = 0;
}
else if (fishedState == 1)
{
    fishedState = 2;
    eyesShake = 4;
    
    with (obj_harry_shakerhand_bul)
        instance_destroy();
    
    image_index = 1;
    bt_speech_bubble(0, 0, "battles.boogie.h_ow_eyes");
}

if (fishedState > 0)
{
    with (other)
    {
        sfx_play(snd_swallow);
        instance_destroy();
    }
}
