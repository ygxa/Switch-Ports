if (global.gameselect != "CPU")
{
    key_accept = keyboard_check_pressed(global.keyboardp2key_jump) || (o_hand_player1.controllerbymouse && mouse_check_button_pressed(mb_left));
    key_start = keyboard_check_pressed(ord("I"));
    key_no = keyboard_check_pressed(global.keyboardp2key_tilt) || (o_hand_player1.controllerbymouse && mouse_check_button_pressed(mb_right));
    
    if (key_accept && global.player2 != 0 && point_distance(x, y, o_hand_player2.x, o_hand_player2.y) < 150)
    {
        audio_play_sound(su_palette, 50, false);
        
        if (global.player2 != "DO" && global.player2 != "PS" && global.player2 != "FP")
        {
            if (global.palp2 != 8)
                global.palp2++;
            
            if (global.palp2 == 8)
                global.palp2 = 0;
        }
        else
        {
            if (global.palp2 != 9)
                global.palp2++;
            
            if (global.palp2 == 9)
                global.palp2 = 1;
        }
    }
    
    if (key_no && global.player2 != 0 && !instance_exists(O_Fade))
    {
        audio_play_sound(su_deselect, 50, false);
        global.player2 = 0;
    }
}
else
{
    controller_initialize(global.P1controllerport);
    key_accept = keyboard_check_pressed(ord("Z")) || buttonAPress;
    key_start = keyboard_check_pressed(ord("V")) || buttonXPress;
    key_no = keyboard_check_pressed(ord("X")) || buttonBPress;
    
    if (key_accept && global.player2 != 0 && point_distance(x, y, o_hand_player1.x, o_hand_player1.y) < 200)
    {
        audio_play_sound(su_palette, 50, false);
        
        if (global.player2 != "DO" && global.player2 != "PS" && global.player2 != "FP")
        {
            if (global.palp2 != 8)
                global.palp2++;
            
            if (global.palp2 == 8)
                global.palp2 = 0;
        }
        else
        {
            if (global.palp2 != 9)
                global.palp2++;
            
            if (global.palp2 == 9)
                global.palp2 = 1;
        }
    }
    
    if (key_no && global.player2 != 0 && !instance_exists(O_Fade))
    {
        audio_play_sound(su_deselect, 50, false);
        global.player2 = 0;
    }
}

switch (global.player2)
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
        if (global.palp2 == 3)
            sprite_index = s_cs_selected_eldiego;
        else
            sprite_index = s_cs_selected_doise;
        
        break;
}
