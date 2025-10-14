image_speed = 0.35
switch sprite_index
{
    case spr_secretportal_spawnopen:
        with (obj_heatafterimage)
            visible = false
        with (obj_player1)
        {
            if (object_index != obj_player2 || global.coop)
            {
                x = other.x
                y = other.y
                roomstartx = x
                roomstarty = y
                hsp = 0
                vsp = 0
                cutscene = 1
                visible = false
                if ((!isgustavo) && state != (49 << 0) && state != (40 << 0) && state != (51 << 0) && state != (271 << 0) && state != (272 << 0) && state != (273 << 0) && state != (270 << 0))
                    state = (2 << 0)
            }
        }
        waitbuffer = 80
        drop = 0
        if (floor(image_index) == (image_number - 1))
        {
            scr_soundeffect(sfx_secretexit)
            sprite_index = spr_secretportal_spawnidle
            with (obj_player1)
            {
                if (object_index != obj_player2 || global.coop)
                {
                    if ((!isgustavo) && state != (49 << 0) && state != (40 << 0) && state != (51 << 0) && state != (271 << 0) && state != (272 << 0) && state != (273 << 0) && state != (270 << 0))
                    {
                        visible = true
                        cutscene = 0
                        sprite_index = spr_bodyslamstart
                        image_index = 0
                        state = (124 << 0)
                        vsp = (character == "P" ? -5 : -7)
                    }
                    else
                        sprite_index = tauntstoredsprite
                }
            }
        }
        break
    case spr_secretportal_spawnidle:
        if (!drop)
        {
            with (obj_heatafterimage)
                visible = false
            with (obj_player1)
            {
                if check_player_coop()
                {
                    x = other.x
                    y = other.y - 10
                    visible = true
                    hsp = 0
                    vsp = 10
                    scale_xs = approach(scale_xs, 1, 0.05)
                    scale_ys = approach(scale_ys, 1, 0.05)
                    fallinganimation = 0
                    if (scale_xs == 1)
                        other.drop = 1
                }
            }
        }
        if drop
        {
            if (waitbuffer > 0)
                waitbuffer--
            else
            {
                sprite_index = spr_secretportal_spawnclose
                image_index = 0
            }
        }
        break
    case spr_secretportal_spawnclose:
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1
            instance_destroy()
        }
        break
}

