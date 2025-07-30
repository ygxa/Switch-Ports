with (other)
{
    if (key_accept)
    {
        audio_play_sound(su_CPUlevel, 50, false);
        
        if (global.CPULVL == 5)
            global.CPULVL = 1;
        else
            global.CPULVL++;
    }
}
