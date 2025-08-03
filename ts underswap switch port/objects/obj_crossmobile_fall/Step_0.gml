if (x >= 170)
{
    gravity = 0.35;
    depth = 200;
    image_angle = direction;
}
else if (speedup)
{
    if (speed < 5)
        speed += 0.25;
}

if (y >= 130)
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
    {
        if (!playedFall)
        {
            sfx_play(snd_bridgefall);
            playedFall = true;
            alarm[0] = 90;
        }
    }
}
