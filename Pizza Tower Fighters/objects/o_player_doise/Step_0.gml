event_inherited();

if (instance_exists(o_youwon))
{
    ScrPlayer_StopSprintSound();
    sprintstartanim = true;
    sprint = false;
    
    if (instance_exists(O_Timer))
    {
        if (O_Timer.timermin == 0)
            state = (23 << 0);
        else
            state = (22 << 0);
    }
    else
    {
        state = (22 << 0);
    }
}

if (!instance_exists(O_Fade))
{
    switch (state)
    {
        case (0 << 0):
            player_doise_idle();
            break;
        
        case (1 << 0):
            player_hurt();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_doise_sideE();
            break;
        
        case (4 << 0):
            player_doise_down_aerial();
            break;
        
        case (5 << 0):
            player_doise_upE();
            break;
        
        case (6 << 0):
            player_doise_downE();
            break;
        
        case (7 << 0):
            player_doise_side_aerial();
            break;
        
        case (8 << 0):
            player_doise_up_aerial();
            break;
        
        case (9 << 0):
            player_doise_down_special();
            break;
        
        case (10 << 0):
            player_doise_side_special();
            break;
        
        case (11 << 0):
            player_doise_up_special();
            break;
        
        case (12 << 0):
            player_doise_taunt();
            break;
        
        case (13 << 0):
            player_intro_doise();
            break;
        
        case (14 << 0):
            player_doise_dash_attack();
            break;
        
        case (16 << 0):
            player_doise_parry();
            break;
        
        case (17 << 0):
            player_stun();
            break;
        
        case (18 << 0):
            player_noise_turn();
            break;
        
        case (19 << 0):
            player_doise_sprint();
            break;
        
        case (20 << 0):
            player_doise_down_aerial_start();
            break;
        
        case (21 << 0):
            player_doise_down_aerial_finish();
            break;
        
        case (22 << 0):
            player_noise_win();
            break;
        
        case (23 << 0):
            player_noise_draw();
            break;
        
        case (24 << 0):
            player_doise_fuckingdies();
            break;
        
        case (25 << 0):
            player_doise_super_start();
            break;
        
        case (26 << 0):
            player_doise_super_call();
            break;
        
        case (69420 << 0):
            player_vigilante_captured();
            break;
        
        case (30 << 0):
            player_cutscene_pizzafacedeath();
            break;
    }
}
