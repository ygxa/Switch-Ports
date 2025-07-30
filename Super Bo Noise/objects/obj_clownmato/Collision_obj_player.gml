with (other)
{
    if ((!instakillmove || state == 106) && state != 108 && other.state == 136 && state != 63)
    {
        vsp = -4;
        hsp = -3 * xscale;
        state = 108;
        sprite_index = spr_bump;
        image_index = 0;
        other.state = 108;
        other.sprite_index = spr_clownmato_bounce;
        other.image_index = 0;
    }
}
