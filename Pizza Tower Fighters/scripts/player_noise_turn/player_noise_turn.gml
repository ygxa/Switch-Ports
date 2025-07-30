function player_noise_turn()
{
    if (sprite_index != s_noise_dash_turn)
    {
        sprite_index = s_noise_dash_turn;
        image_speed = 1;
        image_index = 0;
        image_xscale *= -1;
        accel_final = sprint_accel_max / 2;
        ScrPlayer_StopSprintSound();
        audio_play_sound(su_noise_turn, 50, false);
    }
    
    if (accel_final > 0)
        accel_final -= accel;
    
    if (accel_final < accel)
        accel_final = 0;
    
    hsp = accel_final * -last_h;
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (19 << 0);
        sprint = true;
        sprintcurrent = last_h;
        accel_final = sprint_accel_max;
        sprintstartanim = true;
    }
}
