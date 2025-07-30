switch (phase)
{
    case 1:
        if (targetA == 0 && (o_player_default.key_left || o_player_default.key_right) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (targetB == 0 && audio_is_playing(su_test_jump) && !instance_exists(O_Text))
        {
            targetB = 1;
            audio_play_sound(su_tutorial_write, 50, false);
            target--;
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 2:
        if (targetA == 0 && o_player_default.sprint && timerobjective != 0 && !instance_exists(O_Text))
        {
            timerobjective--;
            
            if (timerobjective == 0)
            {
                targetA = 1;
                target--;
                audio_play_sound(su_tutorial_write, 50, false);
            }
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 3:
        if (targetA == 0 && o_player_default.crouch && timerobjective != 0 && !instance_exists(O_Text))
        {
            timerobjective--;
            
            if (timerobjective == 0)
            {
                targetA = 1;
                audio_play_sound(su_tutorial_write, 50, false);
                target--;
            }
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 4:
        if (targetA == 0 && o_player_default.state == (5 << 0) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (targetB == 0 && o_player_default.state == (3 << 0) && !instance_exists(O_Text))
        {
            targetB = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (targetC == 0 && o_player_default.state == (6 << 0) && !instance_exists(O_Text))
        {
            targetC = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 5:
        if (targetA == 0 && o_player_default.state == (8 << 0) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (targetB == 0 && o_player_default.state == (7 << 0) && !instance_exists(O_Text))
        {
            targetB = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (targetC == 0 && o_player_default.state == (4 << 0) && !instance_exists(O_Text))
        {
            targetC = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 6:
        if (targetA == 0 && o_player_default.state == (14 << 0) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 7:
        if (targetA == 0 && o_player_default.state == (11 << 0) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (targetB == 0 && o_player_default.state == (10 << 0) && !instance_exists(O_Text))
        {
            targetB = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (targetC == 0 && o_player_default.state == (18 << 0) && !instance_exists(O_Text))
        {
            targetC = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 8:
        if (targetA == 0 && o_cheeseslime.combo == 5 && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 9:
        if (targetA == 0 && o_player_default.state == (12 << 0) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 10:
        if (targetA == 0 && o_player_default.state == (16 << 0) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 11:
        if (o_player_default.damagemeter == 0)
            o_player_default.damagemeter = o_player_default.damagemetermax;
        
        if (targetA == 0 && o_player_default.state == (26 << 0) && !instance_exists(O_Text))
        {
            targetA = 1;
            target--;
            audio_play_sound(su_tutorial_write, 50, false);
        }
        
        if (target == 0)
        {
            if (timertillnext != 0)
                timertillnext--;
            
            if (timertillnext == 0)
                phase++;
        }
        
        break;
    
    case 12:
        if (targetA == 0 && !instance_exists(O_Text))
        {
            global.player1 = 0;
            global.player2 = 0;
            fadeToRoom(R_Menu, 30, 0);
            audio_stop_sound(mu_tutorial);
        }
        
        break;
}

if (target == 0 && timertillnext == 0)
{
    Scr_Tutorial_Messages();
    o_player_default.state = (0 << 0);
}
