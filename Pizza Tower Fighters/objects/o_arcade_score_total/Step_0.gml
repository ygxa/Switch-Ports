if (!instance_exists(O_Fade))
{
    if (scoringgg < global.TOTALSCORE && scoringgg != global.TOTALSCORE)
    {
        scoringgg += 5;
        
        if (scoringgg == (global.TOTALSCORE - 5))
        {
            audio_play_sound(su_drum, 50, false);
            audio_stop_sound(su_towercrumble);
        }
    }
    else if (!audio_is_playing(su_drum) && showrank == 0)
    {
        showrank = 1;
        
        if (global.TOTALSCORE < 200)
        {
            audio_play_sound(su_fail, 50, false);
            layer_background_sprite(background_id, bg_arcade_fail);
        }
        
        if (global.TOTALSCORE < 350 && global.TOTALSCORE > 199)
        {
            audio_play_sound(su_postaldude, 50, false);
            ranksprite = s_rank_shit;
            timer = 550;
            layer_background_sprite(background_id, bg_arcade_shit);
        }
        
        if (global.TOTALSCORE < 450 && global.TOTALSCORE > 349)
        {
            audio_play_sound(su_okay, 50, false);
            ranksprite = s_rank_okay;
            layer_background_sprite(background_id, bg_arcade_okay);
        }
        
        if (global.TOTALSCORE < 600 && global.TOTALSCORE > 449)
        {
            audio_play_sound(su_death, 50, false);
            ranksprite = s_rank_noided;
            layer_background_sprite(background_id, bg_arcade_score_noided);
        }
        
        if (global.TOTALSCORE < 900 && global.TOTALSCORE > 599)
        {
            audio_play_sound(su_gorillaz, 50, false);
            ranksprite = s_rank_shoeshine;
            timer = 550;
            layer_background_sprite(background_id, bg_arcade_shoeshine);
        }
        
        if (global.TOTALSCORE > 899)
        {
            audio_play_sound(su_brat, 50, false);
            ranksprite = s_rank_brat;
            timer = 350;
            layer_background_sprite(background_id, bg_arcade_score_brat);
        }
    }
    
    if (showrank == 1)
    {
        if (scale > 1)
            scale -= 0.1;
        
        if (timer != 0)
        {
            timer--;
        }
        else if (!instance_exists(O_Fade))
        {
            audio_stop_sound(su_brat);
            audio_stop_sound(su_gorillaz);
            audio_stop_sound(su_death);
            audio_stop_sound(su_postaldude);
            audio_stop_sound(su_fail);
            
            if (global.doiseun == 0)
            {
                fadeToRoom(R_DoiseUnlocked, 30, 0);
            }
            else
            {
                fadeToRoom(R_SinglePlayerMenu, 50, 0);
                
                with (obj_savesystem)
                {
                    dirty = 1;
                    afterarcade = true;
                }
            }
        }
    }
}
