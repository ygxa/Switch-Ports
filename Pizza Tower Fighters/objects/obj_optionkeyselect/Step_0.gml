controller_initialize(global.P1controllerport);
ScrPlayer1Input();
offsetx = lerp(offsetx, 0, 0.1);
drawsp = approach(drawsp, 1, 0.01);
draw += drawsp;

if (gamepad_check_input(global.P1controllerport))
    controllermode = 1;
else if (keyboard_check_pressed(vk_anykey))
    controllermode = 0;

if (!instance_exists(obj_keyset))
{
    move = (keyboard_check_pressed(global.keyboardp1down) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(global.keyboardp1up) || stickUpPressed || dpadUpPress);
    backbuffer--;
    
    if (backbuffer < 1)
    {
        key_selected += move;
        key_selected = clamp(key_selected, 0, array_length(keys) - 1);
        
        if (key_jump)
        {
            audio_play_sound(su_select, 50, false);
            
            if (key_selected == 8)
            {
                instance_create_depth(x, y + 50, depth, o_menu_options);
                instance_destroy();
            }
            else
            {
                var depth1 = depth - 1;
                
                with (instance_create_depth(x, y, depth1, obj_keyset))
                    state = other.key_selected;
            }
        }
    }
    
    if (keyboard_check_pressed(vk_shift))
    {
        audio_play_sound(su_noway, 50, false);
        instance_create_depth(x, y, depth, obj_optionkeyselectP2);
        instance_destroy();
    }
}
