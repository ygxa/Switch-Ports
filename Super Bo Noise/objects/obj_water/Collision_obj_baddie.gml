with (other)
{
    if (object_index != obj_clamchor)
        instance_destroy();
    
    if (object_index == obj_clamchor && state == 140 && vsp > -5)
    {
        ventilator_vsp = -5;
        vsp = ventilator_vsp;
    }
}
