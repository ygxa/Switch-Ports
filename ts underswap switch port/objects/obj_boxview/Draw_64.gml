draw_menu_rectangle(8, 8, 312, 232);
draw_set_color(c_white);
draw_set_halign(fa_center);
set_font(fnt_main);
draw_text(160, 30, dxd_raw("boxmenu.inventory"));
draw_text(480, 30, dxd_raw("boxmenu.box"));
draw_line_pix(319, 92, 319, 392);
draw_line_pix(321, 92, 321, 392);
draw_set_color(c_ltgray);

if (global.control_gamepad && global.gamepad_buttons_type != -1)
{
    draw_text_icons_centered(320, 406, dxd_raw("boxmenu.exit_gamepad"), true);
}
else if (global.keyboard_keys[1] == 88)
{
    draw_text(320, 406, dxd_raw("boxmenu.exit_default"));
}
else
{
    global.dxformat[0] = keycode_to_string(global.keyboard_keys[1]);
    draw_text(320, 406, dxd_int("boxmenu.exit"));
}

draw_set_halign(fa_left);
draw_set_color((inventory == 0) ? c_yellow : c_white);
draw_text(80, 72, dxd_raw("boxmenu.item"));
draw_set_color((inventory == 1) ? c_yellow : c_white);
draw_text(200, 72, dxd_raw("boxmenu.tool"));
draw_set_color(c_white);
var inv = (inventory == 0) ? global.inv_item : global.inv_tool;
var size = ds_list_size(inv);
var i;

for (i = 0; i < size; i++)
{
    var n = item_get_name(ds_list_find_value(inv, i));
    draw_text(70, 110 + (i * 32), n);
    
    if (inventory == 1)
    {
        if (global.equippedwep == i || global.equippedarm == i)
            draw_sprite_ext(lang_get_sprite(spr_equipped), 0, 80 + string_width(n), 118 + (i * 32), 2, 2, 0, c_white, 1);
    }
}

draw_set_color(c_dkgray);

while (i < 8)
{
    draw_text(70, 110 + (i * 32), dxd_raw("boxmenu.dashed"));
    i++;
}

draw_set_color(c_white);
var boxInv = ds_map_find_value(global.flags, flag);
size = array_length(boxInv);

for (i = 0; i < size; i++)
    draw_text(372, 78 + (i * 32), item_get_name(boxInv[i]));

draw_set_color(c_dkgray);

while (i < 10)
{
    draw_text(372, 78 + (i * 32), dxd_raw("boxmenu.dashed"));
    i++;
}

switch (section)
{
    case 0:
        if (inventory == 0)
            draw_sprite_ext(spr_owheart, 0, 48, 80, 2, 2, 0, c_white, 1);
        else
            draw_sprite_ext(spr_owheart, 0, 168, 80, 2, 2, 0, c_white, 1);
        
        break;
    
    case 1:
        draw_sprite_ext(spr_owheart, 0, 38, 118 + (32 * sel), 2, 2, 0, c_white, 1);
        break;
    
    case 2:
        draw_sprite_ext(spr_owheart, 0, 344, 86 + (32 * sel), 2, 2, 0, c_white, 1);
        break;
}
