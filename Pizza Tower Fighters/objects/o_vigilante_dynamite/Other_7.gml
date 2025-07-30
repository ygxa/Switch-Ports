if (player == 1)
{
    if (place_meeting(x, y, o_player_vigilante) && !place_meeting(x, y, ObjWall))
        o_player_vigilante.vsp = -16;
}

if (player == 2)
{
    if (place_meeting(x, y, o_player_vigilante2) && !place_meeting(x, y, ObjWall))
        o_player_vigilante2.vsp = -16;
}

with (instance_create_layer(x, y, layer, o_player_vigi_explosion))
    playa = other.player;

instance_destroy();
