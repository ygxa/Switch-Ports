if (!start)
    exit;


if room != secrets_intro
{
    seconds--;
    
    if (seconds < 0)
    {
        if (minutes > 0)
        {
            minutes--;
            seconds = 59;
        }
        else if (room != rank_room)
        {
            with (obj_player1)
            {
                instance_destroy(obj_fadeoutTransition);
                targetDoor = "A";
                state = PlayerState.timesup;
                sprite_index = spr_Timesup;
                image_index = 0;
                visible = true;
                image_blend = c_white;
                stop_music();
                room = timesuproom;
            }
            
            instance_destroy();
        }
    }
}
