draw_set_alpha(fade);
set_font(fnt_main);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(320, 30, title);
draw_set_font(fnt_main);
var decrease = selected;
var i;

for (i = 0; (startY + (decrease * 32)) >= 264; i++)
    decrease--;

var _y = startY;
var first = true;
var arrowOffset = (arrowTimer >= 10) ? 2 : 0;

while (i < languageCount)
{
    if (selected == i)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    if (first && decrease != selected)
    {
        draw_sprite_ext(spr_arrow, 0, 309, (_y - 8) + arrowOffset, 2, 2, 0, c_white, fade);
    }
    else if (_y >= 264)
    {
        draw_sprite_ext(spr_arrow, 1, 309, (_y - 8) + (2 - arrowOffset), 2, 2, 0, c_white, fade);
        break;
    }
    else
    {
        draw_text(320, _y, languages[i]);
    }
    
    _y += 32;
    first = false;
    i++;
}

if (selected >= 0 && selected < array_length(global.lang_data))
{
    var text;
    
    if (selected == 0)
        text = getLocString("default");
    else if (variable_struct_get(global.lang_data[selected].misc, "verified") == true)
        text = getLocString("verified_community");
    else
        text = getLocString("unverified");
    
    if (string_pos("`$0`", text) > 0)
    {
        var creditsFormat = getLocString("credits_format");
        var creditsText = variable_struct_get(array_get(global.lang_data, selected), "language_select");
        
        if (is_undefined(creditsText))
        {
            creditsFormat = "";
        }
        else
        {
            if (global.lang_bound != selected)
                creditsText = variable_struct_get(creditsText, "credits_different_language");
            else
                creditsText = variable_struct_get(creditsText, "credits_same_language");
            
            if (is_undefined(creditsText))
                creditsText = "";
        }
        
        creditsFormat = string_replace_all(creditsFormat, "`$0`", creditsText);
        text = string_replace_all(text, "`$0`", creditsFormat);
    }
    
    draw_set_color(c_gray);
    
    if (foundLanguageSelectStrings)
        set_font(fnt_mainsm);
    else
        draw_set_font(fnt_mainsm);
    
    draw_set_valign(fa_bottom);
    draw_text(320, 460, string_trim(text));
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(1);
