// GMS 2023.2 doesn't accept arrays like this
//visible = !place_meeting(x, y, [obj_secretbigblock, obj_secretblock, obj_secretmetalblock]);

var isVis = true;
var obj_arr = [obj_secretbigblock, obj_secretblock, obj_secretmetalblock];
for (var i = 0; i < array_length(obj_arr); i++)
{
	if place_meeting(x, y, obj_arr[i])
		isVis = false;
}
visible = isVis;

if (active && sprite_index == spr_secretportal_close && !touched)
{
    sprite_index = spr_secretportal_open;
    image_index = 0;
}

if (touched && sprite_index == spr_secretportal_close)
{
    with (playerid)
    {
        hsp = 0;
        vsp = 0;
        x = other.x;
        y = other.y;
        scale_xs = Approach(scale_xs, 0, 0.05);
        scale_ys = Approach(scale_ys, 0, 0.05);
        fallinganimation = 0;
        
        if (state == states.mach2 || state == states.mach3)
            state = states.normal;
    }
    
    with (obj_heataura)
        visible = false;
}

if (floor(image_index) == (image_number - 1))
{
    if (sprite_index == spr_secretportal_open)
        sprite_index = spr_secretportal_idle;
    
    if (sprite_index == spr_secretportal_close)
    {
        image_index = image_number - 1;
        
        if (touched)
        {
            if (!instance_exists(obj_fadeout))
            {
                with (playerid)
                {
                    lastTargetDoor = targetDoor;
                    targetDoor = "S";
                    
                    if (!other.isexit)
                    {
                        lastroom = room;
                        targetRoom = other.targetRoom;
                        secretportalID = other.id;
                        
                        if (!other.foundsecret)
                        {
                            other.foundsecret = true;
                            global.secretfound++;
                            
                            with (obj_drawcontroller)
                            {
                                thintext = string_get("thintexts/secretfound", global.secretfound);
                                self.tv_thintext();
                                alarm[9] = 180;
                            }
                            
                            event_play_oneshot("event:/sfx/misc/secretfound");
                        }
                    }
                    else
                        targetRoom = lastroom;
                }
                
                if (!isexit)
                    ds_list_add(global.saveroom, id);
                
                instance_create_depth(x, y, -9999, obj_fadeout);
            }
        }
    }
}
