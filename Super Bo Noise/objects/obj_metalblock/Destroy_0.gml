if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (8)
    {
        with (create_debris((x + (random_range(0, 64))), (y + (random_range(0, 64))), particlespr, 0))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0
            image_index = random_range(0, (image_number - 1))
        }
    }
    scr_sleep(5)
    instance_create((x + 32), (y + 32), obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = 40 / room_speed
    }
    scr_soundeffect(sfx_breakmetal)
    ds_list_add(global.saveroom, id)
}
depth = 1
