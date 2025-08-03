sfx_play(snd_click);
alpha += 0.3;

if (alpha >= 1)
{
    alpha = 1;
    alarm[1] = 20;
}
else
{
    alarm[0] = 8;
}
