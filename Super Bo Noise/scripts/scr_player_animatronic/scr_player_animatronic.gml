function state_player_animatronic() //state_player_animatronic
{
    sprite_index = spr_pepanimatronic
    move = input_check("right") - input_check("left")
    hsp = move * movespeed
    if (vsp < 0 && (!input_check("jump")) && (!jumpstop))
    {
        jumpstop = 1
        vsp /= 10
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (move != 0)
    {
        xscale = move
        movespeed = 4
    }
    else
        movespeed = 0
    if (animatronic_buffer > 0)
        animatronic_buffer--
    else
    {
        repeat (3)
            create_debris(x, y, spr_metalblockdebris)
        state = (2 << 0)
    }
    if (animatronic_collect_buffer > 0)
        animatronic_collect_buffer--
    else
    {
        animatronic_collect_buffer = 30
        if (global.collect > 0)
        {
            global.collect -= 5
            repeat (10)
                create_debris(x, y, choose(spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_pineapplecollect, spr_sausagecollect), 1)
        }
    }
    if (can_jump && vsp > 0 && input_buffer_jump < 8)
    {
        input_buffer_jump = 8
        vsp = -11
        jumpstop = 0
    }
}

