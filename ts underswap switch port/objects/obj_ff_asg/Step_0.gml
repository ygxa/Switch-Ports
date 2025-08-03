x += horzSpeed;

if (state == 0)
{
    var frogAlive = instance_exists(obj_first_froggit_monster) && obj_first_froggit_monster.visible;
    var targX;
    
    if (frogAlive)
        targX = 271;
    else
        targX = 251;
    
    if (x < targX)
    {
        x = targX;
        horzSpeed = 0;
        state = 1;
        
        with (obj_first_froggit_monster)
        {
            if (visible)
            {
                horzSpeed = 0;
                x = floor(x);
            }
        }
        
        scene_resume();
    }
}

if (currentTalkTarget && instance_exists(obj_speechbubble) && instance_exists(obj_speechbubble.writer) && !obj_speechbubble.writer.isDone)
    image_speed = 0.2;
else if (floor(image_index) == 0)
    image_speed = 0;
