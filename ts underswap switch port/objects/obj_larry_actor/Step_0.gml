event_inherited();

if (fly)
{
    flySpeed = number_approach_smooth(flySpeed, 0.75, 0.05, 0.02);
    y -= flySpeed;
    
    if (amp < 2)
        amp += 0.015;
    
    siner += 0.2;
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
    
    if (y < 0)
    {
        if (gain > 0)
            gain -= 0.01;
        
        with (obj_papyrus_actor)
        {
            if (s == -4)
            {
                setSolid(true);
                sceneName = "star.rm8.pap";
                pathAnimSpeed = 0.2;
                approachPos(x - 70, y, 30, function()
                {
                    lookDirection = 0;
                });
                
                with (obj_cb_actor)
                {
                    if (y == 120)
                    {
                        approachPos(x, 80, 30, function()
                        {
                            lookDirection = 3;
                        });
                    }
                }
            }
        }
    }
    else if (gain < 1)
    {
        gain += 0.01;
    }
    
    if (pitch < 2)
        pitch += 0.01;
    
    if (!is_undefined(global.soundstore) && audio_is_playing(global.soundstore))
    {
        audio_sound_gain(global.soundstore, gain * 0.5, 0);
        audio_sound_pitch(global.soundstore, pitch);
    }
    
    if ((y + sprite_height) < -20)
    {
        with (obj_cb_actor)
        {
            setSolid(true);
            sceneName = "star.rm8.cb";
        }
        
        audio_kill_all();
        
        with (obj_papyrus_actor)
            lookDirection = 2;
        
        scene_resume();
        instance_destroy(obj_harry_actor);
        instance_destroy();
    }
}

if (pushing)
{
    pushTimer++;
    
    if (pushTimer >= 38)
        pushTimer = 0;
}
