function player_vigilante_captured()
{
    moveSpeed += 0.2;
    inv = true;
    
    if (moveSpeed > 0)
        moveSpeed += 0.4;
    
    var dir = point_direction(x, y, o_secreteye.x, o_secreteye.y);
    x += lengthdir_x(moveSpeed, dir);
    y += lengthdir_y(moveSpeed, dir);
    
    if (place_meeting(x, y, o_secreteye))
    {
        var eye = instance_place(x, y, o_secreteye);
        
        if (eye.state != (4 << 0))
        {
            eye.captured = true;
            visible = false;
        }
    }
    
    switch (object_index)
    {
        case o_player_default2:
        case o_player_default:
            if (moveSpeed > 0)
                sprite_index = s_test_dead;
            else
                sprite_index = s_test_stun;
            
            break;
        
        case o_player_vigilante2:
        case o_player_vigilante:
            if (moveSpeed > 0)
                sprite_index = s_vigilante_hurt;
            else
                sprite_index = s_vigilante_stunned;
            
            break;
        
        case o_player_noise2:
        case o_player_noise:
            if (moveSpeed > 0)
                sprite_index = s_noise_Dead;
            else
                sprite_index = s_noise_stun;
            
            break;
        
        case o_player_fakepep2:
        case o_player_fakepep:
            if (moveSpeed > 0)
                sprite_index = s_fakepep_hurt;
            else
                sprite_index = s_fakepep_stun;
            
            break;
        
        case o_player_doise2:
        case o_player_doise:
            if (moveSpeed > 0)
                sprite_index = s_noise_Dead;
            else
                sprite_index = s_noise_stun;
            
            break;
    }
}
