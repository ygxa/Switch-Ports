controller_initialize(global.P1controllerport);
cursorLevitate = dsin(cursorTime);
cursorTime += leviRate;
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);

if (vert != 0)
    audio_play_sound(su_menuscroll, 50, false);

selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);
spacing = lerp(spacing, 50, 0.1);

if (keyboard_check_pressed(confirmButt) || buttonAPress)
{
    if (selected == 0)
    {
        global.hazards = 0;
        
        if (!instance_exists(o_arcade_score_system))
            instance_create_layer(x, y, layer, o_arcade_score_system);
        
        global.player2 = global.ArcadeArray[global.ArcadeDiffictulty];
        
        if (global.player2 == "PS" || global.player2 == "FP" || global.player2 == "DO")
            global.palp2 = 1;
        else
            global.palp2 = 0;
        
        audio_stop_sound(mu_boogiewoogie);
        audio_stop_sound(mu_elevator);
        
        if (!instance_exists(O_Fade))
            ScrArcadeShuffleMapSelect();
    }
    
    if (selected == 2)
    {
        audio_stop_sound(mu_elevator);
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_SinglePlayerMenu, 20, 0);
    }
    
    if (selected == 1)
    {
        audio_play_sound(su_noway, 50, false);
        ScrArcadeShuffle();
        
        with (obj_towerarcadeicon)
            alarm[0] = (num * 2) + 1;
    }
}

if (selected == 0)
    s_cursor = s_mnu_singleplayer;

if (selected == 1)
    s_cursor = s_mnu_multiplayer;

if (selected == 2)
    s_cursor = s_mnu_options;
