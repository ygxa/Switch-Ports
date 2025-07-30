function player_test_turn()
{
    if (sprite_index != s_test_dash_turn)
    {
        sprite_index = s_test_dash_turn;
        image_speed = 1;
        image_index = 0;
        image_xscale *= -1;
        ScrPlayer_StopSprintSound();
        accel_final = sprint_accel_max / 2;
        audio_play_sound(su_pep_turn, 50, false);
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
        state = (0 << 0);
        sprint = true;
        sprintcurrent = last_h;
        sprintstartanim = true;
        accel_final = sprint_accel_max;
    }
}
