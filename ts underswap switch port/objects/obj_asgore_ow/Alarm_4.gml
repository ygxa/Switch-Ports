if (type == 3)
{
    if (dirChangeCounter > 0)
        dirChangeCounter--;
    
    alarm[4] = 30;
}
else if (type == 6)
{
    sfx_play(snd_phone);
    alarm[4] = 45;
}
