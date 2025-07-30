canCollide = function(argument0 = obj_player)
{
    switch (argument0)
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            var _state = (argument0.state == 86 || argument0.state == 63) ? argument0.tauntstoredstate : argument0.state;
            return _state != 95;
            break;
        
        default:
            return true;
            break;
    }
};

fall = 0;
fallmax = 30;
fallbuffer = fallmax;
hsp = 0;
vsp = 0;
grav = 0.5;
