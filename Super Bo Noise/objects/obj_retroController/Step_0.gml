if (instance_exists(obj_mainmenu))
{
    instance_destroy();
    exit;
}

if (!activated)
{
    var go = false;
    
    with (obj_pauseNew)
    {
        if (state == 1)
            go = true;
    }
    
    if (go)
    {
        activated = true;
        
        with (obj_player1)
        {
            targetRoom = smb_1_32;
            targetDoor = "A";
            global.leveltorestart = smb_1_32;
            global.leveltosave = "wahoo";
            sprite_index = spr_victory;
            image_index = 0;
            state = 100;
            movespeed = 0;
            hsp = 0;
            vsp = 0;
            instance_create(x, y, obj_fadeout);
            global.level_seconds = 0;
            global.level_minutes = 0;
            backtohubroom = rm_mainmenu;
        }
    }
    
    exit;
}

if (!activeRoom)
    exit;

scanblock_y++;

if (scanblock_y >= global.resolutions[0][1][1])
    scanblock_y = 0;
