event_inherited();
state = 0;
warningTimer = 0;
kind = irandom(2);
event_user(10);
updateCbSprite = true;
image_xscale = 2;
image_yscale = 2;
var xTL = x - sprite_xoffset;
var yTL = y - sprite_yoffset;
var minX = 8 + ((obj_battlemanager.boxX1 + sprite_xoffset) - (bbox_left - xTL));
var maxX = (obj_battlemanager.boxX2 - 8 - (sprite_width - sprite_xoffset)) + (sprite_width - (bbox_right - xTL));
var minY = 8 + ((obj_battlemanager.boxY1 + sprite_yoffset) - (bbox_top - yTL));
var maxY = (obj_battlemanager.boxY2 - 8 - (sprite_height - sprite_yoffset)) + (sprite_height - (bbox_bottom - yTL));

if (irandom(1) == 0)
    x = clamp(obj_battleheart.x + irandom_range(-10, 10), minX, maxX);
else
    x = clamp(obj_battleheart.x + irandom_range(-60, 60), minX, maxX);

y = clamp(obj_battleheart.y + irandom_range(-10, 10), minY, maxY);
