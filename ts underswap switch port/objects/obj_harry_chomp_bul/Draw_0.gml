var boxTop = obj_battlemanager.boxY1 - 16;
var chompWidth = max(39, mouthSpace + 24);
draw_sprite_ext(spr_harry_chomp_tail, 0, (image_alpha == 1) ? (obj_harry_chomp_atk.x + 44) : boxCenter, 249, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_part_ext(spr_harry_chomp_middle, 0, 0, 0, chompWidth, 38, boxCenter - 58, boxTop - 54, image_xscale, image_yscale, image_blend, image_alpha);
draw_sprite_ext(spr_harry_chomp_middle_back, floor(middleFrame), (boxCenter - 58) + irandom(1), boxTop - 54, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_harry_chomp_top, 0, boxCenter - mouthSpace, boxTop, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_harry_chomp_bottom, 0, boxCenter + mouthSpace, boxTop, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
