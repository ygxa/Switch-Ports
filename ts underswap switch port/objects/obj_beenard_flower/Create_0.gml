event_inherited();
image_xscale = 2;
image_yscale = 2;
targetScale = 2;
y = (obj_battlemanager.boxY2 - 4) + irandom_range(-2, 2);

repeat (50)
{
    x = irandom_range(obj_battlemanager.boxX1 + 20, obj_battlemanager.boxX2 - 20);
    
    if (!place_meeting(x, y, obj_beenard_flower))
        break;
}

xstart = x;
ystart = y;
image_speed = 0;
image_alpha = 0;
targetX = undefined;
targetY = undefined;
state = 0;
