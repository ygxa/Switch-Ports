if (dogState == 0)
{
    if ((obj_battleheart.x != heartX || obj_battleheart.y != heartY) && alarm[1] <= 0)
    {
        if (!asleep)
            sprite_index = spr_dogwell_awake;
        
        alarm[1] = 5;
    }
    
    if (alarm[1] <= 0)
    {
        if (zTimer < 10)
        {
            zTimer++;
        }
        else
        {
            bt_bullet(obj_greaterdog_zbul, x, y);
            zTimer = 0;
        }
    }
}
else
{
    if (!asleep)
        sprite_index = spr_dogwell_awake;
    
    image_speed = 0;
    
    if (spittingFactsTimer == 0)
    {
        bt_bullet(obj_greaterdog_barkbul, x, y + 18);
        image_index = 1;
        
        if (asleep)
            sfx_play_pitch(snd_bark2, 0.85);
        else
            sfx_play(snd_bark2);
        
        alarm[2] = 1;
        alarm[0] = 10;
        factCount++;
        
        if ((factCount % 3) == 0)
            spittingFactsTimer = 30;
        else
            spittingFactsTimer = 15;
        
        if (asleep)
            spittingFactsTimer += 5;
    }
    else
    {
        spittingFactsTimer--;
    }
}
