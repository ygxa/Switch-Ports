event_inherited();
rotSpeed = 5;
accel = 0.01;
initialAccel = false;
mask_index = spr_cb_crossbonebul_accuratemask;
speed = 4;

switch (irandom(3))
{
    case 0:
        x = obj_battlemanager.boxX1 + 19;
        y = random_range(obj_battlemanager.boxY1 + 19, obj_battlemanager.boxY2 - 19);
        direction = choose(45, -45);
        break;
    
    case 1:
        x = obj_battlemanager.boxX2 - 19;
        y = random_range(obj_battlemanager.boxY1 + 19, obj_battlemanager.boxY2 - 19);
        direction = choose(225, 135);
        break;
    
    case 2:
        x = random_range(obj_battlemanager.boxX1 + 19, obj_battlemanager.boxX2 - 19);
        y = obj_battlemanager.boxY1 + 19;
        direction = choose(135, 45);
        break;
    
    case 3:
        x = random_range(obj_battlemanager.boxX1 + 19, obj_battlemanager.boxX2 - 19);
        y = obj_battlemanager.boxY2 - 19;
        direction = choose(45, 135);
        break;
}
