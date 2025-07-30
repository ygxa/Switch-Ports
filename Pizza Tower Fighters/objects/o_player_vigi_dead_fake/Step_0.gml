image_angle += 1;
event_inherited();
vsp += grv;

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
timer--;

if (timer == 0)
{
    if (fart == "player2" && !instance_exists(o_player_vigilante2))
    {
        instance_create_layer(o_spawn.x, o_spawn.y, layer, o_player_vigilante2);
        
        with (o_spawn)
            spriter = 1;
    }
    
    if (fart == "player1" && !instance_exists(o_player_vigilante))
    {
        instance_create_layer(o_spawn.x, o_spawn.y, layer, o_player_vigilante);
        
        with (o_spawn)
            spriter = 1;
    }
}
