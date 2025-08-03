if (!permadeath)
{
    ds_map_set_post(global.pflags, "deaths", ds_map_find_value(global.pflags, "deaths") + 1);
    var key = _string("mgd_{0}", global.battle_id);
    
    if (ds_map_exists(global.pflags, key))
    {
        groupDeaths = ds_map_set_pre(global.pflags, key, ds_map_find_value(global.pflags, key) + 1);
    }
    else
    {
        ds_map_set(global.pflags, key, 1);
        groupDeaths = 1;
    }
    
    persist_save();
}
else
{
    groupDeaths = 1;
}

if (global.session_deaths >= 3 || keyCounter >= 12 || groupDeaths >= 4 || (global.ctoskip && global.control_menu))
{
    alarm[2] = 22;
    fastMode = true;
    
    switch (global.gameover_special_type)
    {
        case 0:
        case 1:
            music_lcplay("supersupersupersans", true);
            break;
        
        default:
            music_lcplay("gameover", true);
            break;
    }
    
    if (instance_exists(global.currentmusic) && global.currentmusic.instance != -1)
        audio_sound_loop_end(global.currentmusic.instance, 59.716);
}
else
{
    fastMode = false;
    alarm[2] = 64;
    alarm[3] = 60;
}

global.session_deaths++;
sfx_play(snd_soulshatter);
visible = false;
instance_create_xy(x - 2, y, obj_heart_shard);
instance_create_xy(x, y + 3, obj_heart_shard);
instance_create_xy(x + 2, y + 6, obj_heart_shard);
instance_create_xy(x + 8, y, obj_heart_shard);
instance_create_xy(x + 10, y + 3, obj_heart_shard);
instance_create_xy(x + 12, y + 6, obj_heart_shard);
