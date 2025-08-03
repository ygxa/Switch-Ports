var evenEasier = instance_exists(obj_migospb_roach) || instance_exists(obj_migospb_throw);
var easier = evenEasier || instance_exists(obj_looxb2);
depth = -20;
image_speed = 0.2;
image_xscale = easier ? 0.15 : 0.25;
image_yscale = image_xscale;
specialHoming = choose(false, obj_battleheart.y <= (obj_battlemanager.boxY1 + 15) && obj_loox_monster.attackType != 5);
internalDirection = random_range(170, 190);

if (evenEasier)
    speed = 3;
else
    speed = easier ? 4 : 5;

erratic = false;
