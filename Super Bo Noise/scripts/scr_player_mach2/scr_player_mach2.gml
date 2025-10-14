function state_player_mach2() //state_player_mach2
{
    if (windingAnim < 2000)
        windingAnim++
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = xscale * movespeed + railmovespeed * raildir
    move2 = input_check_pressed("right") + input_check_pressed("left")
    move = input_check("right") - input_check("left")
    crouchslideAnim = 1
    if keyboard_check_pressed(ord("S"))
        scr_shoot_farmerprojectile()
    if ((!input_check("jump")) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && can_jump && sprite_index != spr_secondjump1 && sprite_index != spr_clownjump && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
    {
        image_index = 0
        sprite_index = spr_secondjump1
        scr_soundeffect(bojump)
        if skateboarding
            sprite_index = spr_clownjump
        vsp = -11 * getRPGMulti("jump")
    }
    var mortjump = 0
    if (input_check_pressed("jump") && global.mort == 1 && sprite_index != spr_mortdoublejump && (!grounded) && (!skateboarding))
    {
        state = (94 << 0)
        repeat (6)
            create_debris(x, y, spr_null)
        sprite_index = spr_mortdoublejump
        image_index = 0
        grav = 0.25
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        mort = 1
        mortjump = 1
    }
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4 && sprite_index != spr_null)
        {
            if (sprite_index != spr_null && sprite_index != spr_rollgetup && sprite_index != spr_suplexdash && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
                sprite_index = spr_mach
        }
        if (machpunchAnim == 1)
        {
            if (punch == 0)
                sprite_index = spr_machpunch1
            if (punch == 1)
                sprite_index = spr_machpunch2
            if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
            {
                punch = 1
                machpunchAnim = 0
            }
            if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
            {
                punch = 0
                machpunchAnim = 0
            }
        }
    }
    if (sprite_index == spr_grindjump || sprite_index == spr_grindfall)
    {
        if (animation_end() && sprite_index == spr_grindjump)
            sprite_index = spr_grindfall
        if (grounded && vsp > 0)
            sprite_index = spr_mach
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
        sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_longjump)
        sprite_index = spr_player_longjumpend
    if (!grounded)
        machpunchAnim = 0
    if grounded
    {
        if (scr_slope() && hsp != 0 && movespeed > (8 * getRPGMulti("movespeed")))
            scr_playerAddSlopeMomentum(0.1, 0)
        if (movespeed < (12 * getRPGMulti("movespeed")))
        {
            if (mach4mode == 0)
                movespeed += (0.1 * getRPGMulti("movespeed"))
            else
                movespeed += (0.2 * getRPGMulti("movespeed"))
        }
        if ((abs(hsp) >= (12 * getRPGMulti("movespeed")) || abs(hsp) >= 12) && skateboarding == 0 && sprite_index != spr_suplexdash)
        {
            machhitAnim = 0
            state = (123 << 0)
            flash = 1
            if (sprite_index != spr_rollgetup)
                sprite_index = spr_mach4
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (((!grounded) || slopeCheck((x + xscale), y)) && place_meeting_collision((x + xscale), y, (1 << 0)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        wallspeed = movespeed
        if (vsp > 0 && place_meeting((x + xscale), y, obj_icyWall))
            wallspeed -= vsp
        state = (39 << 0)
    }
    else if (place_meeting_collision((x + xscale), y, (1 << 0)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        if skateboarding
            xscale *= -1
        else
        {
            var _ledge = slope_check_up((x + xscale), y, (vsp >= 0 ? 32 : 22))
            if (_ledge > 0)
                y -= _ledge
            else
            {
                state = (108 << 0)
                image_index = 0
                sprite_index = spr_player_wallsplat
                scr_soundeffect(sfx_splat)
            }
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (grounded && floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_player_rampjump))
        sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexdash)
        sprite_index = spr_mach
    if ((!grounded) && sprite_index != spr_grindfall && sprite_index != spr_grindjump && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_walljumpend && sprite_index != spr_player_longjump && sprite_index != spr_player_longjumpend)
    {
        sprite_index = spr_secondjump1
        if skateboarding
            sprite_index = spr_clownfall
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend
    if ((!grounded) && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_clownfall
    if (input_check("down") && (!(place_meeting(x, y, obj_dashpad))))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        flash = 0
        state = (7 << 0)
        vsp = 10
        image_index = 0
        if ((!grounded) || place_meeting(x, (y + 1), obj_water))
        {
            sprite_index = spr_dive
            scr_soundeffect(dive)
        }
        else
            sprite_index = spr_player_backslideland
    }
    if (input_check("attack") && (!(place_meeting((x + xscale), y, obj_solid))) && character == "S" && grounded)
    {
        state = (44 << 0)
        movespeed = 0
    }
    if (((!input_check("attack")) && movespeed >= (8 * getRPGMulti("movespeed")) && grounded && skateboarding == 0) || (character == "S" && move == 0 && grounded))
    {
        image_index = 0
        state = (107 << 0)
        scr_soundeffect(sfx_break)
        sprite_index = spr_machslidestart
    }
    else if ((!input_check("attack")) && movespeed < (8 * getRPGMulti("movespeed")) && grounded && skateboarding == 0)
        state = (2 << 0)
    if (move == (-xscale) && movespeed >= (8 * getRPGMulti("movespeed")) && grounded && skateboarding == 0)
    {
        scr_soundeffect(sfx_turnstart)
        image_index = 0
        state = (107 << 0)
        sprite_index = spr_machslideboost
    }
    else if (move == (-xscale) && movespeed < (8 * getRPGMulti("movespeed")) && grounded && skateboarding == 0)
    {
        xscale *= -1
        movespeed = 6 * getRPGMulti("movespeed")
    }
    if (clowntimer > 0 && skateboarding == 1)
        clowntimer--
    if (clowntimer <= 0 && skateboarding == 1)
    {
        state = (2 << 0)
        instance_create(x, y, obj_genericpoofeffect)
    }
    if (sprite_index == spr_rollgetup || sprite_index == spr_suplexdash)
        image_speed = 0.4
    else
        image_speed = abs(movespeed) / 15
    scr_dotaunt()
    if (skateboarding && sprite_index != spr_clownjump && grounded)
        sprite_index = spr_clown
    if mortjump
        sprite_index = spr_player_mortjumpstart
    if ((input_check_pressed("slap") || input_buffer_slap < 8) && (!input_check("up")))
    {
        sprite_index = spr_suplexdash
        if (global.attackstyle == 1)
        {
            if grounded
                sprite_index = spr_null
            else
                sprite_index = spr_null
        }
        else if (global.attackstyle == 2)
            sprite_index = spr_null
        suplexmove = 1
        audio_play_sound(sfx_suplexdash,1,0)
        state = (44 << 0)
        if (movespeed < (8 * getRPGMulti("attack")))
            movespeed = 8 * getRPGMulti("attack")
        image_index = 0
        flash = 1
    }
    else if ((input_check_pressed("slap") || input_buffer_slap < 8) && input_check("up"))
    {
        state = (82 << 0)
        sprite_index = spr_breakdanceuppercut
        if chance(50)
            scr_soundeffect(choose(bouppercut_1,bouppercut_2,bouppercut_3,bouppercut4))
        scr_soundeffect(uppercut2)
        vsp = (grounded ? -15 : -11) * getRPGMulti("jump")
        movespeed = hsp
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    if input_check_pressed("shoot")
        scr_kungfu()
    if (global.attackstyle == 2 && input_check_pressed("slap"))
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
        image_index = 0
        state = (45 << 0)
    }
    if input_check_pressed("shoot")
        scr_kungfu()
    if (state != (106 << 0) && audio_is_playing(sfx_rollgetup))
        audio_stop_sound(sfx_rollgetup)
    return;
}

