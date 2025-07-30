var _arr = ds_list_find_value(messages, messageID);
var _text = _arr[(0 << 0)];
var _name = _arr[(1 << 0)];
var _image = _arr[(2 << 0)];
draw_set_font(F_Tutorial);

if (messagechar > string_length(_text))
    draw_sprite(s_grannytext, frame, x + 650, (y - 300) + height);
else
    draw_sprite(s_grannytext_talk, frame, x + 650, (y - 300) + height);

draw_sprite(s_textbox, 0, x + 20, y + height);
var _drawX = x + 60 + padding;
var _drawY = y + padding;
draw_set_color(c_black);
var _maxW = width - 20 - (_drawX + padding);
draw_text_scribble_ext(_drawX, _drawY, messagetext, -1, _maxW);
draw_set_color(c_white);
