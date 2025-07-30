function ScrPlayer_StopSprintSound()
{
    switch (object_index)
    {
        case o_player_default:
        case o_player_default2:
            if (global.player1 == global.player2 && instance_exists(o_player_default) && instance_exists(o_player_default2))
            {
                if (o_player_default.state != (20 << 0) && o_player_default2.state != (20 << 0))
                    audio_stop_sound(su_pep_dash);
            }
            else
            {
                audio_stop_sound(su_pep_dash);
            }
            
            break;
        
        case o_player_noise:
        case o_player_noise2:
            if (global.player1 == global.player2 && (instance_exists(o_player_noise) && instance_exists(o_player_noise2)))
            {
                if (o_player_noise.state != (19 << 0) && o_player_noise2.state != (19 << 0))
                    audio_stop_sound(su_noise_dash);
            }
            else
            {
                audio_stop_sound(su_noise_dash);
            }
            
            break;
        
        case o_player_vigilante:
        case o_player_vigilante2:
            if (global.player1 == global.player2 && instance_exists(o_player_vigilante) && instance_exists(o_player_vigilante2))
            {
                if (o_player_vigilante.state != (18 << 0) && o_player_vigilante2.state != (18 << 0))
                    audio_stop_sound(su_vigi_dash);
            }
            else
            {
                audio_stop_sound(su_vigi_dash);
            }
            
            break;
        
        case o_player_fakepep:
        case o_player_fakepep2:
            if (global.player1 == global.player2 && instance_exists(o_player_fakepep) && instance_exists(o_player_fakepep2))
            {
                if (o_player_fakepep.state != (22 << 0) && o_player_fakepep2.state != (22 << 0))
                    audio_stop_sound(su_fakepep_mach);
            }
            else
            {
                audio_stop_sound(su_fakepep_mach);
            }
            
            break;
        
        case o_player_doise:
        case o_player_doise2:
            if (global.player1 == global.player2 && instance_exists(o_player_doise) && instance_exists(o_player_doise2))
            {
                if (o_player_doise.state != (19 << 0) && o_player_doise2.state != (19 << 0))
                    audio_stop_sound(su_doise_dash);
            }
            else
            {
                audio_stop_sound(su_doise_dash);
            }
            
            break;
    }
}
