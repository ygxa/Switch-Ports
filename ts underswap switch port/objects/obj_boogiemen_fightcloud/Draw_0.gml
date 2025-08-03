draw_sprite_ext(spr_harry_tail_cloud, 0, x + 85, y - 67, image_xscale, image_yscale, (image_angle + 330) - (10 * shakeIntensity * sin(counter)), harryBlend, image_alpha);
draw_sprite_ext(spr_harry_arm_cloud, 0, x - 58, y - 57, image_xscale, image_yscale, (image_angle + 90) - (15 * shakeIntensity * sin(counter)), harryBlend, image_alpha);
draw_sprite_ext(spr_larry_arm_cloud, 0, x - 60, y + 50, image_xscale, image_yscale, image_angle + 90 + (15 * shakeIntensity * sin(counter)), larryBlend, image_alpha);
draw_sprite_ext(spr_larry_leg_cloud, 0, x + 40, y + 65, image_xscale, image_yscale, image_angle + 150 + (10 * shakeIntensity * sin(counter)), larryBlend, image_alpha);
draw_self();
draw_sprite_ext(spr_harry_head_cloud, 0, x + 55, y, image_xscale, image_yscale, (image_angle - 90) + (20 * shakeIntensity * sin(counter)), harryBlend, image_alpha);
draw_sprite_ext(spr_larry_head_cloud, 0, x - 55, y, image_xscale, image_yscale, image_angle + 90 + (10 * shakeIntensity * sin(counter)), larryBlend, image_alpha);
