if (sprite_index == spr_larry_knockout)
{
    global.bev_subtype = 1;
    event_user(0);
    hurtSprite = spr_larry_knockout;
    exit;
}

if (image_index != 0)
    image_index = 0;
else
    image_index = 1;

flips += 1;

if (flips < 10)
{
    sfx_play_pitch(snd_mushroom, 1 - (flips * 0.05), 80, false);
    alarm[9] = 6;
}
else
{
    sfx_play(snd_bang, 80, false);
    view_shake(2, 1);
    sprite_index = spr_larry_knockout;
    alarm[9] = 15;
}
