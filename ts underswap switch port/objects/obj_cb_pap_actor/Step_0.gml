actor_shake_logic();

switch (sprite_index)
{
    case spr_papb_stomp:
        image_speed = 1;
        break;
    
    default:
        var speaking = false;
        
        if (obj_crossbones_monster.specialSb == 3)
        {
            with (obj_speechbubble)
            {
                if (writer != -4 && !writer.isDone)
                    speaking = true;
            }
        }
        
        if (speaking)
        {
            image_speed = 1;
        }
        else
        {
            image_index = 0;
            image_speed = 0;
        }
        
        break;
}
