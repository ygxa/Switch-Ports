function player_test_CPUrecover()
{
    if (abletorecover != 0)
        state = (11 << 0);
    
    cpu_recovering = true;
    direction = point_direction(x, y, o_cpu_findme.x, o_cpu_findme.y);
    
    if (accel_final <= accel_max)
        accel_final += accel;
    
    hsp = lengthdir_x(accel_final, direction);
    vsp += grv;
    player_col();
    
    if (place_meeting(x, y, o_parentwall))
        state = (1 << 0);
}
