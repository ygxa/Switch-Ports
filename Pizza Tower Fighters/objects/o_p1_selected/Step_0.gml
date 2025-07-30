controller_initialize(global.P1controllerport);
key_accept = keyboard_check_pressed(global.keyboardp1key_jump) || buttonAPress || (o_hand_player1.controllerbymouse && mouse_check_button_pressed(mb_left));
key_start = keyboard_check_pressed(ord("V")) || buttonXPress;
key_no = keyboard_check_pressed(global.keyboardp1key_tilt) || buttonBPress || (o_hand_player1.controllerbymouse && mouse_check_button_pressed(mb_right));

if (key_accept && global.player1 != 0 && point_distance(x, y, o_hand_player1.x, o_hand_player1.y) < 150)
{
    audio_play_sound(su_palette, 50, false);
    
    if (global.player1 != "DO" && global.player1 != "PS" && global.player1 != "FP")
    {
        if (global.palp1 != 8)
            global.palp1++;
        
        if (global.palp1 == 8)
            global.palp1 = 0;
    }
    else
    {
        if (global.palp1 != 9)
            global.palp1++;
        
        if (global.palp1 == 9)
            global.palp1 = 1;
    }
}

if (global.gameselect != "CPU")
{
    if (key_no && global.player1 != 0 && !instance_exists(O_Fade))
    {
        audio_play_sound(su_deselect, 50, false);
        global.player1 = 0;
    }
}
else if (key_no && global.player1 != 0 && !instance_exists(O_Fade) && global.player2 == 0)
{
    audio_play_sound(su_deselect, 50, false);
    global.player1 = 0;
}

switch (global.player1)
{
    case "PS":
        sprite_index = s_cs_selected_pep;
        break;
    
    case "NO":
        sprite_index = s_cs_selected_noise;
        break;
    
    case "TV":
        sprite_index = s_cs_selected_vigi;
        break;
    
    case "FP":
        sprite_index = s_cs_selected_fakepep;
        break;
    
    case "DO":
        if (global.palp1 == 3)
            sprite_index = s_cs_selected_eldiego;
        else
            sprite_index = s_cs_selected_doise;
        
        break;
}
