with (other)
{
    if (object_index != obj_clamchor)
        instance_destroy()
    if (object_index == obj_clamchor && state == (140 << 0) && vsp > -5)
    {
        ventilator_vsp = -5
        vsp = ventilator_vsp
    }
}
