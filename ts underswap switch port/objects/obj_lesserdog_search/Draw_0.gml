if (stage != 0 && stage < 5)
{
    draw_sprite_ext(spr_lesserdog_neck, 0, x + lendir_x, y + lendir_y, 2, length * 2, dir - 90, c_white, 1);
    draw_sprite_ext(spr_lesserdog_extendhead, face, x + lendir_x, y + lendir_y, 2, 2, dir - 90, c_white, 1);
    
    if (global.debug)
    {
        if (keyboard_check(vk_f3) && keyboard_check(ord("B")))
        {
            draw_set_color(c_red);
            draw_triangle(corner1x, corner1y, corner1x + lendir2_x, corner1y + lendir2_y, corner2x + lendir2_x, corner2y + lendir2_y, true);
            draw_set_color(c_blue);
            draw_triangle(corner2x, corner2y, corner2x + lendir_x, corner2y + lendir_y, corner1x, corner1y, true);
        }
    }
}
