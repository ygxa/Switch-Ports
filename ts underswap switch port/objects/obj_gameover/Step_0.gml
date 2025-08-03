if (writer != -4)
{
    switch (state)
    {
        case 0:
            if (!writer.isDone)
            {
                writer.doSkip(nextLine);
                nextLine = false;
            }
            
            if (writer.isDone)
            {
                nextLine = true;
                
                if (global.control_confirm_pressed || global.control_menu)
                {
                    nextLineTimer = -1;
                    state = 2;
                    exit;
                }
                
                if (nextLineTimer == -1)
                {
                    nextLineTimer = 60;
                }
                else
                {
                    nextLineTimer--;
                    
                    if (nextLineTimer == 0)
                    {
                        nextLineTimer = -1;
                        state = 2;
                    }
                }
            }
            
            break;
        
        case 2:
            if (textAlpha > 0)
            {
                textAlpha -= 0.075;
            }
            else
            {
                textAlpha = 0;
                state = 3;
                blankTimer = 8;
            }
            
            break;
        
        case 3:
            if (blankTimer > 0)
            {
                blankTimer--;
            }
            else
            {
                blankTimer = -1;
                state = 0;
                textAlpha = 1;
                scene_resume();
            }
            
            break;
    }
}

switch (state)
{
    case -2:
        textAlpha += 0.075;
        
        if (textAlpha > 1)
            textAlpha = 1;
        
        if (global.control_left_pressed || global.control_right_pressed)
        {
            choice = !choice;
            sfx_play(snd_squeak);
        }
        
        if (textAlpha >= 0.8 && (global.control_confirm_pressed || (global.ctoskip && global.control_menu)))
        {
            sfx_play(snd_select);
            didChoice = true;
            state = -2.5;
        }
        
        break;
    
    case -2.5:
        if (textAlpha > 0)
        {
            textAlpha -= 0.1;
        }
        else
        {
            textAlpha = 0;
            state = -1;
            alarm[3] = 8;
        }
        
        break;
    
    case -3:
        var diff = music_get_pos() - 56.28;
        
        if (!music_is_current("gameover") || global.currentmusic == -4 || !instance_exists(global.currentmusic) || global.currentmusic.instance == -1 || !audio_is_playing(global.currentmusic.instance))
            diff = 1;
        else
            audio_sound_loop(global.currentmusic.instance, false);
        
        if (diff >= 0)
        {
            if (diff >= 2)
            {
                stillFadeMusic = false;
                
                if (global.currentmusic != -4 && global.currentmusic.instance != -1)
                    audio_sound_gain(global.currentmusic.instance, 0, 750);
            }
            
            alarm[5] = 1;
            state = -1;
        }
        
        break;
}

if (permadeath)
    charaStage = 0;
