if (checkingPadTimer < 60)
    checkingPadTimer++;

if (checkingPadPress)
{
    if (global.control_gamepad && gamepad_is_connected(global.control_gamepad_device))
    {
        if (gamepad_check_any_pressed(global.control_gamepad_device) || gamepad_check_any_analog(global.control_gamepad_device))
        {
            checkingPadPress = false;
            global.gamepad_buttons_type = gamepad_identify_type(global.control_gamepad_device);
        }
    }
    else
    {
        checkingPadPress = false;
    }
}

if (global.border == 0)
{
    currentBorderSprite = -1;
    
    if (lastBorder != 0)
    {
        lastBorder = 0;
        
        if (global.flush_textures)
            texture_unload("borders");
    }
}
else if (global.gamebroke == -1)
{
    lastBorder = global.border;
    
    if (borderFade == 0)
    {
        var rm;
        
        if (room == rm_battle || room == rm_date)
            rm = global.currentroom;
        else
            rm = room;
        
        with (obj_player)
        {
            if (transitionTargetRoom != -1)
                rm = transitionTargetRoom;
        }
        
        var preconfig = false;
        
        if (rm == rm_preconfig)
        {
            with (obj_preconfig)
            {
                if (optionsMode)
                {
                    if (section == 6 || (section == 1 && selected == 5))
                        preconfig = true;
                }
                else if (selected == 1 && global.border != 0)
                {
                    preconfig = true;
                }
            }
        }
        
        if ((asset_has_tags(rm, ["early"], 3) && !preconfig) || asset_has_tags(rm, ["noborder"], 3) || (global.border == 1 && instance_exists(obj_room_unpersistent)))
        {
            targetBorderSprite = -1;
        }
        else
        {
            switch (global.border)
            {
                case 2:
                    targetBorderSprite = spr_border_classic;
                    break;
                
                case 3:
                    targetBorderSprite = spr_border_simple;
                    break;
                
                case 4:
                    targetBorderSprite = spr_border_sepia;
                    break;
                
                case 1:
                    if (rm == rm_intro || rm == rm_menu_start)
                    {
                        targetBorderSprite = spr_border_sepia;
                    }
                    else if (rm == rm_wake || rm == rm_temmie || rm == rm_ruina_final)
                    {
                        targetBorderSprite = spr_border_caverns;
                    }
                    else if (rm == rm_load)
                    {
                        if (!instance_exists(obj_namehandler))
                        {
                            switch (global.currentarea)
                            {
                                case -1:
                                default:
                                    targetBorderSprite = spr_border_sepia;
                                    break;
                                
                                case 0:
                                case 1:
                                    targetBorderSprite = spr_border_ruinedhome;
                                    break;
                                
                                case 2:
                                    targetBorderSprite = spr_border_starlight;
                                    break;
                                
                                case 3:
                                    targetBorderSprite = spr_border_crystal;
                                    break;
                            }
                        }
                    }
                    else if (rm == rm_preconfig || ((global.currentarea == 0 || global.currentarea == 1) && asset_has_tags(rm, ["ruinedhome"], 3)))
                    {
                        targetBorderSprite = spr_border_ruinedhome;
                    }
                    else if (global.currentarea == 2 && asset_has_tags(rm, ["starlightisles"], 3))
                    {
                        if (rm == rm_star23_chase2)
                        {
                            if (ds_map_find_value(global.flags, "plot") < 57 || ds_map_find_value(global.flags, "plot") >= 58 || ds_map_find_value(global.flags, "st_kk_esc") >= 6)
                                targetBorderSprite = spr_border_starlight;
                            else
                                targetBorderSprite = spr_border_koffinkeep;
                        }
                        else if (asset_has_tags(rm, ["koffinkeep"], 3))
                        {
                            targetBorderSprite = spr_border_koffinkeep;
                        }
                        else
                        {
                            targetBorderSprite = spr_border_starlight;
                        }
                    }
                    else if (global.currentarea == 3 && asset_has_tags(rm, ["crystalsprings"], 3))
                    {
                        targetBorderSprite = spr_border_crystal;
                    }
                    else
                    {
                        targetBorderSprite = -1;
                    }
                    
                    break;
            }
        }
    }
    
    if (targetBorderSprite != currentBorderSprite)
    {
        if (borderFade < 1)
        {
            if (texturegroup_get_status("borders") == 3)
            {
                var spd = 0.05;
                
                with (obj_fader)
                {
                    if (borderFadeSpeed)
                        spd = fadeSpeed;
                }
                
                borderFade += spd;
            }
        }
        else
        {
            borderFade = 0;
            currentBorderSprite = targetBorderSprite;
        }
    }
    else
    {
        borderFade = 0;
    }
}

control_update();
audio_update();
var f = window_get_fullscreen();
var usedF4 = false;

if (os_type != os_gxgames && keyboard_check_pressed(vk_f4))
{
    usedF4 = true;
    f = !f;
    window_set_fullscreen(f);
}

if ((global.windowtype != 3) == f)
{
    if (f)
    {
        global.windowtype_returnto = global.windowtype;
        global.windowtype = 3;
    }
    else
    {
        global.windowtype = global.windowtype_returnto;
    }
    
    if (alarm[0] > -1)
        window_update();
    
    alarm[0] = 30;
    config_save();
}

if (global.gamebroke != -1)
    exit;

if (global.freeze_on_room_start > 0)
{
    global.freeze_on_room_start--;
    
    if (global.freeze_on_room_start == 0)
        global.canmove = true;
}

if (waitTimer > 0)
{
    waitTimer--;
    
    if (waitTimer == 0)
    {
        var callbackResumeScene = waitCallbackResumeScene;
        var callback = waitCallback;
        
        if (callback != undefined)
        {
            var cb = callback;
            
            if (callback == waitCallback)
                waitCallback = undefined;
            
            try
            {
                cb();
            }
            catch (e)
            {
                debug_error(e);
            }
            
            if (global.restarting)
                exit;
        }
        
        if (callback == undefined || callbackResumeScene)
            dx_instance_resume((waitInst == undefined) ? global.dxinst : waitInst);
        
        if (global.restarting)
            exit;
    }
}

if (global.fader_pause && !instance_exists(obj_transition_parent))
{
    global.fader_pause = false;
    scene_resume();
}

if (global.restarting)
    exit;

if (waitSound != -1 && !audio_is_playing(waitSound))
    music_gain(waitMusVolume, 400);

var gf = ds_map_find_value(global.flags, "gf");

if (gf == -1)
{
    if (ruth_enabled())
        ds_map_set(global.flags, "gf", 0);
}
else if (gf == 0 && !ruth_possible())
{
    ds_map_set(global.flags, "gf", 1);
}
