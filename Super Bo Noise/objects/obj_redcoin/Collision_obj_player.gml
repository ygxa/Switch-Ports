if (room == rm_blank)
    return;
if (other.state != (188 << 0))
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp((global.playerhealth + 1), 0, 100)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    with (obj_camera)
        healthshaketime = 30
    var val = heat_calculate(10)
    if (other.object_index == obj_player1)
        global.collect += val
    else
        global.collectN += val
    create_collect(x, y, sprite_index, val)
    with (instance_create((x + 16), y, obj_smallnumber))
    {
        color = 255
        number = string(global.redcoins + 1)
    }
    var last = true
    with (obj_redcoin)
    {
        if (id != other.id)
            last = false
    }
    if last
    {
        global.redcoin = 0
        with (instance_create(x, y, obj_objspawner))
        {
            content_arr = [obj_bigcollect, obj_bigcollect, obj_bigcollect]
            func = function() //anon@1086@gml_Object_obj_redcoin_Collision_obj_player
            {
                x = obj_player1.x
                y = obj_player1.y
            }

        }
    }
    scr_soundeffect(redsnd)
    global.redcoins++
    global.redcoincount++
    mail_trigger((12 << 0))
    instance_destroy()
}
