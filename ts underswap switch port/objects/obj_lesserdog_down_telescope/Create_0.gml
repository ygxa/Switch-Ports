event_inherited();
image_xscale = 2;
image_yscale = 2;

if (irandom(1) == 0)
{
    x = obj_battlemanager.boxX2 + sprite_width;
    targetX = obj_battlemanager.boxX2 + 40;
}
else
{
    x = obj_battlemanager.boxX1;
    targetX = (obj_battlemanager.boxX1 + sprite_width) - 40;
    image_index = 1;
}

y = obj_battlemanager.boxY1 + 6;
go = false;
bulletType = (0 << 0);
alarm[0] = 20;
which = 20;
