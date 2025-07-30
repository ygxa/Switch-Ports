if (other.cutscene || other.state == 12)
    exit;

with (other)
{
    vsp = -18;
    sprite_index = spr_machfreefall;
    jumpstop = 1;
    state = 94;
}

sprite_index = spr_clownmato_bounce;
image_index = 0;
