if (mode == 0)
{
    draw_sprite_ext(spr_sc_spep, 0, spepX, 362, 2, 2, 0, c_white, 1);
    
    if (showCheck)
    {
        var ind;
        
        if (checked)
        {
            ind = 2;
        }
        else
        {
            var mx = window_mouse_get_x();
            var my = window_mouse_get_y();
            
            with (obj_gamemanager)
            {
                if (mx >= ((366 * screenXScale) + screenXOffset) && mx <= ((400 * screenXScale) + screenXOffset) && my >= ((392 * screenYScale) + screenYOffset) && my <= ((424 * screenYScale) + screenYOffset))
                {
                    if (mouse_check_button_pressed(mb_any))
                    {
                        other.checked = true;
                        sfx_play(snd_ding);
                        ind = 2;
                    }
                    else
                    {
                        ind = 1;
                    }
                }
                else
                {
                    ind = 0;
                }
            }
        }
        
        draw_sprite_ext(spr_sc_box, ind, 366, 392, 2, 2, 0, c_white, 1);
    }
    
    draw_set_color(c_white);
    draw_set_font(fnt_mainsc);
    draw_set_halign(fa_center);
    
    for (var i = 0; i <= currentLine; i++)
    {
        var s;
        
        if (submode == 0)
            s = lines[i];
        else if (submode == 1)
            s = linesY[i];
        else
            s = linesN[i];
        
        if (s == undefined)
            continue;
        
        if (i == currentLine)
            draw_set_alpha(currFade);
        
        draw_text(320, 10 + (i * 16), s);
        
        if (i == currentLine)
            draw_set_alpha(1);
    }
    
    draw_set_halign(fa_left);
}
else
{
    draw_set_color(c_white);
    draw_set_font(fnt_dotumche_md);
    draw_text(10, 10, msg);
    
    if (keyboard_check_pressed(ord("R")))
    {
        audio_kill_all();
        game_restart_safe();
    }
    
    if (global.gamebroke < 8 && hold != -1)
    {
        if (keyboard_check(ord("X")) || (global.ostype == 1 && instance_exists(obj_mobilecontrols) && obj_mobilecontrols.cancelKey))
        {
            hold++;
            
            if (hold >= 120)
            {
                hold = -1;
                var success = false;
                
                if (mode == 1)
                {
                    var n = _string("file{0}", global.save_variant);
                    
                    if (file_exists(n))
                    {
                        file_delete(n);
                        success = true;
                    }
                }
                else if (mode == 1.5)
                {
                    var n = _string("file{0}_p", global.save_variant);
                    
                    if (file_exists(n))
                    {
                        file_delete(n);
                        success = true;
                    }
                }
                else if (mode == 2)
                {
                    if (file_exists("file_p"))
                    {
                        file_delete("file_p");
                        success = true;
                    }
                }
                
                if (success)
                    show_message_async("Data erased successfully.");
                else
                    show_message_async("Data failed to erase for some reason...");
            }
        }
        else
        {
            hold = 0;
        }
    }
    else if (global.gamebroke == 11)
    {
        draw_set_font(fnt_mainsm);
        draw_text_ext(10, 128, msg2, 16, 620);
    }
}
