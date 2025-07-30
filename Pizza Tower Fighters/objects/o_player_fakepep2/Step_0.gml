event_inherited();

if (instance_exists(o_youwon))
{
    ScrPlayer_StopSprintSound();
    sprintstartanim = true;
    sprint = false;
    
    if (instance_exists(O_Timer))
    {
        if (O_Timer.timermin == 0)
            state = (24 << 0);
        else
            state = (23 << 0);
    }
    else
    {
        state = (23 << 0);
    }
}

if (!instance_exists(O_Fade) && global.P2Cpu == false)
{
    switch (state)
    {
        case (0 << 0):
            player_faker_idle();
            break;
        
        case (1 << 0):
            player_hurt();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_faker_sideE();
            break;
        
        case (4 << 0):
            player_faker_down_aerial();
            break;
        
        case (5 << 0):
            player_faker_upE();
            break;
        
        case (6 << 0):
            player_faker_downE();
            break;
        
        case (7 << 0):
            player_faker_side_aerial();
            break;
        
        case (8 << 0):
            player_faker_up_aerial();
            break;
        
        case (9 << 0):
            player_faker_downspecial();
            break;
        
        case (10 << 0):
            player_faker_sidespecial();
            break;
        
        case (11 << 0):
            player_faker_up_special();
            break;
        
        case (12 << 0):
            player_faker_taunt();
            break;
        
        case (13 << 0):
            player_faker_downspecial_inv();
            break;
        
        case (14 << 0):
            player_faker_reform();
            break;
        
        case (18 << 0):
            player_intro_faker();
            break;
        
        case (16 << 0):
            player_faker_parry();
            break;
        
        case (15 << 0):
            player_faker_down_aerial_finish();
            break;
        
        case (17 << 0):
            player_faker_down_aerial_start();
            break;
        
        case (19 << 0):
            player_faker_dash_attack();
            break;
        
        case (20 << 0):
            player_faker_sidespecial_uncharged();
            break;
        
        case (21 << 0):
            player_stun();
            break;
        
        case (22 << 0):
            player_faker_sprint();
            break;
        
        case (23 << 0):
            player_faker_win();
            break;
        
        case (24 << 0):
            player_faker_draw();
            break;
        
        case (25 << 0):
            player_faker_super_start();
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
        case (18 << 0):
            player_intro_faker();
            break;
        
        case (0 << 0):
            player_fakepep_CPUwait();
            break;
        
        case (1 << 0):
            player_faker_CPUfollow();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_faker_sideE();
            break;
        
        case (4 << 0):
            player_faker_down_aerial();
            break;
        
        case (5 << 0):
            player_faker_upE();
            break;
        
        case (6 << 0):
            player_faker_downE();
            break;
        
        case (7 << 0):
            player_faker_side_aerial();
            break;
        
        case (8 << 0):
            player_faker_up_aerial();
            break;
        
        case (9 << 0):
            player_faker_downspecial();
            break;
        
        case (10 << 0):
            player_faker_sidespecial();
            break;
        
        case (11 << 0):
            player_faker_up_special();
            break;
        
        case (12 << 0):
            player_faker_taunt();
            break;
        
        case (13 << 0):
            player_fakepep_CPUrecover();
            break;
        
        case (14 << 0):
            player_faker_reform();
            break;
        
        case (16 << 0):
            player_faker_parry();
            break;
        
        case (15 << 0):
            player_faker_down_aerial_finish();
            break;
        
        case (17 << 0):
            player_faker_down_aerial_start();
            break;
        
        case (19 << 0):
            player_faker_dash_attack();
            break;
        
        case (20 << 0):
            player_faker_sidespecial_uncharged();
            break;
        
        case (21 << 0):
            player_stun();
            break;
        
        case (22 << 0):
            player_faker_CPUpath();
            break;
        
        case (23 << 0):
            player_faker_win();
            break;
        
        case (24 << 0):
            player_faker_draw();
            break;
        
        case (25 << 0):
            player_faker_super_start();
            break;
        
        case (69420 << 0):
            player_vigilante_captured();
            break;
    }
}
