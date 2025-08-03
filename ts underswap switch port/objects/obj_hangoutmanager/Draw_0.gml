if (drawTextbox)
{
    draw_menu_rectangle(boxX1 + x, boxY1 + y, boxX2 + x, boxY2 + y, 1, 9);
    var _x = textX;
    
    if (portraitMode && obj_overworldui.portraitSprite != -1)
    {
        _x = textX + 116;
        obj_overworldui.drawPortrait(238, -8);
    }
    
    if (forceStr != "" || writer != -4)
    {
        var str;
        
        if (forceStr != "")
            str = forceStr;
        else
            str = writer.internalStr;
        
        draw_text_style(_x, textY - ((1 - shrinkTextMultiplier) * global.lang_charheight_lg), str, 16777215, textFont, global.lang_charwidth_md, global.lang_charheight_lgs * shrinkTextMultiplier, textEffect);
    }
    
    var yoffset = 310;
    
    if (choice && writer.isDone)
    {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        set_font(fnt_main);
        
        if (choice == 1)
        {
            draw_set_color((choiceSelection == 0) ? c_yellow : c_white);
            draw_text(140, 84 + yoffset, choiceArr[0]);
            draw_set_color((choiceSelection == 1) ? c_yellow : c_white);
            draw_text(500, 84 + yoffset, choiceArr[1]);
        }
        else
        {
            draw_set_color((choiceSelection == 0) ? c_yellow : c_white);
            draw_text(140, 84 + yoffset, choiceArr[0]);
            draw_set_color((choiceSelection == 1) ? c_yellow : c_white);
            draw_text(320, 116 + yoffset, choiceArr[1]);
            draw_set_color((choiceSelection == 2) ? c_yellow : c_white);
            draw_text(500, 84 + yoffset, choiceArr[2]);
            
            if (choice == 3)
            {
                draw_set_color((choiceSelection == 3) ? c_yellow : c_white);
                draw_text(320, 52 + yoffset, choiceArr[3]);
            }
        }
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        switch (choiceSelection)
        {
            case -1:
                var _chX = 311;
                var _chY = 76 + yoffset;
                draw_sprite_ext(spr_owheart, 0, _chX, _chY, 2, 2, 0, c_white, 1);
                break;
            
            case 0:
                var _chX = 230;
                var _chY = 76 + yoffset;
                draw_sprite_ext(spr_owheart, 0, _chX, _chY, 2, 2, 0, c_white, 1);
                break;
            
            case 1:
                var _chX = (choice == 1) ? 401 : 311;
                var _chY = ((choice == 1) ? 76 : 80) + yoffset;
                draw_sprite_ext(spr_owheart, 0, _chX, _chY, 2, 2, 0, c_white, 1);
                break;
            
            case 2:
                var _chX = 401;
                var _chY = 76 + yoffset;
                draw_sprite_ext(spr_owheart, 0, _chX, _chY, 2, 2, 0, c_white, 1);
                break;
            
            case 3:
                var _chX = 311;
                var _chY = 72 + yoffset;
                draw_sprite_ext(spr_owheart, 0, _chX, _chY, 2, 2, 0, c_white, 1);
                break;
        }
    }
}
