var blend = (isHeal == true) ? 65280 : 255;

for (var i = 0; i < damageLength; i++)
    draw_sprite_ext(spr_battledmgnum, damageIndices[damageLength - i - 1], ((x + 54) - damageLeftSub) + (i * 32), y - 1, 1, 1, 0, blend, 1);

draw_rectangle_pix(xstart + 4, ystart + 4, 100, 14, 158, 1);
draw_rectangle_pix(xstart + 4, ystart + 4, floor(100 * (monsterHpApparent / monsterHpMax)), 14, 58511, 1);
draw_sprite_ext(spr_cb_fakedamage, 0, xstart, ystart, 2, 2, 0, c_white, 1);
