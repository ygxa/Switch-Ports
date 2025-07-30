var _obj = id;

with (other)
{
    if (scr_transformationcheck() || state == 7)
    {
        if ((state != 108 || sprite_index != spr_player_catched) && (state != 7 || xscale != _obj.image_xscale) && state != 49 && state != 40 && state != 86 && state != 188)
        {
            state = 7;
            xscale = sign(other.image_xscale);
            mask_index = spr_crouchmask;
            movespeed = 14;
            vsp = 0;
            sprite_index = spr_tumble;
            other.image_index = 0;
            other.sprite_index = spr_null;
            var _max = 45;
            y = other.y - _max;
            
            if (place_meeting(x, y, obj_platform))
                y--;
            
            if (scr_solid(x, y))
            {
                var i = 0;
                
                while (i <= _max)
                {
                    if (scr_solid(x, y))
                    {
                        x += xscale;
                        i++;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            
            if (scr_solid(x, y))
            {
                var i = 0;
                
                while (i <= _max)
                {
                    if (scr_solid(x, y))
                    {
                        y--;
                        i++;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
        }
    }
}
