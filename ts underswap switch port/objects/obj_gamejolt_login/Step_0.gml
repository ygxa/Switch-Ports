if (fading == 1)
{
    alpha += 0.1;
    
    if (alpha >= 1)
    {
        alpha = 1;
        fading = 3;
    }
    
    exit;
}
else if (fading == 2)
{
    alpha -= 0.1;
    
    if (alpha <= 0)
        instance_destroy();
    
    exit;
}

if (textFadeDir == 2)
{
    textFade -= 0.0125;
    
    if (textFade <= 0.7)
        textFadeDir = 1;
}
else
{
    textFade += 0.0125;
    
    if (textFade >= 1)
        textFadeDir = 2;
}

if (state < 2)
    show_keyboard();

switch (state)
{
    case 0:
        if (notDoneAnythingTimer != -1)
        {
            notDoneAnythingTimer++;
            
            if (notDoneAnythingTimer >= 480)
            {
                fading = 2;
                break;
            }
        }
        
        username = take_keyboard_input(function(argument0)
        {
            var key = ord(string_upper(argument0));
            return (key >= 65 && key <= 90) || (key >= 48 && key <= 57) || argument0 == "_" || argument0 == "-";
        }, function()
        {
            notDoneAnythingTimer = -1;
            sfx_play(snd_select);
            state = 1;
            token = "";
        });
        break;
    
    case 1:
        token = take_keyboard_input(function(argument0)
        {
            var key = ord(string_upper(argument0));
            return key >= 32 && key <= 126;
        }, function()
        {
            sfx_play(snd_select);
            global.gj_username = username;
            global.gj_token = token;
            
            if (global.gj_initialized)
                gj_login(global.gj_username, global.gj_token);
            else
                gj_init();
            
            state = 2;
            keyboard_string = "";
            keyboard_virtual_hide();
        });
        break;
    
    case 2:
        if (!instance_exists(obj_gamejolt) || obj_gamejolt.auth >= (3 << 0) || obj_gamejolt.session == (3 << 0) || obj_gamejolt.trophyLoad == (3 << 0))
        {
            sel = 0;
            state = 3;
        }
        else if (obj_gamejolt.trophyLoad == (2 << 0))
        {
            state = 5;
        }
        else if (global.control_cancel_pressed)
        {
            instance_destroy(obj_gamejolt);
            sel = 0;
            state = 4;
        }
        
        break;
    
    case 3:
    case 4:
        if (global.control_left_pressed || global.control_right_pressed)
        {
            sfx_play(snd_squeak);
            sel = !sel;
        }
        
        if (global.control_confirm_pressed)
        {
            sfx_play(snd_select);
            
            if (sel == 0)
            {
                keyboard_string = "";
                show_keyboard();
                state = 0;
                username = "";
            }
            else
            {
                instance_destroy(obj_gamejolt);
                fading = 2;
            }
        }
        
        break;
    
    case 5:
        if (global.control_confirm_pressed)
        {
            sfx_play(snd_select);
            sel = 0;
            state = 6;
        }
        
        break;
    
    case 6:
        if (global.control_left_pressed || global.control_right_pressed)
        {
            sfx_play(snd_squeak);
            sel = !sel;
        }
        
        if (global.control_confirm_pressed)
        {
            sfx_play(snd_select);
            
            if (sel == 0)
                gj_store_credentials(username, token);
            
            fading = 2;
        }
        
        break;
}
