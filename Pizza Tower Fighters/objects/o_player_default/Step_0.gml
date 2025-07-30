event_inherited();

if (!instance_exists(O_Fade))
{
    switch (state)
    {
        case (0 << 0):
            player_test_idle();
            break;
        
        case (1 << 0):
            player_hurt();
            break;
        
        case (2 << 0):
            CavemanState_Hitstun();
            break;
        
        case (3 << 0):
            player_test_sideE();
            break;
        
        case (4 << 0):
            player_test_down_aerial();
            break;
        
        case (5 << 0):
            player_test_upE();
            break;
        
        case (6 << 0):
            player_test_downE();
            break;
        
        case (7 << 0):
            player_test_side_aerial_old();
            break;
        
        case (8 << 0):
            player_test_up_aerial();
            break;
        
        case (9 << 0):
            player_test_down_special();
            break;
        
        case (10 << 0):
            player_test_side_special();
            break;
        
        case (11 << 0):
            player_test_up_special();
            break;
        
        case (12 << 0):
            player_test_taunt();
            break;
        
        case (15 << 0):
            player_intro_pep();
            break;
        
        case (14 << 0):
            player_test_dash_attack();
            break;
        
        case (16 << 0):
            player_test_parry();
            break;
        
        case (17 << 0):
            player_stun();
            break;
        
        case (18 << 0):
            player_test_down_special_start();
            break;
        
        case (19 << 0):
            player_test_turn();
            break;
        
        case (20 << 0):
            player_test_sprint();
            break;
        
        case (21 << 0):
            player_test_win();
            break;
        
        case (22 << 0):
            player_test_draw();
            break;
        
        case (23 << 0):
            player_test_super_start();
            break;
        
        case (24 << 0):
            player_test_super_attempt();
            break;
        
        case (25 << 0):
            player_test_super_pummel();
            break;
        
        case (26 << 0):
            player_test_super_goaway();
            break;
        
        case (69420 << 0):
            player_vigilante_captured();
            break;
        
        case (29 << 0):
            player_test_landinglag_aerial();
            break;
        
        case (30 << 0):
            player_cutscene_pizzafacedeath();
            break;
    }
}
