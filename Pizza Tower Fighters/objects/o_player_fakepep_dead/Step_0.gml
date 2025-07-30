image_angle += 1;
vsp += grv;
event_inherited();

if (place_meeting(x + hsp, y, ObjWall))
{
    while (!place_meeting(x + sign(hsp), y, ObjWall))
        x += sign(hsp);
}

x += hsp;

if (place_meeting(x, y + vsp, ObjWall))
{
    while (!place_meeting(x, y + sign(vsp), ObjWall))
        y += sign(vsp);
}

y += vsp;
