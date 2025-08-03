var normal = global.gev_type != 0;

if (fadeMusic && global.currentmusic == -4)
    fadeMusic = false;

if (slowFrame == 0)
{
    if (toSolid)
    {
        if (normal)
            alpha += fadeSpeed;
        
        if (alpha >= 1 || (targetAlpha != -1 && alpha >= targetAlpha))
        {
            alpha = (targetAlpha != -1) ? targetAlpha : 1;
            
            if (fadeMusic)
                music_gain(0, 0);
            
            if (fadeBorders)
                obj_gamemanager.borderOverrideFade = 0;
            
            if (extraFrames > 0)
                extraFrames--;
            else
                event_user(0);
        }
        else
        {
            if (fadeMusic)
                music_gain(clamp(1 - alpha, 0, maxMusicVolume), normal ? ((1 / game_get_speed(gamespeed_fps)) * 1000) : 0);
            
            if (fadeBorders)
                obj_gamemanager.borderOverrideFade = 1 - alpha;
        }
    }
    else
    {
        if (normal)
            alpha -= fadeSpeed;
        
        if (alpha <= 0 || (targetAlpha != -1 && alpha <= targetAlpha))
        {
            alpha = (targetAlpha != -1) ? targetAlpha : 0;
            
            if (fadeMusic)
                music_gain(maxMusicVolume, 0);
            
            event_user(0);
        }
        else if (fadeMusic)
        {
            music_gain(clamp(1 - alpha, 0, maxMusicVolume), normal ? ((1 / game_get_speed(gamespeed_fps)) * 1000) : 0);
        }
    }
}

if (normal)
    slowFrame = number_add_wrap(slowFrame, slowFrameMax);
