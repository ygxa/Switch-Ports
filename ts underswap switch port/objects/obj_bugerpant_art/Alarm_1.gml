image_alpha -= 0.02;

if (image_alpha <= 0)
{
    image_alpha = 0;
    alarm[2] = 30;
    music_kill_current();
}
else
{
    alarm[1] = 1;
}
