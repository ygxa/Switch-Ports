if (state == 154)
    exit;

if (ds_queue_size(followqueue) < LAG_STEPS)
    exit;

with (obj_player1)
{
    targetRoom = other.targetRoom;
    lastroom = room;
    targetDoor = other.targetDoor;
    visible = false;
    
    if (state != 188)
        state = 154;
    
    cutscene = 1;
    hsp = 0;
    vsp = 0;
}

grav = 0;
state = 154;
hsp = 10;
image_xscale = 1;
vsp = 0;
