if (global.bev_subtype == 0)
{
    ds_map_set(global.pflags, "asgk", true);
    journal_set_health(0, (2 << 0));
    persist_save();
    
    with (obj_battledamage)
        progressBattle = false;
    
    with (obj_battletarget)
        doFade = true;
    
    with (obj_battleheart)
    {
        visible = true;
        x = 312;
        y = 312;
    }
    
    var scene = "battles.asgore.";
    
    if (isRuth)
    {
        scene += "death_ruth";
    }
    else if (defense < 0 && defense != -900)
    {
        ds_map_set(global.flags, "asg_betray", true);
        scene += "death_betrayal";
    }
    else
    {
        scene += "death";
    }
    
    with (bt_speech_bubble(x + 220, y + 20, scene))
    {
        if (instance_exists(writer))
        {
            writer.sound = snd_asgblip;
            writer.textSpeed = 2;
            
            if (global.ctoskip)
            {
                writer.skippable = true;
                allowSkip = true;
            }
        }
        
        sound = snd_asgblip;
        textEffect = 6;
        textType = 3;
        textSpeed = 2;
    }
}
else if (global.bev_subtype != 1)
{
    event_inherited();
    
    if (global.bev_subtype == 2)
    {
        with (obj_battledamage)
            width = 200;
        
        if (invincible)
        {
            with (obj_battledamage)
                minHpDisplay = 7;
        }
        
        if (!isRuth && mercyThresholdHit)
        {
            ds_list_clear(actStrings);
            ds_list_clear(actScenes);
            bt_add_act("battles.asgore.", "act_check");
            bt_add_act("battles.asgore.", "act_talk");
            
            if (hp <= 70)
                defense = -900;
        }
        
        alarm[1] = 1;
    }
}
