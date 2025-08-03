if (!swooping)
{
    hspeed -= 0.1;
    
    if (hspeed <= 0.5)
    {
        if (obj_battlemanager.attackTimer > 60 && !shaking)
        {
            shaking = true;
            sfx = sfx_loop(snd_copter, 8, true);
            
            if (sfx != -1)
            {
                audio_sound_gain(sfx, 0, 0);
                audio_sound_gain(sfx, 0.4, 500);
                audio_sound_pitch(sfx, 1.1);
            }
            
            actorShakeAmount = 0;
        }
    }
    
    if (hspeed <= -1)
    {
        if (obj_battlemanager.attackTimer > 60)
        {
            alarm[0] = 1;
            swooping = true;
        }
        else
        {
            hspeed = -1;
        }
    }
    
    if (!swooping && obj_battlemanager.attackTimer < 60)
    {
        image_alpha -= 0.05;
        
        if (image_alpha <= 0)
            instance_destroy();
    }
}
else if (obj_battlemanager.attackTimer < 60 && (y < obj_battlemanager.boxY1 || y > obj_battlemanager.boxY2))
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (shaking)
{
    if (actorShakeAmount < 4)
        actorShakeAmount++;
}
else if (actorShakeAmount > -1)
{
    actorShakeAmount--;
}

actor_shake_logic();
