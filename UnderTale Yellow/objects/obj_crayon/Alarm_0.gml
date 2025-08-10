if (live_call())
    return global.live_result;

image_alpha = 1;
sprite_index = asset_get_index("spr_crayon_" + __string(crayon_color));
