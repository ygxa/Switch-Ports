function scr_player_parry()
{
    if (image_index > (image_number - 1))
        state = states.normal;
    
    hsp = -xscale * movespeed;
    image_speed = 0.4;
    
    if (movespeed > 0)
        movespeed -= 0.5;
    
    var _grabbedby = 1;
    
    if (object_index == obj_player2)
        _grabbedby = 2;
    
    if (parry_count > 0)
    {
        parry_count--;
        var parry_threshold = 64;
        
        with (obj_baddie)
        {
            if (distance_to_object(other) < parry_threshold && state != states.hit && state != states.grabbed && state != states.capefall && parryable && !(state == states.capefall && thrown == 1))
            {
                obj_player1.xscale = -image_xscale;
                grabbedby = _grabbedby;
                var lag = 5;
                hitLag = lag;
                hitX = x;
                hitY = y;
                
                if (!important)
                    global.combotime = 60;
                
                obj_player1.hitLag = lag;
                obj_player1.hitX = obj_player1.x;
                obj_player1.hitY = obj_player1.y;
                instance_create(x, y, obj_parryeffect);
                alarm[3] = 1;
                state = states.hit;
                image_xscale = -obj_player1.xscale;
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag_acc = 3 / room_speed;
                }
                
                stunned = 100;
                other.hithsp = -other.image_xscale * 6;
                other.hsp = -other.image_xscale * 6;
                
                if (!other.grounded)
                {
                    other.vsp = -6;
                    other.hitvsp = -6;
                }
            }
        }
    }
}
