if (sprite_index == spr_brick1readytofall || sprite_index == spr_brick2readytofall)
    draw_sprite(spr_brickhand, 1, x, y - 74);

draw_self();

if (sprite_index == spr_brick1readytofall || sprite_index == spr_brick2readytofall)
    draw_sprite(spr_brickhand, 0, x, y - 74);
