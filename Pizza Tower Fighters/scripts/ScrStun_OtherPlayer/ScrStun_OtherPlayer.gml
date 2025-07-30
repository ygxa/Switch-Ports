function ScrStun_OtherPlayer()
{
    var _stun = argument0;
    var _player = object_get_parent(object_index);
    
    if (instance_exists(_player))
    {
        if (_player == O_Player_1)
        {
            if (instance_exists(O_Player_2))
            {
                switch (global.player2)
                {
                    case "PS":
                        o_player_default2.stun = _stun;
                        o_player_default2.state = (17 << 0);
                        break;
                    
                    case "NO":
                        o_player_noise2.stun = _stun;
                        o_player_noise2.state = (17 << 0);
                        break;
                    
                    case "TV":
                        o_player_vigilante2.stun = _stun;
                        o_player_vigilante2.state = (15 << 0);
                        break;
                    
                    case "FP":
                        o_player_fakepep2.stun = _stun;
                        o_player_fakepep2.state = (21 << 0);
                        break;
                    
                    case "DO":
                        o_player_doise2.stun = _stun;
                        o_player_doise2.state = (17 << 0);
                        break;
                }
            }
        }
        
        if (_player == O_Player_2)
        {
            if (instance_exists(O_Player_1))
            {
                switch (global.player1)
                {
                    case "PS":
                        o_player_default.stun = _stun;
                        o_player_default.state = (17 << 0);
                        break;
                    
                    case "NO":
                        o_player_noise.stun = _stun;
                        o_player_noise.state = (17 << 0);
                        break;
                    
                    case "TV":
                        o_player_vigilante.stun = _stun;
                        o_player_vigilante.state = (15 << 0);
                        break;
                    
                    case "FP":
                        o_player_fakepep.stun = _stun;
                        o_player_fakepep.state = (21 << 0);
                        break;
                    
                    case "DO":
                        o_player_doise.stun = _stun;
                        o_player_doise.state = (17 << 0);
                        break;
                }
            }
        }
    }
}
