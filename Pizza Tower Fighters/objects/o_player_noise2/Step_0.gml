event_inherited();

if (global.P2Cpu == true)
    ScrCPU_AttackTimer();

if (instance_exists(o_youwon))
{
    ScrPlayer_StopSprintSound();
    sprintstartanim = true;
    sprint = false;
    
    if (instance_exists(O_Timer))
    {
        if (O_Timer.timermin == 0)
            state = (21 << 0);
        else
            state = (20 << 0);
    }
    else
    {
        state = (20 << 0);
    }
}

if (!instance_exists(O_Fade) && !global.P2Cpu)
{
    switch (state)
    {
        case (0 << 0):
            player_noise_idle();
            break;
        
        case (1 << 0):
            player_hurt();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_noise_sideE();
            break;
        
        case (4 << 0):
            player_noise_down_Aerial();
            break;
        
        case (5 << 0):
            player_noise_upE();
            break;
        
        case (6 << 0):
            player_noise_downE();
            break;
        
        case (7 << 0):
            player_noise_side_aerial();
            break;
        
        case (8 << 0):
            player_noise_up_aerial();
            break;
        
        case (9 << 0):
            player_noise_down_special();
            break;
        
        case (10 << 0):
            player_noise_side_special();
            break;
        
        case (11 << 0):
            player_noise_up_special();
            break;
        
        case (12 << 0):
            player_noise_taunt();
            break;
        
        case (16 << 0):
            player_noise_parry();
            break;
        
        case (13 << 0):
            player_intro_noise();
            break;
        
        case (14 << 0):
            player_noise_dash_attack();
            break;
        
        case (17 << 0):
            player_stun();
            break;
        
        case (18 << 0):
            player_noise_turn();
            break;
        
        case (19 << 0):
            player_noise_sprint();
            break;
        
        case (20 << 0):
            player_noise_win();
            break;
        
        case (21 << 0):
            player_noise_draw();
            break;
        
        case (22 << 0):
            player_noise_super_start();
            break;
        
        case (23 << 0):
            player_noise_super_jump();
            break;
        
        case (24 << 0):
            player_noise_super_fall();
            break;
        
        case (25 << 0):
            player_noise_super_finish();
            break;
        
        case (69420 << 0):
            player_vigilante_captured();
            break;
    }
}

if (!instance_exists(O_Fade) && global.P2Cpu)
{
    switch (state)
    {
        case (13 << 0):
            player_intro_noise();
            break;
        
        case (0 << 0):
            player_noise_CPUwait();
            break;
        
        case (1 << 0):
            player_noise_CPUfollow();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_noise_sideE();
            break;
        
        case (4 << 0):
            player_noise_down_Aerial();
            break;
        
        case (5 << 0):
            player_noise_upE();
            break;
        
        case (6 << 0):
            player_noise_downE();
            break;
        
        case (7 << 0):
            player_noise_side_aerial();
            break;
        
        case (8 << 0):
            player_noise_up_aerial();
            break;
        
        case (9 << 0):
            player_noise_down_special();
            break;
        
        case (10 << 0):
            player_noise_side_special();
            break;
        
        case (11 << 0):
            player_noise_up_special();
            break;
        
        case (12 << 0):
            player_noise_taunt();
            break;
        
        case (16 << 0):
            player_noise_parry();
            break;
        
        case (17 << 0):
            player_stun();
            break;
        
        case (14 << 0):
            player_noise_CPUrecover();
            break;
        
        case (18 << 0):
            player_noise_CPUpath();
            break;
        
        case (20 << 0):
            player_noise_win();
            break;
        
        case (21 << 0):
            player_noise_draw();
            break;
        
        case (22 << 0):
            player_noise_super_start();
            break;
        
        case (23 << 0):
            player_noise_super_jump();
            break;
        
        case (24 << 0):
            player_noise_super_fall();
            break;
        
        case (25 << 0):
            player_noise_super_finish();
            break;
        
        case (69420 << 0):
            player_vigilante_captured();
            break;
    }
}
