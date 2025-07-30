with (obj_trapghost)
{
    if (point_distance(obj_player1.x, obj_player1.y, other.x, other.y) < other.ghost_distance_threshold && (state == 2 || trapid == -4 || (point_distance(obj_player1.x, obj_player1.y, trapid.x, trapid.y) > point_distance(obj_player1.x, obj_player1.y, other.x, other.y) && trapid.object_index != obj_tvtrap)))
    {
        state = 10;
        trapid = other.id;
    }
}
