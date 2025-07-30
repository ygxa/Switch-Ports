function scr_scareenemy()
{
    if (point_in_rectangle(x, y, obj_player.x - 400, obj_player.y - 60, obj_player.x + 400, obj_player.y + 60) && (obj_player.state == 67 || obj_player.state == 102 || (obj_player.movespeed >= 10 && obj_player.state == 98)))
    {
        if (state != 9)
        {
            state = 9;
            sprite_index = scaredspr;
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            hsp = 0;
            
            if (grav != 0 && grounded)
                vsp = -3;
            
            image_index = 0;
        }
        
        ScareBuffer = clamp(ScareBuffer++, 50, 80);
    }
    
    ScareBuffer--;
    
    if (ScareBuffer <= 0 && state == 9)
    {
        state = 3;
        sprite_index = walkspr;
        ScareBuffer = 0;
    }
}
