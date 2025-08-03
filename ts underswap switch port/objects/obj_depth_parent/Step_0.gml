if (_depthUpdate)
{
    if (sprite_index != _lastSpriteIndex)
    {
        _lastSpriteIndex = sprite_index;
        
        if (sprite_index == -1)
            _offsetY = 0;
        else
            _offsetY = sprite_height - sprite_yoffset;
    }
    
    if (is_undefined(_customOffsetY))
        depth = -(y + _offsetY);
    else
        depth = -(y + _customOffsetY);
}
