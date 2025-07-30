if (fadealpha > 1)
{
    fadein = 1;
    
    if (instance_exists(obj_player))
    {
        if (room_exists(obj_player.targetRoom))
            room_goto(obj_player.targetRoom);
        else
            room_goto(rm_missing);
    }
}

if (fadein == 0)
    fadealpha += 0.1;
else if (fadein == 1)
    fadealpha -= 0.1;

if (instance_exists(obj_player))
{
    with (obj_player)
    {
        if (other.fadein == 1 && (obj_player.state == 74 || obj_player.state == 58) && (place_meeting(x, y, par_door) || place_meeting(x, y, obj_startgate)))
        {
            state = 59;
            image_index = 0;
        }
        
        if (other.fadein == 1 && obj_player.state == 74 && (obj_player.sprite_index == spr_player_downpizzabox || obj_player.sprite_index == spr_player_uppizzabox))
            state = 63;
    }
}

if (fadein == 1 && fadealpha < 0)
    instance_destroy();
