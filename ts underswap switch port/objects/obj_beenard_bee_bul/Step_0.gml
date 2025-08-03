siner++;

if (moveDir == 1)
    sprite_index = spr_beenard_bee_bul_right;

y = ystart + (amplitude * sin(period * siner));
x += (moveDir * moveSpeed);
