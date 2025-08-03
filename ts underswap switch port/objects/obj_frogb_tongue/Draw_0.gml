if (instance_exists(parent.tongueTargetObj))
{
    var inst = parent.tongueTargetObj;
    draw_set_alpha(0.75);
    draw_line_width_color_pix(x + 2, y + 2, inst.x + 2, inst.y + 2, 4, 255, 65535);
    draw_set_alpha(1);
}

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
draw_rectangle_pix(x - 10, y - 5, 20, 6, 0, 1);
