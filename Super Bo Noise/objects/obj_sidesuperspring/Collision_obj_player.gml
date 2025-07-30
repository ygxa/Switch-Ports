with (other)
{
    if (state != 188)
    {
        if (state == 55 || state == 34 || state == 96 || state == 186 || state == 80 || state == 7 || state == 23 || state == 40 || state == 67 || state == 123 || state == 106)
        {
            other.sprite_index = spr_null;
            other.image_index = 0;
            
            if (xscale != other.image_xscale)
                xscale = other.image_xscale;
        }
    }
}
