function player_fakepep_CPUwait()
{
    accel_final = 0;
    hsp = 0;
    vsp += grv;
    player_col();
    sprite_index = s_fakepep_idle;
    ScrCPU_FindNearestPoint();
    state = (1 << 0);
}
