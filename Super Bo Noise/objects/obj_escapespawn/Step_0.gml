switch state
{
    case 0:
        if (!global.panic)
        {
            visible = false
            instance_deactivate_object(baddieID)
            with (obj_baddiecollisionbox)
            {
                if (baddieID == other.baddieID)
                    instance_destroy()
            }
        }
        else
            state = 1
        break
    case 1:
        var p = instance_nearest(x, y, obj_player1)
        visible = false
        image_index = 0
        if (distance_to_pos(x, y, p.x, p.y, 500, 100) || (baddieID.object_index == obj_clamchor && collision_rectangle((x - 100), (y - 30), (x + 100), (y + 600), p, false, true) > 0))
        {
            state = 2
            visible = true
        }
        break
    case 2:
        if (floor(image_index) > 5)
        {
            instance_activate_object(baddieID)
            scr_soundeffect(bleupgh__1_)
            with (baddieID)
            {
                x = other.x
                y = other.y
                state = (140 << 0)
                sprite_index = stunfallspr
                stunned = 20
                boundbox = 0
                create_particle(x, y, (9 << 0))
            }
            state = 3
        }
        break
    case 3:
        if (floor(image_index) == (image_number - 1))
            visible = false
        break
}

