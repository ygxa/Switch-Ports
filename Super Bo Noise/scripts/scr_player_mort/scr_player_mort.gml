function state_player_mort() //state_player_mort
{
    move = input_check("right") - input_check("left")
    hsp = movespeed
    mort = 0
    doublejump = 0
    jumpstop = 0
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (move != 0)
    {
        if (move == xscale)
            movespeed = approach(movespeed, (xscale * 8), 0.8)
        else
            movespeed = approach(movespeed, 0, 0.8)
        if (movespeed <= 0)
            xscale = move
    }
    else
        movespeed = approach(movespeed, 0, 0.8)
    if (movespeed < 3 && move != 0)
        image_speed = 0.35
    else if (movespeed > 3 && movespeed < 6)
        image_speed = 0.45
    else
        image_speed = 0.6
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        movespeed = 0
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_null
    }
    if (!landAnim)
    {
        if (move != 0)
            sprite_index = spr_player_mortwalk
        else
        {
            sprite_index = spr_player_mortidle
            image_speed = 0.35
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        landAnim = 0
        if (move != 0)
            sprite_index = spr_player_mortwalk
        else
            sprite_index = spr_player_mortidle
    }
    if (!can_jump)
    {
        state = (14 << 0)
        sprite_index = spr_player_mortjump
    }
    else if (input_buffer_jump < 8)
    {
        input_buffer_jump = 0
        state = (14 << 0)
        doublejump = 0
        vsp = -11
        sprite_index = spr_player_mortjumpstart
        image_index = 0
        scr_soundeffect(bojump)
        create_particle(x, y, (5 << 0), 0)
    }
    mort_attack()
    return;
}

function mort_attack() //mort_attack
{
    if input_check_pressed("slap")
    {
        state = (15 << 0)
        sprite_index = spr_player_mortattackfront
        image_index = 0
        if (move != 0)
            xscale = move
        var _angle = 0
        if input_check("up")
        {
            _angle = 90
            sprite_index = spr_player_mortattackup
        }
        else if (input_check("down") && (!grounded))
        {
            if (!grounded)
                vsp = 3
            _angle = 270
            sprite_index = spr_player_mortattackdown
        }
        else
            movespeed = xscale * 12
        with (instance_create(x, y, obj_morthitbox))
        {
            playerid = other.id
            if (_angle == 0)
                image_xscale = other.xscale
            image_angle = _angle
            alarm[0] = 15
        }
    }
    if (sprite_index == spr_player_mortattackdown || sprite_index == spr_player_mortattackup || sprite_index == spr_player_mortattack)
    {
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            create_spink_afterimage(x, y, sprite_index, image_index, xscale)
        }
    }
    return;
}

function Mort_DownMovement() //Mort_DownMovement
{
    if (image_angle == 270)
    {
        with (playerid)
        {
            doublejump = 0
            vsp = -14
        }
    }
    return;
}

