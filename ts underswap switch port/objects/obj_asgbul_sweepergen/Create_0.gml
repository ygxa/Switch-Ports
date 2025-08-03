event_inherited();
wavesGenerated = 0;
bullets = ds_list_create();
orbiting = false;
warning = true;
siner = 0;
orbitMult = 1;
orbitSpeed = 0.25;
orbitAccel = 0.018;

if (obj_asgore_monster.isRuth)
    orbitAccel = 0.024;

alarm[0] = 45;
