if (state != 149 && state != 86)
    exit;

with (other)
{
    var _maxhsp = abs(spd);
    var _dir = sign(spd);
    
    if (x != other.x)
        _dir = sign(x - other.x);
    
    spd = _maxhsp * _dir;
}

if (state != 149)
{
    sprite_index = parryspr;
    movespeed = 8;
    state = 149;
    image_index = 0;
}
