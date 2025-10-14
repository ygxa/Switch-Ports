switch state
{
    case (2 << 0):
        if place_meeting(x, y, obj_player1)
        {
            var num = instance_place_list(x, y, obj_player1, global.instancelist, 0)
            for (var i = 0; i < num; i++)
            {
                var b = ds_list_find_value(global.instancelist, i)
                if (b.state == (123 << 0))
                {
                    player_inst = b
                    hsp = sign(player_inst.hsp)
                    if (hsp == 0)
                        hsp = player_inst.xscale
                    instance_destroy(inst)
                    with (b)
                    {
                        hitX = x
                        hitY = y
                        hitLag = 10
                        tauntstoredmovespeed = movespeed
                        tauntstoredsprite = sprite_index
                        tauntstoredstate = state
                        tauntstoredvsp = vsp
                        state = (63 << 0)
                    }
                    state = (139 << 0)
                    hitX = x
                    hitY = y
                    hitLag = 50
                    with (obj_camera)
                    {
                        shake_mag = 10
                        shake_mag_acc = 10 / room_speed
                    }
                }
            }
        }
        break
    case (139 << 0):
        x = hitX + (irandom_range(-1, 1))
        y = hitY + (irandom_range(-1, 1))
        if (hitLag > 0)
            hitLag--
        else
        {
            x = hitX
            y = hitY
            instance_destroy()
        }
        break
}

