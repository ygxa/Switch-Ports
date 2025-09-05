if (!loaded)
    exit;

var _percent = filePercentage[selectedFile];
var _mag = floor(abs(fileDisplayPercent - _percent) / 10);
fileDisplayPercent = approach(fileDisplayPercent, _percent, max(_mag, 5));

if (!blockedInputs)
{
    scr_getinput_menu();
    
    if (keyboard_check_pressed(vk_f1))
        scr_resetinput();
}

flashbuffer = min(flashbuffer - 1, 0);

if (!flashbuffer)
{
    flashshake[0] = 0;
    flashshake[1] = 0;
    flashshake[2] = 0;
}

if (image_index >= (image_number - 1))
{
    image_speed = 0;
    abletomove = true;
    movePizzy = true;
    hudAlpha = min(hudAlpha + 0.08, 1);
}
else if (any_input_pressed_check())
{
    if (image_speed != 1)
    {
        event_play_oneshot("event:/SFX/fileselect/curtain");
        image_speed = 1;
    }
}

for (var i = 0; i < array_length(fileSelectHeightRatio); i++)
{
    if (selectedFile == i && abletomove)
        fileSelectHeightRatio[i] = lerp(fileSelectHeightRatio[i], 1, 0.1);
    else
        fileSelectHeightRatio[i] = lerp(fileSelectHeightRatio[i], 0, 0.1);
}

lightsOn = image_index == 4 || image_index > 6;
var bg_asset = layer_sprite_get_id(layer_get_id("Assets_1_Lang"), "graphic_E598CAF");
layer_sprite_index(bg_asset, lightsOn);
painterIndex += 0.35;

if (movePizzy)
{
    pizzyX = round(lerp(pizzyX, 636, 0.2));
    pizzyY = round(lerp(pizzyY, 137, 0.3));
}

if (flashbuffer > 0)
    flashbuffer--;

if (array_contains(saves_idle, saves_sprite))
{
    if (saves_visual == 0 && selectedFile == 2)
    {
        saves_visual = 2;
        saves_sprite = saves_left[0];
    }
    else if (saves_visual == 2 && selectedFile == 0)
    {
        saves_visual = 0;
        saves_sprite = saves_right[2];
    }
    else if (saves_visual != selectedFile)
    {
        var _oldSel = saves_visual;
        saves_visual = approach(saves_visual, selectedFile, 1);
        var _diff = saves_visual - _oldSel;
        var _arr = (_diff == -1) ? saves_left : saves_right;
        saves_sprite = _arr[_oldSel];
        saves_index = 0;
    }
}

if (array_contains(saves_left, saves_sprite) || array_contains(saves_right, saves_sprite))
{
    saves_index += 0.35;
    
    if (sprite_animation_end(saves_sprite, saves_index))
    {
        saves_index = 0;
        
        switch (saves_sprite)
        {
            case spr_titlePizzelle_exhib2l:
            case spr_titlePizzelle_exhib3r:
                saves_sprite = spr_titlePizzelle_exhib1;
                break;
            
            case spr_titlePizzelle_exhib1r:
            case spr_titlePizzelle_exhib3l:
                saves_sprite = spr_titlePizzelle_exhib2;
                break;
            
            case spr_titlePizzelle_exhib1l:
            case spr_titlePizzelle_exhib2r:
                saves_sprite = spr_titlePizzelle_exhib3;
                break;
        }
    }
}

var play_emptyfile_sound = false;
var _stepsDynamic, old_mouseX, old_mouseY;

if (abletomove && !blockedInputs && !activated)
{
    if (!instance_exists(obj_option) && !instance_exists(obj_fileDeleter) && !instance_exists(obj_exitGame))
    {
        play_emptyfile_sound = !fileOpened[selectedFile];
        selectedFile += (key_right2 + key_left2);
        
        if (selectedFile < 0)
            selectedFile = 2;
        else if (selectedFile > 2)
            selectedFile = 0;
        
        if (key_right2 || -key_left2)
        {
            event_play_oneshot(sfx_paperball);
            fileDisplayPercent = 0;
        }
        
        if (key_jump && ((charicon == spr_menu_charswaptoPizzano && global.playerCharacter == 1) || (charicon == spr_menu_charswaptoPizzelle && global.playerCharacter == 0) || charicon == spr_menu_pizzelle || charicon == spr_menu_pizzano))
        {
            with (obj_music)
            {
                if (!is_undefined(global.RoomMusic))
                {
                    fmod_studio_event_instance_stop(global.RoomMusic.musicInst, true);
                    fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, true);
                }
            }
            
            event_play_oneshot(sfx_bigcollectget);
			if selectedFile = 0
				fmod_studio_event_instance_start(sfx_fileselect1);
			if selectedFile = 1
				fmod_studio_event_instance_start(sfx_fileselect2);
			if selectedFile = 2
				fmod_studio_event_instance_start(sfx_fileselect3);
            blockedInputs = true;
            alarm[2] = 250;
            activated = true;
            saves_sprite = saves_idle[selectedFile];
            fileSelectHeightRatio[selectedFile] = 1;
            ds_queue_clear(saves_queue);
        }
        else if (key_start2)
        {
            blockedInputs = true;
            instance_create(0, 0, obj_option);
            exit;
        }
        else if (key_taunt2 && filePresent[selectedFile])
        {
            blockedInputs = true;
            instance_create(0, 0, obj_fileDeleter, 
            {
                selectedFile: selectedFile
            });
            exit;
        }
    }
    
    old_mouseX = mouseX;
    old_mouseY = mouseY;
    mouseX = get_mouse_x_screen(0);
    mouseY = get_mouse_y_screen(0);
    _stepsDynamic = point_distance(old_mouseX, old_mouseY, mouseX, mouseY);
    
    if (_stepsDynamic < 1)
        _stepsDynamic = 1;
    
    _stepsDynamic = round(_stepsDynamic);
    var _scrollMove = mouse_wheel_up() - mouse_wheel_down();
    lineWidth += _scrollMove;
    lineWidth = round(clamp(lineWidth, 1, 20));
}

var _color = mouse_check_button(mb_right) ? 16777215 : 5183024;
doodle_surface_manage();

for (var i = 0; i < array_length(fileDoodleSurf); i++)
{
    fileDoodlePos[i][1] = (125 - round(60 * fileSelectHeightRatio[i])) + 23;
    var _grid_x = fileDoodlePos[i][0];
    var _grid_y = fileDoodlePos[i][1];
    
    if (surface_exists(fileDoodleSurf[i]) && (mouse_check_button(mb_left) || mouse_check_button(mb_right)) && abletomove && !blockedInputs && !activated)
    {
        surface_set_target(fileDoodleSurf[i]);
        
        for (var z = 0; z < _stepsDynamic; z++)
        {
            _xx = round(lerp(old_mouseX - _grid_x, mouseX - _grid_x, z / _stepsDynamic));
            _yy = round(lerp(old_mouseY - _grid_y, mouseY - _grid_y, z / _stepsDynamic));
            
            if ((_xx >= 0 && _xx <= fileDoodleW) && (_yy >= 0 && _yy <= fileDoodleH))
            {
                draw_circle_color(_xx, _yy, lineWidth, _color, _color, false);
                
                if (!buffer_exists(fileDoodleBuffer[i]))
                    fileDoodleBuffer[i] = buffer_create(fileDoodleW * fileDoodleH * 4, buffer_fixed, 1);
                
                buffer_get_surface(fileDoodleBuffer[i], fileDoodleSurf[i], 0);
            }
        }
        
        surface_reset_target();
    }
    
    var _xx = mouseX - _grid_x;
    var _yy = mouseY - _grid_y;
    
    if (!(abletomove && !blockedInputs && !activated))
    {
        previewalpha = 0;
    }
    else if ((_xx >= 0 && _xx <= fileDoodleW) && (_yy >= 0 && _yy <= fileDoodleH))
    {
        global.DefaultCursor = -3;
        previewalpha = lerp(previewalpha, 1, 0.3);
    }
    else
    {
        previewalpha = lerp(previewalpha, 0, 0.3);
    }
}

if (play_emptyfile_sound)
{
    if (!event_instance_isplaying(sndEmpty))
        fmod_studio_event_instance_start(sndEmpty);
}
else if (event_instance_isplaying(sndEmpty))
{
    fmod_studio_event_instance_stop(sndEmpty, true);
}

if global.panpizzano
	var _move_v = key_down2 - key_up2;
else{
	var _move_v = 0
	prevselected = 0;
	char_select = 1;
	prevcharselect = 1;
	charicon = spr_menu_pizzelle;
	charindex = 0;
	arrowicon = spr_menu_pizzelle_arrow;	
    savePath = ["saveData1_EN.ini", "saveData2_EN.ini", "saveData3_EN.ini"];
    
    for (var i = 0; i < 3; i++)
    {
        if (file_exists(savePath[i]))
        {
            ini_open(savePath[i]);
            filePalette[i] = ini_read_real("Misc", "playerPaletteIndex_" + string(scr_getCharacterPrefix(global.playerCharacter)), 2);
            fileOpened[i] = ini_read_real("Game", "seconds", 0) != 0 || ini_read_real("Game", "minutes", 0) != 0;
            ini_close();
            filePercentage[i] = scr_completion_percent(savePath[i]);
            filePresent[i] = true;
            fileJudgment[i] = scr_judgment_read(savePath[i]);
        }
        else
        {
            filePalette[i] = 2;
            filePercentage[i] = 0;
            filePresent[i] = false;
            fileJudgment[i] = scr_judgment_get("none");
            fileOpened[i] = false;
        }
        
        doonce = 0;
    }
}

if (!obj_mainfileselect.abletomove)
    _move_v = 0;

if (charicon == spr_menu_charswaptoPizzelle || charicon == spr_menu_charswaptoPizzano)
{
    charindex = clamp(charindex, 0, 9);
    
    if (charindex >= 3 && charicon == spr_menu_charswaptoPizzelle)
    {
        scr_player_changeCharacter(obj_parent_player, 0);
        doonce = 1;
    }
    
    if (charindex >= 3 && charicon == spr_menu_charswaptoPizzano)
    {
        scr_player_changeCharacter(obj_parent_player, 1);
        doonce = 1;
    }
    
    if (charindex >= 8 && charicon == spr_menu_charswaptoPizzelle)
    {
        charindex = 0;
        charicon = spr_menu_pizzelle;
    }
    else if (charindex >= 8 && charicon == spr_menu_charswaptoPizzano)
    {
        charindex = 0;
        charicon = spr_menu_pizzano;
    }
}

if (_move_v != 0 && (charicon == spr_menu_pizzelle || charicon == spr_menu_pizzano))
{
    char_select += _move_v;
    char_select = clamp(char_select, 1, 2);
    
    if (prevcharselect != char_select)
    {
        prevcharselect = char_select;
        
        switch (char_select)
        {
            case 1:
                charicon = spr_menu_charswaptoPizzelle;
                arrowicon = spr_menu_pizzelle_arrow;
                charindex = 0;
                break;
            
            case 2:
                charicon = spr_menu_charswaptoPizzano;
                arrowicon = spr_menu_pizzano_arrow;
                charindex = 0;
                break;
        }
        
        icon_y = 5 * _move_v;
        icon_y_buffer = 8;
        char_select = 2;
        event_play_oneshot("event:/SFX/ui/step");
    }
}

if (global.playerCharacter == 1 && savePath != ["saveData1_PN_EN.ini", "saveData2_PN_EN.ini", "saveData3_PN_EN.ini"] && doonce == 1)
{
    savePath = ["saveData1_PN_EN.ini", "saveData2_PN_EN.ini", "saveData3_PN_EN.ini"];
    
    for (var i = 0; i < 3; i++)
    {
        if (file_exists(savePath[i]))
        {
            ini_open(savePath[i]);
            filePalette[i] = ini_read_real("Misc", "playerPaletteIndex_" + string(scr_getCharacterPrefix(global.playerCharacter)), 2);
            fileOpened[i] = ini_read_real("Game", "seconds", 0) != 0 || ini_read_real("Game", "minutes", 0) != 0;
            ini_close();
            filePercentage[i] = scr_completion_percent(savePath[i]);
            filePresent[i] = true;
            fileJudgment[i] = scr_judgment_read(savePath[i]);
        }
        else
        {
            filePalette[i] = 2;
            filePercentage[i] = 0;
            filePresent[i] = false;
            fileJudgment[i] = scr_judgment_get("none");
            fileOpened[i] = false;
        }
    }
    
    doonce = 0;
}
else if (global.playerCharacter == 0 && savePath != ["saveData1_EN.ini", "saveData2_EN.ini", "saveData3_EN.ini"] && doonce == 1)
{
    savePath = ["saveData1_EN.ini", "saveData2_EN.ini", "saveData3_EN.ini"];
    
    for (var i = 0; i < 3; i++)
    {
        if (file_exists(savePath[i]))
        {
            ini_open(savePath[i]);
            filePalette[i] = ini_read_real("Misc", "playerPaletteIndex_" + string(scr_getCharacterPrefix(global.playerCharacter)), 2);
            fileOpened[i] = ini_read_real("Game", "seconds", 0) != 0 || ini_read_real("Game", "minutes", 0) != 0;
            ini_close();
            filePercentage[i] = scr_completion_percent(savePath[i]);
            filePresent[i] = true;
            fileJudgment[i] = scr_judgment_read(savePath[i]);
        }
        else
        {
            filePalette[i] = 2;
            filePercentage[i] = 0;
            filePresent[i] = false;
            fileJudgment[i] = scr_judgment_get("none");
            fileOpened[i] = false;
        }
        
        doonce = 0;
    }
}
