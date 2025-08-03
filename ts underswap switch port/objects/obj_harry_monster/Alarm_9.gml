shake = false;

if (sprite_index == spr_harry_knockout)
{
    global.bev_subtype = 1;
    event_user(0);
    hurtSprite = spr_harry_knockout;
    exit;
}

sfx_play(snd_click, 80, false);
sprite_index = spr_harry_knockout;
alarm[9] = 15;
