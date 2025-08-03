if (waiting)
    exit;

var horzMove = horzDir * spd;
var vertMove = vertDir * spd;

if (horzDir == -1)
{
    if (((x + horzMove) - sprite_xoffset) <= obj_battlemanager.boxX1)
        horzDir = 1;
}
else if ((x + horzMove + sprite_xoffset) >= obj_battlemanager.boxX2)
{
    horzDir = -1;
}

if (vertDir == -1)
{
    if (((y + vertMove) - sprite_yoffset) <= obj_battlemanager.boxY1)
        vertDir = 1;
}
else if ((y + vertMove + sprite_yoffset) >= obj_battlemanager.boxY2)
{
    vertDir = -1;
}

x += (horzDir * spd);
y += (vertDir * spd);
