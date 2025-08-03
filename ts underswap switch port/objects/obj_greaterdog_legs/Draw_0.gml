event_inherited();

with (obj_greaterdog_monster)
{
    draw_sprite_ext(spr_greaterdog_base_arms, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    draw_sprite_ext(spr_greaterdog_base_arms, 1, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
}

with (obj_battleheart)
    draw_sprite_ext(spr_redsoul_outline_inner, image_index, x, y, 1, 1, 0, c_white, 1);
