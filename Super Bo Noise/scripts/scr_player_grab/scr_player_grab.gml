function state_player_grab() //state_player_grab
{
    grav = 0.5
    move = input_check("right") - input_check("left")
    if grounded
    {
        if (dir != xscale)
        {
            dir = xscale
            movespeed = 2 * getRPGMulti("movespeed")
            facehurt = 0
        }
        jumpstop = 0
        anger = 100
        if (!(place_meeting(x, (y + 1), obj_railparent)))
        {
            if (sprite_index != spr_swingding)
                hsp = move * movespeed
            else
                hsp = xscale * movespeed
        }
        else
        {
            var _railinst = instance_place(x, (y + 1), obj_railparent)
            hsp = move * movespeed + _railinst.movespeed * _railinst.dir
        }
        if (heavy == 0)
        {
            if (sprite_index != spr_swingding)
            {
                if (move != 0)
                {
                    if (movespeed < (6 * getRPGMulti("movespeed")))
                        movespeed += (0.5 * getRPGMulti("movespeed"))
                    else if (floor(movespeed) == (6 * getRPGMulti("movespeed")))
                        movespeed = 6 * getRPGMulti("movespeed")
                }
                else
                    movespeed = 0
                if (movespeed > (6 * getRPGMulti("movespeed")))
                    movespeed -= (0.1 * getRPGMulti("movespeed"))
            }
        }
        else
        {
            if (move != 0)
            {
                if (movespeed < (4 * getRPGMulti("movespeed")))
                    movespeed += (0.25 * getRPGMulti("movespeed"))
                else if (floor(movespeed * getRPGMulti("movespeed")) == (4 * getRPGMulti("movespeed")))
                    movespeed = 4 * getRPGMulti("movespeed")
            }
            else
                movespeed = 0
            if (movespeed > (4 * getRPGMulti("movespeed")))
                movespeed -= (0.1 * getRPGMulti("movespeed"))
        }
        if (move != 0 && sprite_index != spr_swingding)
            xscale = move
        if (move != 0)
        {
            if (sprite_index != spr_swingding)
            {
                if (movespeed < 3 && move != 0)
                    image_speed = 0.35
                else if (movespeed > 3 && movespeed < 6)
                    image_speed = 0.45
                else
                    image_speed = 0.6
            }
            else
                image_speed = 0.35
        }
    }
    if (sprite_index != spr_swingding)
    {
        if (!grounded)
        {
            if (dir != xscale && sprite_index != spr_swingding)
            {
                dir = xscale
                movespeed = 2 * getRPGMulti("movespeed")
                facehurt = 0
            }
            if (move != 0 && move != xscale && sprite_index != spr_swingding)
                movespeed = 2 * getRPGMulti("movespeed")
            if (momemtum == 0)
                hsp = move * movespeed
            else
                hsp = xscale * movespeed
            if (move != 0 && move != xscale && momemtum == 1 && movespeed != 0)
                movespeed -= (0.05 * getRPGMulti("movespeed"))
            if (movespeed == 0)
                momemtum = 0
            if (move != 0 && movespeed < (6 * getRPGMulti("movespeed")))
                movespeed += (0.5 * getRPGMulti("movespeed"))
            if (movespeed > (6 * getRPGMulti("movespeed")))
                movespeed -= (0.5 * getRPGMulti("movespeed"))
            if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
                movespeed = 0
        }
        if (dir != xscale)
        {
            dir = xscale
            movespeed = 2 * getRPGMulti("movespeed")
            facehurt = 0
        }
        if (move == (-xscale))
        {
            mach2 = 0
            momemtum = 0
        }
        landAnim = 1
        if ((!input_check("jump")) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
        {
            vsp /= 20
            jumpstop = 1
        }
        if (ladderbuffer > 0)
            ladderbuffer--
        if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
        {
            vsp = grav
            jumpstop = 1
        }
        if (move != 0 && sprite_index != spr_swingding)
            xscale = move
    }
    else
    {
        if grounded
            movespeed = approach(movespeed, 0, 0.25)
        if (movespeed <= 0)
            sprite_index = spr_haulingidle
        swingdingendcooldown++
        if (floor(image_index) == 0 && spinsndbuffer == 0)
        {
            scr_soundeffect(SEWER_CUTOUT_NINJA_SLAP)
            spinsndbuffer = 5
        }
        else if (spinsndbuffer > 0)
            spinsndbuffer--
        if (floor(image_index) == 0)
            spinsndbuffer = 5
        hsp = xscale * movespeed
        if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
        {
            if (move != 0)
                move = xscale
            hsp = xscale * movespeed
            movespeed = hsp
            swingdingendcooldown = 0
            state = (8 << 0)
            sprite_index = spr_swingdingend
            image_index = 0
        }
        with (instance_place((x + xscale), y, obj_destructibles))
            instance_destroy()
    }
    if (movespeed == 2 && sprite_index == spr_swingding)
        sprite_index = spr_haulingidle
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (can_jump && input_buffer_jump < 8 && (!input_check("down")) && (!input_check("attack")) && vsp > 0 && sprite_index != spr_swingding)
    {
        scr_soundeffect(bojump)
        sprite_index = spr_haulingjump
        instance_create(x, y, obj_highjumpcloud2)
        if (heavy == 0)
            vsp = -11 * getRPGMulti("jump")
        else
            vsp = -6 * getRPGMulti("jump")
        image_index = 0
    }
    if (grounded && move != 0 && sprite_index == spr_haulingidle)
        sprite_index = spr_haulingwalk
    else if (grounded && move == 0 && sprite_index == spr_haulingwalk)
        sprite_index = spr_haulingidle
    if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_haulingidle
    if ((sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1)) || ((!grounded) && (sprite_index == spr_haulingwalk || sprite_index == spr_haulingidle)))
        sprite_index = spr_haulingfall
    if (grounded && vsp > 0 && (sprite_index == spr_haulingfall || sprite_index == spr_haulingjump))
        sprite_index = spr_haulingland
    if (sprite_index == spr_haulingland && floor(image_index) == (image_number - 1))
        sprite_index = spr_haulingidle
    if (input_check_pressed("slap") && sprite_index != spr_swingding)
    {
        if (move != 0)
            move = xscale
        hsp = xscale * movespeed
        movespeed = hsp
        state = (8 << 0)
        if (!input_check("up"))
            sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
        else if input_check("up")
            sprite_index = spr_uppercutfinishingblow
        image_index = 0
    }
    else if (input_check_pressed("slap") && sprite_index == spr_swingding && swingdingendcooldown > 20)
    {
        if (move != 0)
            move = xscale
        hsp = xscale * movespeed
        movespeed = hsp
        swingdingendcooldown = 0
        state = (8 << 0)
        sprite_index = spr_swingdingend
        image_index = 0
    }
    if (input_check("down") || (input_check("groundpound") && (!grounded)))
    {
        sprite_index = spr_piledriver
        vsp = -5 * getRPGMulti("jump")
        state = (78 << 0)
        image_index = 0
        image_speed = 0.35
    }
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (input_check("down") && grounded && sprite_index != spr_swingding && sprite_index != spr_swingdingend)
    {
        state = (102 << 0)
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
    if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
        steppy = 1
    if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
        steppy = 0
    if (sprite_index != spr_swingding)
        image_speed = 0.35
    else
        image_speed = 0.5
    if (grabbingenemy && (!instance_exists(baddiegrabbedID)))
    {
        state = (2 << 0)
        landAnim = 0
        image_index = 0
    }
    return;
}

