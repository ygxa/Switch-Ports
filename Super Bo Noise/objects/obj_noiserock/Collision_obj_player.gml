if (falling == 1 && vsp > 0)
{
    hit = 1
    instance_create(x, y, obj_stompeffect)
    obj_player1.image_index = 0
    obj_player1.state = (61 << 0)
    obj_player1.sprite_index = spr_null
    vsp = -5
    falling = 0
    with (obj_camera)
    {
        shake_mag = 10
        shake_mag_acc = 30 / room_speed
    }
}
