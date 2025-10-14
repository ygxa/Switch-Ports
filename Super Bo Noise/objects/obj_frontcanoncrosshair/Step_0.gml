var player = instance_nearest(x, y, obj_player1)
switch state
{
    case (2 << 0):
        visible = false
        image_speed = 0
        image_index = 0
        if (cooldown > 0)
            cooldown--
        else if distance_to_pos(x, y, player.x, player.y, threshold_x, threshold_y)
        {
            state = (10 << 0)
            attackbuffer = 20
        }
        break
    case (10 << 0):
        visible = true
        image_speed = 0.35
        if (attackbuffer > 0)
            attackbuffer--
        else
        {
            with (obj_frontcanongoblin)
            {
                if (state != (10 << 0))
                {
                    crosshair_x = other.x
                    crosshair_y = other.y
                    event_perform(ev_alarm, 0)
                    other.state = (2 << 0)
                    other.cooldown = 150
                }
            }
        }
        break
}

