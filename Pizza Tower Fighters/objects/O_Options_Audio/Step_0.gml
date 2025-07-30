controller_initialize(global.P1controllerport);
cursorLevitate = dsin(cursorTime);
menuselect[0] = floor(global.default_group_gain * 100);
menuselect[1] = floor(global.music_group_gain * 100);
menuselect[2] = floor(global.sfx_group_gain * 100);
cursorTime += leviRate;
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);

if (!instance_exists(O_Fade))
{
    if (vert != 0)
        audio_play_sound(su_menuscroll, 50, false);
}

selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);
var leave = keyboard_check_pressed(leaveButt);

if (!instance_exists(O_Fade))
{
    if (menu[selected] == "MASTER: ")
    {
        if (keyboard_check(leftButt) || lsMoveLeft || dpadLeft)
        {
            global.default_group_gain -= 0.01;
            global.default_group_gain = clamp(global.default_group_gain, 0, 1);
            audio_master_gain(global.default_group_gain);
        }
        
        if (keyboard_check(rightButt) || lsMoveRight || dpadRight)
        {
            global.default_group_gain += 0.01;
            global.default_group_gain = clamp(global.default_group_gain, 0, 1);
            audio_master_gain(global.default_group_gain);
        }
    }
    
    if (menu[selected] == "MUSIC: ")
    {
        if (keyboard_check(leftButt) || lsMoveLeft || dpadLeft)
        {
            global.music_group_gain -= 0.01;
            global.music_group_gain = clamp(global.music_group_gain, 0, 1);
            audio_group_set_gain(mu_credits, global.music_group_gain, 0);
        }
        
        if (keyboard_check(rightButt) || lsMoveRight || dpadRight)
        {
            global.music_group_gain += 0.01;
            global.music_group_gain = clamp(global.music_group_gain, 0, 1);
            audio_group_set_gain(mu_credits, global.music_group_gain, 0);
        }
    }
    
    if (menu[selected] == "SFX: ")
    {
        if (keyboard_check(leftButt) || lsMoveLeft || dpadLeft)
        {
            global.sfx_group_gain -= 0.01;
            global.sfx_group_gain = clamp(global.sfx_group_gain, 0, 1);
            audio_group_set_gain(mu_boogiewoogie, global.sfx_group_gain, 0);
        }
        
        if (keyboard_check(rightButt) || lsMoveRight || dpadRight)
        {
            global.sfx_group_gain += 0.01;
            global.sfx_group_gain = clamp(global.sfx_group_gain, 0, 1);
            audio_group_set_gain(mu_boogiewoogie, global.sfx_group_gain, 0);
        }
    }
    
    if ((menu[selected] == "ESCAPE" && (keyboard_check_pressed(confirmButt) || buttonAPress)) || (leave && !instance_exists(O_Fade)))
    {
        audio_play_sound(su_select, 50, false);
        instance_create_depth(x, y, depth, o_menu_options);
        instance_destroy();
    }
}

if (leave && !instance_exists(O_Fade))
{
    audio_play_sound(su_select, 50, false);
    instance_create_depth(x, y, depth, o_menu_options);
    instance_destroy();
}

if (mouse_check_button_pressed(mb_any))
    ScrSlidingTextCreate("USE KEYBOARD");
