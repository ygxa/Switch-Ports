obj_gamemanager.textHandler = function(argument0)
{
    argument0 = format_text_basic(argument0, true, false);
    var split = string_split(format_text_clear(argument0), "#");
    var lineCount = array_length(split);
    textY = 428 - (36 * (lineCount - 1));
    var font, charWidth;
    
    switch (textType)
    {
        case 3:
            font = fnt_sans;
            charWidth = global.lang_charwidth_md;
            break;
        
        case 4:
            font = fnt_papyrus;
            charWidth = global.lang_charwidth_lg2;
            break;
        
        default:
            font = fnt_main;
            charWidth = global.lang_charwidth_md;
            break;
    }
    
    var fontData = ds_map_find_value(global.lang_fonts, font);
    set_font(font);
    
    for (var i = 0; i < lineCount; i++)
    {
        var l = string_trim_end(split[i]);
        var len = string_length(l);
        var width = 0;
        
        for (var j = 1; j <= len; j++)
        {
            var char = string_char_at(l, j);
            var charOrd = ord(char);
            var charData = ds_map_find_value(fontData.offsetXMap, charOrd) ?? fontData.offsetXDefault;
            var offset = 0;
            
            if (!is_undefined(charData))
            {
                offset = charData[0] * fontData.scale;
                
                if (charData[2] != 0 && ((j + 1) <= len && string_char_at(l, j + 1) == char))
                    offset = charData[2] * fontData.scale;
                
                width += (charData[1] * fontData.scale);
            }
            
            width += lang_charwidth_font(charOrd, charWidth, fontData);
            
            if (j < len)
                width += offset;
        }
        
        var lastChar = string_char_at(l, len);
        var extraRightSpace = (charWidth - (fontData.scale * string_width(lastChar))) + 2;
        width -= extraRightSpace;
        textX[i] = (320 - floor(width * 0.5)) + 1;
    }
    
    text = argument0;
    startDialogue();
    return true;
};

obj_gamemanager.sceneEndHandler = function()
{
    textSpeed = 2;
    textSound = -1;
    textType = 0;
    
    if (didChoice)
    {
        if (choice == 0)
        {
            state = -1;
            alarm[8] = 1;
            alarm[6] = 15;
        }
        else
        {
            state = -3;
            alarm[4] = 1;
        }
        
        instance_destroy(writer);
        writer = -4;
    }
    else
    {
        textAlpha = 0;
        state = -2;
        textY = 392;
    }
    
    return true;
};

if (permadeath)
{
    dx_scene("gameover_start_permadeath");
}
else
{
    var special = false;
    
    switch (global.battle_id)
    {
        case -1:
            if (ds_map_find_value(global.flags, "plot") < 25 && (global.currentroom == rm_ruins3 || global.currentroom == rm_ruins4))
            {
                special = true;
                textSpeed = 1;
                textSound = snd_mdblip;
                dx_scene("gameover_start_dummy");
            }
            
            if (ds_map_find_value(global.flags, "plot") < 56 && (global.currentroom == rm_star22_chase1 || global.currentroom == rm_star23_chase2))
            {
                special = true;
                textSpeed = 1;
                textSound = snd_mdblip;
                dx_scene("gameover_start_house");
            }
            
            if (global.currentroom == rm_stars_bridge || global.currentroom == rm_crys_start || global.currentroom == rm_crys_start_save || global.currentroom == rm_crys_premines)
            {
                special = true;
                textSpeed = 1;
                dx_scene("gameover_start_navychase");
            }
            
            break;
        
        case 25:
            special = true;
            textSpeed = 1;
            textSound = snd_metblip;
            dx_scene("gameover_start_mettalot");
            break;
        
        case 27:
            special = true;
            textSpeed = 2;
            textSound = snd_asgblip;
            dx_scene("gameover_start_asgore");
            break;
        
        case 39:
            special = true;
            textSpeed = 1;
            textSound = snd_textblip2;
            dx_scene("gameover_start_muffet");
            break;
        
        case 41:
            special = true;
            textSpeed = 1;
            textSound = snd_harblip;
            dx_scene("gameover_start_boogie");
            break;
        
        case 42:
            special = true;
            textSpeed = 1;
            textSound = snd_koffinblip;
            dx_scene("gameover_start_koffink");
            break;
        
        case 43:
            special = true;
            textSpeed = 1;
            textSound = snd_cbblip;
            textType = 3;
            dx_scene("gameover_start_crossbones");
            break;
        
        case 46:
            special = true;
            textSpeed = 1;
            textSound = snd_sansblip;
            textType = 3;
            dx_scene("gameover_start_sans");
            break;
    }
    
    if (!special)
        dx_scene("gameover_start");
}
