with (other)
{
    if (key_accept)
    {
        if (o_map_selected.map != other.map)
        {
            var mapID = o_map_selected.id;
            
            with (mapID)
            {
                with (instance_create_depth(x, y, depth - 1, obj_noncollideablephysicsobject))
                {
                    vsp = 1;
                    hsp = 0;
                    grav = 0.6;
                    sprite_index = other.sprite_index;
                }
                
                with (instance_create_depth(x + (sprite_get_width(sprite_index) / 2), y - 30 - drawy, depth - 1, obj_noncollideablephysicsobject))
                {
                    vsp = -12;
                    hsp = 6;
                    grav = 0.4;
                    sprite_index = other.sprite;
                    turning = 20;
                }
            }
            
            o_map_selected.map = other.map;
            o_map_selected.sprite = other.sprite;
            o_map_selected.alpha = 0;
            o_map_selected.drawy = 20;
            o_map_selected.mapsprite = other.pomni;
            
            with (o_map_selector)
                selected = 0;
            
            other.selected = true;
        }
        else
        {
            audio_stop_sound(mu_boogiewoogie);
            fadeToRoom(other.map, 20, 0, 1);
            
            if (other.map == R_Credits)
                global.player1 = "PS";
            
            instance_destroy();
        }
    }
}
