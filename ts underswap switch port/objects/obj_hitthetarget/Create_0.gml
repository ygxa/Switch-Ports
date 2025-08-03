event_inherited();

with (obj_hangoutmanager)
{
    boxX1 = -500;
    boxY1 = -500;
    boxX2 = -501;
    boxY2 = -501;
}

camera_set_view_pos(view_get_camera(0), 0, 480);
incStateCallback = true;
sans = instance_create_xy(514, 778, obj_sans_date_actor);

with (sans)
{
    depth = other.depth - 1;
    sprite_index = spr_sans_monster;
}

tem = instance_create_xy(418, 516, obj_htt_temactor);
gameScore = 0;
gameLives = 3;
gameNewHighscore = false;
bgYOff = -232;
bgX = 0;
bgAlpha = 1;
soul = instance_create_xy(312, 792, obj_dateheart);
gameActive = false;
intensity = 0;
ds_map_set(global.flags, "sts_htt_gold", 0);
ds_map_set(global.flags, "sts_score", 0);
drawGameBox = true;
borderLeft = 240;
borderRight = 400;
borderTop = 730;
borderBottom = 870;

with (soul)
{
    boundsX = [other.borderLeft + 5, other.borderRight - 21];
    boundsY = [other.borderTop + 5, other.borderBottom - 21];
    canMove = false;
}

xOff = 240;
borderTargetY = 730;
platformFlip = 1;
alarm[0] = 30;

nextStage = function()
{
    sfx_play(snd_ding, 80, false);
    sfx_play(snd_dumbvictory, 80, false);
    
    with (obj_dateheart)
    {
        x = 312;
        y = 804;
        soulGrav = 0;
        jumpState = 2;
    }
    
    gameScore++;
    ds_map_set(global.flags, "sts_score", gameScore);
    
    if (gameScore > ds_map_find_value(global.flags, "sts_highscore"))
    {
        gameNewHighscore = true;
        ds_map_set(global.flags, "sts_highscore", gameScore);
    }
    
    with (obj_htt_temactor)
    {
        colorMerge += 0.05;
        
        if (colorMerge > 1)
            colorMerge = 1;
        
        if (colorMerge == 0.3)
            image_index = 1;
        else if (colorMerge == 0.55)
            image_index = 2;
        else if (colorMerge == 0.7)
            image_index = 3;
    }
    
    with (obj_sansdaterace_platform)
        instance_destroy();
    
    with (obj_htt_bulgen)
    {
        intensity = min(10, intensity + 0.5);
        
        if (intensity < 4.5)
            ds_map_set(global.flags, "sts_htt_gold", ds_map_find_value(global.flags, "sts_htt_gold") + (intensity * 0.65));
        else
            ds_map_set(global.flags, "sts_htt_gold", ds_map_find_value(global.flags, "sts_htt_gold") + ((((1/3) * intensity) + 3) * 0.65));
        
        if (intensity == 3)
            instance_create_xy(other.borderLeft + 10, other.borderBottom - 26, obj_htt_risingbul);
        
        if (other.gameScore >= 50)
            intensity = 100;
        
        other.intensity = intensity;
    }
    
    with (obj_htt_risingbul)
    {
        sfx_play(snd_rise);
        y = other.borderBottom - 26;
    }
    
    platformFlip = xchoose(-1, 1);
    
    if (intensity < 1)
        state = 9;
    else if (intensity < 3)
        state = 10;
    else if (intensity < 5)
        state = 11;
    else if (intensity < 7)
        state = 12;
    else
        state = 13;
    
    event_user(0);
};

gameEnded = false;
gameEndedCounter = 15;

endGame = function()
{
    gameEnded = true;
    
    with (obj_htt_risingbul)
        instance_destroy();
    
    with (obj_htt_bulgen)
        instance_destroy();
    
    with (obj_htt_bul)
        instance_destroy();
    
    with (obj_sansdaterace_platform)
        instance_destroy();
    
    with (obj_viewshaker)
        instance_destroy();
    
    with (obj_htt_temactor)
    {
        fadeOut = true;
        image_index = 0;
    }
    
    borderTargetY = 730;
    
    with (obj_dateheart_blue)
    {
        sfx_play(snd_ding);
        instance_change(obj_dateheart, true);
        x = 312;
        y = 792;
        canMove = false;
    }
    
    gameActive = false;
    state = 18;
    ds_map_set(global.flags, "sts_htt_gold", ceil(ds_map_find_value(global.flags, "sts_htt_gold")));
    
    if (gameScore <= 10 && !ds_map_find_value(global.flags, "sts_htt_patch"))
        global.resume_scene_on_room_start = "stars.htt_lose";
    
    if (gameScore <= 7 && ds_map_find_value(global.flags, "sts_htt_victories") >= 1)
        global.resume_scene_on_room_start = "stars.htt_lose";
    
    event_user(0);
};
