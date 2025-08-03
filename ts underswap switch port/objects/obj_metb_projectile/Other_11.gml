if (sprite_index == spr_metb_tomato)
    instance_create_xy(x + (sprite_width * 0.5), y + (sprite_height * 0.5), obj_metb_splat).depth = depth + 1;

event_inherited();
