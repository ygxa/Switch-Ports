vsp += grv;

if (place_meeting(x + hsp, y, ObjWall))
{
    while (!place_meeting(x + sign(hsp), y, ObjWall))
        x += sign(hsp);
    
    hsp = 0;
}

x += hsp;

if (place_meeting(x, y + vsp, ObjWall))
{
    while (!place_meeting(x, y + sign(vsp), ObjWall))
        y += sign(vsp);
    
    vsp = 0;
}

y += vsp;

if (hsp != 0)
    image_xscale = sign(hsp);

timer--;

if (timer == 0)
{
    instance_destroy();
    instance_create_layer(x, y, layer, o_player_vigi_explosion);
}
