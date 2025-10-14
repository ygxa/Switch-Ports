function state_player_knightpepbump() //state_player_knightpepbump
{
    alarm[5] = 2
    alarm[7] = 60
    hsp = (-xscale) * movespeed
    if (grounded && vsp > 0)
    {
        state = (49 << 0)
        sprite_index = spr_knightpepland
        image_index = 0
        scr_soundeffect(sfx_groundpound)
        create_particle(x, y, (12 << 0), 0)
        if hurted
            hurted = 0
    }
    if (floor(image_index) == (image_number - 1))
        image_index = image_number - 1
    return;
}

