if (!instance_exists(ID) && obj_player1.state != 15 && obj_player1.state != 13 && obj_player1.state != 14 && obj_player1.state != 16 && place_meeting(x, y, obj_player1))
{
    instance_destroy(obj_mort);
    
    with (instance_create(x, y - 50, obj_mort))
        other.ID = id;
}
