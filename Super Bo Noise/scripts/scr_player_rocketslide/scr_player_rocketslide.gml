function state_player_rocketslide() //state_player_rocketslide
{
    hsp = xscale * movespeed
    movespeed = approach(movespeed, 0, 0.5)
    vsp = 0
    if (movespeed <= 0)
    {
        state = (186 << 0)
        sprite_index = spr_rocket
        image_index = 0
        movespeed = 8
        xscale *= -1
    }
}

