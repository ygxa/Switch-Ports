draw_set_alpha(fadealpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_rectangle_color(0, 0, 10000, 10000, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
var sh1 = irandom_range(shake, -shake);
var sh2 = irandom_range(-shake, shake);
var sh21 = irandom_range(shake2, -shake2);
var sh22 = irandom_range(-shake2, shake2);
var sh31 = irandom_range(shake3, -shake3);
var sh32 = irandom_range(-shake3, shake3);
draw_set_color(c_white);
draw_sprite(S_FadeDoorSide1, 0, door1x + sh1, 0 + sh2);
draw_sprite(S_FadeDoorSide2, 0, door2x + sh1, 0 + sh2);
draw_sprite_ext(S_FadeDoorPizzaface, 0, door1x + sprite_get_xoffset(S_FadeDoorPizzaface) + sh1, sprite_get_yoffset(S_FadeDoorPizzaface) + sh2, 1, 1, -pizzafaceangle, c_white, 1);

if (!showplayers)
    return 0;

pal_swap_set(p1pal, global.palp1, false);
draw_sprite_ext(p1spr, 0, p1x + sh21 + sprite_get_xoffset(p1spr), 0 + sh22, -1, 1, 0, c_white, 1);
draw_sprite(p1title, 0, (p1x + sh21) - 600, 0 + sh22);
pal_swap_reset();
pal_swap_set(p2pal, global.palp2, false);
draw_sprite_ext(p2spr, 0, p2x + sh31 + sprite_get_xoffset(p2spr), 0 + sh32, 1, 1, 0, c_white, 1);
draw_sprite(p2title, 0, p2x + sh31, 0 + sh32);
pal_swap_reset();
