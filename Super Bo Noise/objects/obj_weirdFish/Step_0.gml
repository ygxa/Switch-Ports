var _idlespr = spr_weirdfishidle
var chillStates = [(271 << 0), (272 << 0), (273 << 0), (270 << 0)]
if global.panic
    _idlespr = (global.lap ? spr_weirdfishlap : spr_weirdfishescape)
else if array_contains(chillStates, obj_player1.state)
    _idlespr = spr_weirdfish_chill
if (sprite_index == spr_weirdfishidle || sprite_index == _idlespr)
{
    if (sprite_index != _idlespr)
        sprite_index = _idlespr
    playerID = noone
    return;
}
if instance_exists(playerID)
{
    with (playerID)
    {
        x = other.x
        y = other.y
        hsp = 0
        vsp = 0
        movespeed = 0
        state = (273 << 0)
    }
}
if animation_end()
{
    sprite_index = _idlespr
    with (playerID)
    {
        x = other.x
        y = other.y
        var _ledge = slope_check_up(x, y, 16)
        if (_ledge > 0)
            y -= _ledge
        movespeed = 8
        vsp = -8
        state = (273 << 0)
    }
}
