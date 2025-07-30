x += hsp;

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
