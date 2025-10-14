function state_player_ratmountladder() //state_player_ratmountladder
{
    movespeed = 0
    hsp = 0
    if input_check("up")
    {
        sprite_index = spr_lonegustavo_ladder
        vsp = -6
        image_speed = 0.35
    }
    else if input_check("down")
    {
        sprite_index = spr_lonegustavo_ladderdown
        vsp = 10
        image_speed = -0.35
    }
    else
    {
        sprite_index = spr_lonegustavo_ladder
        vsp = 0
        image_speed = 0
    }
    ladderbuffer = 20
    if ((!(place_meeting(x, y, obj_ladder))) && (!(place_meeting(x, y, obj_stairs))))
    {
        state = (194 << 0)
        sprite_index = spr_player_ratmountgroundpoundfall
        image_index = 0
        vsp = 0
    }
    if input_check_pressed("jump")
    {
        ladderbuffer = 20
        state = (194 << 0)
        sprite_index = spr_player_ratmountgroundpound
        if input_check("down")
            vsp = 5
        else
            vsp = -9
        image_index = 0
    }
    if (input_check("down") && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        sprite_index = spr_player_ratmountgroundpoundfall
        state = (194 << 0)
        image_index = 0
    }
    return;
}

