function state_player_barrelslide() //state_player_barrelslide
{
    image_speed = abs(movespeed) / 8
    if (image_speed < 0.35)
        image_speed = 0.35
    if (image_speed > 0.85)
        image_speed = 0.85
    hsp = movespeed
    if (abs(movespeed) < 14)
        movespeed = approach(movespeed, (xscale * 14), 0.1)
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_player_barrelslipnslide)
            sprite_index = spr_player_barrelroll
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!jumpstop) && (!input_check("jump")) && vsp < 0)
    {
        jumpstop = 1
        vsp /= 20
    }
    if (input_buffer_jump < 8 && can_jump)
    {
        scr_soundeffect(bojump)
        input_buffer_jump = 8
        vsp = -8.5
        jumpstop = 0
        create_particle(x, y, (3 << 0), 0)
    }
    if ((!input_check("attack")) && (!(place_meeting(x, (y + 1), obj_current))) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        mask_index = spr_player_mask
        if (!(place_meeting(x, y, obj_solid)))
        {
            if grounded
                state = (115 << 0)
            else
            {
                state = (116 << 0)
                sprite_index = spr_player_barrelfall
            }
        }
    }
    with (instance_place((x + hsp), y, obj_destructibles))
        instance_destroy()
    with (instance_place((x + hsp), y, obj_baddie))
    {
        if destroyable
            instance_destroy()
    }
    if place_meeting((x + sign(hsp)), y, obj_solid)
    {
        if scr_slope()
        {
            vsp = -12
            state = (117 << 0)
            movespeed = 0
        }
        else
        {
            xscale *= -1
            movespeed = xscale * 8
            instance_create((x + xscale * 10), (y + 10), obj_bumpeffect)
            if place_meeting(x, (y + 1), obj_current)
            {
                input_buffer_jump = 8
                vsp = -8.5
                jumpstop = 1
                create_particle(x, y, (3 << 0), 0)
            }
        }
    }
    return;
}

