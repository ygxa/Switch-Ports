function state_player_climbwall() //state_player_climbwall
{
    switch character
    {
        case "P":
            if place_meeting((x + xscale), y, obj_unclimbablewall)
            {
                state = (108 << 0)
                hsp = -2.5 * xscale
                vsp = -3
                mach2 = 0
                image_index = 0
                return;
            }
            if (windingAnim < 200)
                windingAnim++
            move = input_check("right") - input_check("left")
            suplexmove = 0
            vsp = (-wallspeed)
            if (wallspeed < (20 * getRPGMulti("movespeed")))
                wallspeed += (0.15 * getRPGMulti("movespeed"))
            if (wallspeed < 0)
            {
                if (mach4mode == 0)
                    movespeed += (0.2 * getRPGMulti("movespeed"))
                else
                    movespeed += (0.4 * getRPGMulti("movespeed"))
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (grabclimbbuffer > 0)
                grabclimbbuffer--
            if ((!input_check("attack")) && (!skateboarding) && grabclimbbuffer <= 0)
            {
                grabclimbbuffer = 0
                state = (2 << 0)
                movespeed = 0
                railmovespeed = 6
                raildir = (-xscale)
            }
            if (verticalbuffer <= 0 && place_meeting_collision(x, (y - 1), (1 << 0)) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    scr_soundeffect(sfx_groundpound)
                    scr_soundeffect(sfx_bumpwall)
                    image_index = 0
                    state = (125 << 0)
                    machhitAnim = 0
                }
                else if (!input_check("jump"))
                {
                    state = (108 << 0)
                    hsp = -2.5 * xscale
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if (verticalbuffer <= 0 && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                var old_x = x
                var old_y = y
                var attempt = 0
                while (!(place_meeting_collision((x + xscale), y)))
                {
                    attempt++
                    y++
                    if place_meeting_collision((x + xscale), y)
                    {
                        y--
                        break
                    }
                    else if (attempt > 40)
                        break
                }
                if (wallspeed < (6 * getRPGMulti("movespeed")))
                    wallspeed = 6 * getRPGMulti("movespeed")
                if ((wallspeed >= (6 * getRPGMulti("movespeed")) && wallspeed < (12 * getRPGMulti("movespeed"))) || skateboarding)
                {
                    state = (106 << 0)
                    movespeed = wallspeed
                }
                else if (wallspeed >= (12 * getRPGMulti("movespeed")))
                {
                    state = (123 << 0)
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
            }
            if (wallspeed < 0 && place_meeting_collision(x, (y + 12)))
                wallspeed = 0
            if input_check_pressed("jump")
            {
                scr_soundeffect(bojump)
                movespeed = 10 * getRPGMulti("movespeed")
                state = (106 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                vsp = -11 * getRPGMulti("jump")
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "V":
            if (windingAnim < 200)
                windingAnim++
            move = input_check("right") - input_check("left")
            suplexmove = 0
            vsp = (-wallspeed)
            if (wallspeed < 24 && move == xscale)
                wallspeed += 0.1
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (!input_check("attack"))
            {
                state = (2 << 0)
                movespeed = 0
            }
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                sprite_index = spr_superjumpland
                scr_soundeffect(sfx_groundpound)
                image_index = 0
                state = (125 << 0)
                machhitAnim = 0
            }
            if ((!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))))
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                if (movespeed >= 6)
                    state = (106 << 0)
                if (movespeed >= 12)
                {
                    state = (123 << 0)
                    sprite_index = spr_mach4
                }
            }
            if input_check_pressed("jump")
            {
                movespeed = 8
                state = (106 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                vsp = -11
                xscale *= -1
                jumpstop = 0
            }
            if ((grounded && wallspeed <= 0) || wallspeed <= 0)
            {
                state = (94 << 0)
                sprite_index = spr_fall
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "N":
            hsp = 0
            if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
                sprite_index = spr_null
            if (sprite_index == spr_null)
                vsp = 2
            else
                vsp = 0
            wallclingcooldown = 0
            if (floor(image_index) == (image_number - 1) || (!input_check("jump")))
            {
                vsp = -15
                state = (94 << 0)
                sprite_index = spr_playerN_jump
                image_index = 0
            }
            if input_check_pressed("jump")
            {
                vsp = -15
                state = (94 << 0)
                sprite_index = spr_playerN_jump
                image_index = 0
            }
            image_speed = 0.35
            break
    }

    return;
}

