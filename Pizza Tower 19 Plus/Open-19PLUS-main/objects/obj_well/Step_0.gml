if (!instance_exists(ID) && global.currentpowerup != powerup.mort && place_meeting(x, y, obj_player))
{
    instance_destroy(obj_mort);
    
    with (instance_create_depth(x, y - 50, depth - 1, obj_mort))
        other.ID = id;
}
