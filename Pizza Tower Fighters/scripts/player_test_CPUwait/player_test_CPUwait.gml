function player_test_CPUwait()
{
    accel_final = 0;
    hsp = 0;
    vsp += grv;
    player_col();
    sprite_index = s_test_idl;
    ScrCPU_FindNearestPoint();
    state = (1 << 0);
}
