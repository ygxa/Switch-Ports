function player_kill()
{
    if (object_index != O_Pizzaface)
        instance_destroy();
    
    var _player = object_index;
    
    switch (_player)
    {
        case o_player_default:
            if (ObjGame.Player1live > 1)
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_pep_dead_fake))
                    fart = "player1";
            }
            else
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_pep_dead))
                    fart = "player1";
            }
            
            break;
        
        case o_player_default2:
            if (ObjGame.Player2live > 1)
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_pep_dead_fake))
                    fart = "player2";
            }
            else
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_pep_dead))
                    fart = "player2";
            }
            
            break;
        
        case o_player_noise:
            if (ObjGame.Player1live > 1)
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_noi_dead_fake))
                    fart = "player1";
            }
            else
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_noi_dead))
                    fart = "player1";
            }
            
            break;
        
        case o_player_noise2:
            if (ObjGame.Player2live > 1)
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_noi_dead_fake))
                    fart = "player2";
            }
            else
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_noi_dead))
                    fart = "player2";
            }
            
            break;
        
        case o_player_vigilante:
            if (ObjGame.Player1live > 1)
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_vigi_dead_fake))
                    fart = "player1";
            }
            else
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_vigi_dead))
                    fart = "player1";
            }
            
            break;
        
        case o_player_vigilante2:
            if (ObjGame.Player2live > 1)
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_vigi_dead_fake))
                    fart = "player2";
            }
            else
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_vigi_dead))
                    fart = "player2";
            }
            
            break;
        
        case o_player_fakepep:
            if (ObjGame.Player1live > 1)
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_fakepep_dead_fake))
                    fart = "player1";
            }
            else
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_fakepep_dead))
                    fart = "player1";
            }
            
            break;
        
        case o_player_fakepep2:
            if (ObjGame.Player2live > 1)
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_fakepep_dead_fake))
                    fart = "player2";
            }
            else
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_fakepep_dead))
                    fart = "player2";
            }
            
            break;
        
        case o_player_doise:
            if (ObjGame.Player1live > 1)
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_doi_dead_fake))
                    fart = "player1";
            }
            else
            {
                ObjGame.Player1live--;
                
                with (instance_create_layer(x, y, layer, o_player_doi_dead))
                    fart = "player1";
            }
            
            break;
        
        case o_player_doise2:
            if (ObjGame.Player2live > 1)
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_doi_dead_fake))
                    fart = "player2";
            }
            else
            {
                ObjGame.Player2live--;
                
                if (instance_exists(o_arcade_score_system))
                    global.CURRENTSCORE += 5;
                
                with (instance_create_layer(x, y, layer, o_player_doi_dead))
                    fart = "player2";
            }
            
            break;
        
        case O_Pizzaface:
            O_Pizzaface.state = (14 << 0);
            break;
    }
}
