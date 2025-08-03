var borderType = ds_map_find_value(global.pflags_global, "box_border");
var drawDarkener = false;

if (!boxTransform)
{
    if (boxSurfaceTransform != -1 && surface_exists(boxSurfaceTransform))
    {
        surface_free(boxSurfaceTransform);
        boxSurfaceTransform = -1;
    }
    
    if (darkenAlpha != 0)
        drawDarkener = true;
    else
        draw_menu_rectangle(boxX1, boxY1, boxX2, boxY2, 1, 9);
}

if (drawStats)
{
    var karma = statsKarmaHandler != undefined;
    var xoff = (compactStats ? 26 : 0) + hpBarOffset;
    
    if (karma)
        xoff -= floor(20 * (global.playerlv / 20));
    
    draw_set_color(c_white);
    set_font(fnt_mars);
    
    if (compactStats)
        draw_text(200, 400, statsText);
    else
        draw_text(30, 400, statsText);
    
    if (karma)
    {
        if (statsHPKarmaWidth != 0)
            draw_set_color(c_fuchsia);
        
        xoff += 36;
    }
    
    draw_text(xoff + 274 + 16 + statsHPWidth + statsHPTextXOffset, 400 + statsHPTextYOffset, statsHP);
    
    if (karma)
    {
        if (statsHPKarmaWidth != 0)
            draw_set_color(c_white);
        
        xoff -= 36;
    }
    
    draw_sprite(lang_get_sprite(spr_hptext), 0, xoff + 244, 405);
    
    if (karma)
        draw_sprite(lang_get_sprite(spr_krtext), 0, xoff + 284 + statsHPWidth, 405);
    
    if (hpBarSurface == -1 || !surface_exists(hpBarSurface))
        hpBarSurface = surface_create(256, 32);
    
    surface_set_target(hpBarSurface);
    draw_clear_alpha(c_black, 0);
    draw_rectangle_pix(0, 0, statsHPWidth, 21, karma ? merge_color(c_red, c_maroon, 0.5) : 255, 1);
    draw_rectangle_pix(0, 0, statsHPWidth2, 21, 65280, 1);
    
    if (statsHPKarmaWidth != 0)
        draw_rectangle_pix(statsHPKarmaOff, 0, statsHPKarmaWidth, 21, 16711935, 1);
    
    if (borderType != 1)
    {
        gpu_set_blendenable(false);
        gpu_set_colorwriteenable(false, false, false, true);
        draw_sprite(spr_roundhp, 0, 0, 0);
        draw_sprite(spr_roundhp, 1, statsHPWidth - 4, 0);
        draw_sprite(spr_roundhp, 2, statsHPWidth - 4, 17);
        draw_sprite(spr_roundhp, 3, 0, 17);
        gpu_set_colorwriteenable(true, true, true, true);
        gpu_set_blendenable(true);
    }
    
    surface_reset_target();
    draw_surface(hpBarSurface, xoff + 274, 400);
}

if (drawButtons)
{
    var back;
    
    switch (borderType)
    {
        case 1:
            back = spr_button_ut;
            break;
        
        default:
            back = spr_button;
            break;
    }
    
    if (false && global.spep)
    {
    }
    else if ((mainState == (1 << 0) || mainState == (10 << 0)) && !isBoxMoving)
    {
        obj_battleheart.visible = true;
        drawButton(34, 432, back, lang_get_sprite(spr_fight_icon), lang_get_sprite(spr_fight_text), selectionX == 0);
        drawButton(188, 432, back, lang_get_sprite(spr_act_icon), lang_get_sprite(spr_act_text), selectionX == 1);
        drawButton(342, 432, back, lang_get_sprite(spr_item_icon), lang_get_sprite(spr_item_text), selectionX == 2);
        drawButton(496, 432, back, lang_get_sprite(spr_mercy_icon), lang_get_sprite(spr_mercy_text), selectionX == 3);
    }
    else if (mainState == (2 << 0) && (selectedButton == (1 << 0) || subState == 0))
    {
        drawButton(34, 432, back, lang_get_sprite(spr_fight_icon), lang_get_sprite(spr_fight_text), selectedButton == (0 << 0));
        drawButton(188, 432, back, lang_get_sprite(spr_act_icon), lang_get_sprite(spr_act_text), selectedButton == (1 << 0));
        drawButton(342, 432, back, lang_get_sprite(spr_item_icon), lang_get_sprite(spr_item_text), selectedButton == (2 << 0));
        drawButton(496, 432, back, lang_get_sprite(spr_mercy_icon), lang_get_sprite(spr_mercy_text), selectedButton == (3 << 0));
    }
    else
    {
        drawButton(34, 432, back, lang_get_sprite(spr_fight_icon), lang_get_sprite(spr_fight_text), false);
        drawButton(188, 432, back, lang_get_sprite(spr_act_icon), lang_get_sprite(spr_act_text), false);
        drawButton(342, 432, back, lang_get_sprite(spr_item_icon), lang_get_sprite(spr_item_text), false);
        drawButton(496, 432, back, lang_get_sprite(spr_mercy_icon), lang_get_sprite(spr_mercy_text), false);
    }
}
else if (mainState == (1 << 0))
{
    obj_battleheart.visible = false;
}

if (drawDarkener)
{
    draw_rectangle_pix(0, 0, 640, 480, 0, darkenAlpha);
    draw_menu_rectangle(boxX1, boxY1, boxX2, boxY2, 1, 9);
}

if (!boxTransform)
{
    with (obj_battleheart_purple)
        drawRows();
}

var _x = 52;

if (portraitMode && obj_overworldui.portraitSprite != -1)
{
    _x = 168;
    obj_overworldui.drawPortrait(238, -8);
}

if ((mainState == (1 << 0) || mainState == (10 << 0) || mainState == (5 << 0) || mainState == (3 << 0)) && writer != -4)
{
    draw_text_style(_x, 270 - ((1 - shrinkTextMultiplier) * global.lang_charheight_lg), writer.internalStr, 16777215, textFont, global.lang_charwidth_md, global.lang_charheight_lgs * shrinkTextMultiplier, 5);
}
else if (drawableText != "")
{
    if (is_struct(drawableText))
    {
        var actData = drawableText;
        var i = 0;
        var n = array_length(actData.acts);
        
        while (i < n)
        {
            var offsetX = ((i % 2) == 0) ? 48 : 304;
            var offsetY = floor(i / 2) * 32;
            var text = actData.acts[i];
            draw_text_style(_x + offsetX, 270 + offsetY, text, 16777215, textFont, global.lang_charwidth_md, global.lang_charheight_lgs, 5);
            i++;
        }
        
        if (actData.text != "")
            draw_text_style(_x, 270, actData.text, 16777215, textFont, global.lang_charwidth_md, global.lang_charheight_lgs, 5);
    }
    else
    {
        draw_text_style(_x, 270, drawableText, 16777215, textFont, global.lang_charwidth_md, global.lang_charheight_lgs, 5);
    }
}

if (mainState == (2 << 0))
{
    switch (selectedButton)
    {
        case (0 << 0):
            if (subState == 0)
            {
                var h = 32;
                var _y = 280;
                
                for (var i = 0; i < 3; i++)
                {
                    if (monsters[i] == -4 || !monsters[i].isActive)
                        continue;
                    
                    var _x1 = boxX2 - 100 - 64;
                    var _x2 = boxX2 - 64;
                    var _y2 = _y + 16;
                    var _xhealth = floor(100 * (monsters[i].hp / monsters[i].maxHp));
                    var _xbreak = _x1 + _xhealth;
                    draw_rectangle_pix(_xbreak, _y, 101 - _xhealth, 17, 255, 1);
                    
                    if (_x1 != _xbreak)
                        draw_rectangle_pix(_x1, _y, _xhealth + 1, 17, 65280, 1);
                    
                    if (global.uiborder != spr_menuparts_ut)
                    {
                        draw_sprite(spr_roundhp_enemy, 0, _x1, _y);
                        draw_sprite(spr_roundhp_enemy, 1, (_x2 + 1) - 4, _y);
                        draw_sprite(spr_roundhp_enemy, 2, (_x2 + 1) - 4, (_y2 + 1) - 4);
                        draw_sprite(spr_roundhp_enemy, 3, _x1, (_y2 + 1) - 4);
                    }
                    
                    if (monsters[i].object_index == obj_koffink_monster)
                    {
                        if (!monsters[i].drawOnGround)
                            draw_sprite(spr_kk_bathpicon, 0, _x1 - 33, _y + 3);
                    }
                    
                    _y += h;
                }
            }
            
            break;
        
        case (2 << 0):
            if (currentMaxY >= 3)
            {
                var _y = 278;
                var _yadd = 84 / currentMaxY;
                i = 0;
                
                while (i <= currentMaxY)
                {
                    var flooredY = floor(_y);
                    
                    if (itemSelectionY == i)
                        draw_rectangle_pix(568, flooredY - 4, 11, 11, 16777215, 1);
                    else
                        draw_rectangle_pix(572, flooredY, 3, 3, 16777215, 1);
                    
                    i++;
                    _y += _yadd;
                }
            }
            
            set_font(fnt_main);
            var c = 0;
            var i = itemStartIndex;
            
            while (i <= currentMaxY && c < 3)
            {
                var itemId = ds_list_find_value(global.inv_item, i);
                var data = ds_map_find_value(global.items, itemId);
                
                if (isSerious)
                    global.dxformat[0] = item_get_name_serious(itemId);
                else
                    global.dxformat[0] = item_get_name_short(itemId);
                
                var _y = 270 + (c * 32);
                draw_text_style(52, _y, format_text_interpolate(cachedItemName), 16777215, textFont, global.lang_charwidth_md, global.lang_charheight_lgs);
                
                if (!struct_exists(data, "btinfo"))
                {
                    var hp = variable_struct_get(data, "hp");
                    
                    if (hp != undefined)
                    {
                        if (itemId == 40)
                            hp = 11 * (8 - ds_map_find_value(global.flags, "i_40"));
                        
                        if (items_get_weapon() == 27)
                            hp += 2;
                        
                        global.dxformat[0] = _string(hp);
                        draw_text_right_icons_colors(540, _y, format_text_interpolate(cachedItemHeal));
                    }
                }
                else if (items_get_weapon() == 27 && struct_exists(data, "btinfo_pan"))
                {
                    draw_text_right_icons_colors(540, _y, dxd_raw(data.btinfo_pan));
                }
                else
                {
                    draw_text_right_icons_colors(540, _y, dxd_raw(data.btinfo));
                }
                
                i++;
                c++;
            }
            
            draw_set_color(c_white);
            break;
    }
}
