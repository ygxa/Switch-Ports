if (active)
{
    if (place_meeting(x, y - 1, other) && other.vsp > 1 && other.state != 115 && other.state != 118 && other.state != 116 && other.state != 117)
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect);
            movespeed = hsp;
            state = 115;
            image_index = 0;
        }
        
        active = 0;
        alarm[0] = 150;
    }
}
