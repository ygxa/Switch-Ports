direction = 145 - random(20);
gravity_direction = 280;
gravity = 0.4;
speed = 7 + random(3);
image_index = 1;

if (global.battle_id == 26)
    damageAmount = 5.25;
else
    damageAmount *= 1.8;
