if (starting == true)
{
    if (alphastart != 1)
        alphastart += 0.1;
    
    startspritetime--;
    
    if (startspritetime == 0)
    {
        startsprite += 1;
        startspritetime = 7;
    }
    
    if (startsprite == 2)
        startsprite = 0;
    
    if (starting_text_timer != 0)
        starting_text_timer--;
    
    if (starting_text_timer == 0)
    {
        switch (start_text)
        {
            case s_ready:
                start_text = s_start;
                starting_text_timer = 40;
                audio_play_sound(su_an_start, 50, false);
                break;
            
            case s_start:
                starting_text_timer = 0;
                starting = false;
                break;
        }
    }
}

if (starting == false && alphastart != 0)
{
    alphastart -= 0.05;
    startspritetime--;
    
    if (startspritetime == 0)
    {
        startsprite += 1;
        startspritetime = 7;
    }
    
    if (startsprite == 2)
        startsprite = 0;
}

if (instance_exists(o_peddito))
{
    audio_pause_sound(music);
    
    if (!audio_is_playing(mu_peddito))
        audio_play_sound(mu_peddito, 100, true);
}
else
{
    if (audio_is_paused(music))
        audio_resume_sound(music);
    
    audio_stop_sound(mu_peddito);
}

if (Player1live == 0 && Player2live == 0 && !instance_exists(o_youwon))
{
    with (instance_create_depth(x, y, -998, o_youwon))
    {
        o_youwon.alarm[0] = 120;
        audio_play_sound(mu_results, 0, true);
    }
}

if (global.gameselect == "Arcade" && timerscore > 0 && !instance_exists(o_youwon))
{
    timerscore_t--;
    
    if (timerscore_t == 0)
    {
        timerscore -= 5;
        timerscore_t = 200;
    }
}
