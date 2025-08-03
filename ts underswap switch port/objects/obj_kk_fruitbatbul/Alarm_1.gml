sfx_play(snd_click);
bananaFalling = true;

with (bananaBul)
{
    gravity = 0.35;
    sliding = true;
}

alarm[0] = irandom_range(70, 90);
