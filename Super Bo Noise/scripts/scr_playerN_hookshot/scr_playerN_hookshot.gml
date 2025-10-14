function scr_playerN_hookshot() //scr_playerN_hookshot
{
    move = input_check("right") - input_check("left")
    hsp = movespeed * move
    if (move != 0)
        xscale = move
    if input_check_pressed("jump")
    {
        vsp = -6
        instance_create(x, y, obj_washingmachine)
        sprite_index = spr_jump
        stompAnim = 0
        state = (94 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
    }
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if grounded
    {
        with (obj_camera)
        {
            shake_mag = 5
            shake_mag_acc = 10 / room_speed
        }
        vsp = -5
        with (instance_create(x, (y + 35), obj_bangeffect))
            image_xscale = obj_player1.image_xscale
        instance_create(x, y, obj_landcloud)
        with (obj_baddie)
        {
            if (grounded && point_in_camera(x, y, view_camera[0]))
            {
                image_index = 0
                state = (128 << 0)
                vsp = -7
                hsp = 0
            }
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_null)
        sprite_index = spr_null
    if (move != 0)
    {
        if (movespeed < 8)
            movespeed += 0.25
        else if (movespeed == 8)
            movespeed = 8
    }
    else
        movespeed = 0
    image_speed = 0.35
    return;
}

