if (active)
{
    var px = x;
    var py = y;
    x += (sin(siner) * 20);
    y += (sin(siner * 0.5) * 12);
    var flip = obj_player.x >= x;
    
    if (flip)
        x += sprite_width;
    
    draw_sprite_ext(spr_md_angry_outline, image_index, x, y, flip ? -1 : 1, 1, 0, c_white, obj_dodgemode_handler.alpha);
    draw_sprite_ext(sprite_index, image_index, x, y, flip ? -1 : 1, 1, 0, c_white, 1);
    x = px;
    y = py;
}
else
{
    var trans = 2.5 * sin(siner);
    var shift = room == rm_ruins3 && (sprite_index == spr_md_angry2 || sprite_index == spr_md_angryb);
    draw_sprite_stretched(spr_shadow, 0, x - (trans * 0.5) - 3, y + 25, 19 + trans, 15);
    
    if (shift)
        x -= 3;
    
    draw_sprite_ext(sprite_index, image_index, x + sprite_width, y + trans, -1, 1, 0, c_white, 1);
    
    if (shift)
        x += 3;
}
