function player_noise_CPUwait()
{
    accel_final = 0;
    hsp = 0;
    vsp += grv;
    player_col();
    sprite_index = s_noise_idle;
    ScrCPU_FindNearestPoint();
    state = (1 << 0);
}
