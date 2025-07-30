if (global.P2Cpu == true)
    ScrCPU_AttackTimer();

event_inherited();

if (instance_exists(o_youwon))
{
    ScrPlayer_StopSprintSound();
    sprintstartanim = true;
    sprint = false;
    
    if (instance_exists(O_Timer))
    {
        if (O_Timer.timermin == 0)
            state = (20 << 0);
        else
            state = (19 << 0);
    }
    else
    {
        state = (19 << 0);
    }
}

if (!instance_exists(O_Fade) && global.P2Cpu == false)
{
    switch (state)
    {
        case (0 << 0):
            player_vigilante_idle();
            break;
        
        case (1 << 0):
            player_hurt();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_vigilante_sideE();
            break;
        
        case (4 << 0):
            player_vigilante_down_aerial();
            break;
        
        case (5 << 0):
            player_vigilante_upE();
            break;
        
        case (14 << 0):
            player_vigilante_dash_attack();
            break;
        
        case (6 << 0):
            player_vigilante_downE();
            break;
        
        case (7 << 0):
            player_vigilante_side_aerial();
            break;
        
        case (8 << 0):
            player_vigilante_up_aerial();
            break;
        
        case (9 << 0):
            player_vigilante_down_special();
            break;
        
        case (10 << 0):
            player_vigilante_side_special();
            break;
        
        case (11 << 0):
            player_vigilante_up_special();
            break;
        
        case (12 << 0):
            player_vigilante_taunt();
            break;
        
        case (13 << 0):
            player_intro_vigi();
            break;
        
        case (15 << 0):
            player_stun();
            break;
        
        case (16 << 0):
            player_vigilante_parry();
            break;
        
        case (17 << 0):
            player_vigilante_turn();
            break;
        
        case (18 << 0):
            player_vigilante_sprint();
            break;
        
        case (19 << 0):
            player_vigilante_win();
            break;
        
        case (20 << 0):
            player_vigilante_draw();
            break;
        
        case (21 << 0):
            player_vigilante_super_start();
            break;
        
        case (22 << 0):
            player_vigilante_super_shoot();
            break;
        
        case (69420 << 0):
            player_vigilante_captured();
            break;
    }
}

if (global.P2Cpu == true && !instance_exists(O_Fade))
{
    switch (state)
    {
        case (0 << 0):
            player_vigi_CPUwait();
            break;
        
        case (1 << 0):
            player_vigi_CPUfollow();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_vigilante_sideE();
            break;
        
        case (5 << 0):
            player_vigilante_upE();
            break;
        
        case (11 << 0):
            player_vigilante_up_special();
            break;
        
        case (7 << 0):
            player_vigilante_side_aerial();
            break;
        
        case (6 << 0):
            player_vigilante_downE();
            break;
        
        case (12 << 0):
            player_vigilante_taunt();
            break;
        
        case (4 << 0):
            player_vigilante_down_aerial();
            break;
        
        case (8 << 0):
            player_vigilante_up_aerial();
            break;
        
        case (10 << 0):
            player_vigilante_side_special();
            break;
        
        case (9 << 0):
            player_vigilante_down_special();
            break;
        
        case (14 << 0):
            player_vigilante_dash_attack();
            break;
        
        case (16 << 0):
            player_test_parry();
            break;
        
        case (13 << 0):
            player_intro_vigi();
            break;
        
        case (18 << 0):
            player_vigi_CPUrecover();
            break;
        
        case (15 << 0):
            player_stun();
            break;
        
        case (17 << 0):
            player_vigilante_turn();
            break;
        
        case (19 << 0):
            player_vigilante_win();
            break;
        
        case (20 << 0):
            player_vigilante_draw();
            break;
        
        case (21 << 0):
            player_vigilante_super_start();
            break;
        
        case (22 << 0):
            player_vigilante_super_shoot();
            break;
        
        case (69420 << 0):
            player_vigilante_captured();
            break;
        
        case (23 << 0):
            player_vigi_CPUpath();
            break;
    }
}
