state = 0;
alpha = 0;
timer = 0;
go = false;
texts = [dxd_raw("info.ltext0"), dxd_raw("info.ltext1"), dxd_raw("info.ltext2"), dxd_raw("info.ltext3"), dxd_raw("info.ltitle")];
text0 = string_split(texts[0], "\n");
var lineCount = array_length(text0);
set_font(fnt_main);
var charWidth = global.lang_charwidth_md;

for (var i = 0; i < lineCount; i++)
{
    var l = text0[i];
    l = string_replace_all(l, "`cY`", "");
    l = string_replace_all(l, "`c$`", "");
    var pos = string_length(l);
    var lastChar = string_char_at(l, pos);
    
    while (pos > 1 && lastChar == " ")
    {
        pos--;
        lastChar = string_char_at(l, pos);
    }
    
    var extraRightSpace = (charWidth - string_width(lastChar)) + 2;
    textX[i] = (320 - (pos * charWidth * 0.5)) + floor(extraRightSpace * 0.5) + 1;
}
