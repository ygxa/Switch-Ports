event_inherited();

canCollide = function(argument0 = obj_player)
{
    switch (argument0)
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            with (argument0)
            {
                var _state = (state == 86 || state == 63) ? tauntstoredstate : state;
                return _state == 188 || _state == 212 || _state == 211 || _state == 123 || _state == 149 || sprite_index == spr_mach3boost;
            }
            
            break;
        
        default:
            return false;
            break;
    }
    
    return false;
};
