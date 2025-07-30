if (place_meeting(x + hsp, y, ObjWall))
{
    yplus = 0;
    
    while (place_meeting(x + hsp, y - yplus, ObjWall) && yplus <= abs(1 * hsp))
        yplus += 1;
    
    if (place_meeting(x + hsp, y - yplus, ObjWall))
    {
        while (!place_meeting(x + sign(hsp), y, ObjWall))
            x += sign(hsp);
        
        hsp = -hsp;
    }
    else
    {
        y -= yplus;
    }
}

x += hsp;
var _movingPlatform = instance_place(x, y + max(1, vsp), o_way_platform);

if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top)
{
    if (vsp > 0)
    {
        while (!place_meeting(x, y + sign(vsp), o_way_platform))
            y += sign(vsp);
        
        vsp = -vsp;
    }
}

if (!place_meeting(x, y, ObjWall) && vsp >= 0 && place_meeting(x, y + 2 + abs(hsp), ObjWall))
{
    while (!place_meeting(x, y + 1, ObjWall))
        y += 1;
}

if (place_meeting(x, y + vsp, ObjWall))
{
    while (!place_meeting(x, y + sign(vsp), ObjWall))
        y += sign(vsp);
    
    vsp = -vsp;
}

y += vsp;

if (place_meeting(x, y, o_player_vigilante))
{
    if (o_player_vigilante.state == (9 << 0) && player != 1)
    {
        hsp = -hsp;
        vsp = -vsp;
        player = 1;
    }
}

if (place_meeting(x, y, o_player_vigilante2))
{
    if (o_player_vigilante2.state == (9 << 0) && player != 2)
    {
        hsp = -hsp;
        vsp = -vsp;
        player = 2;
    }
}

if (hsp != 0)
    image_xscale = sign(hsp);

life--;

if (life == 0)
{
    instance_destroy();
    
    with (instance_create_layer(x, y, "part", o_fireflameffect))
        sprite_index = s_poofeffect;
}
