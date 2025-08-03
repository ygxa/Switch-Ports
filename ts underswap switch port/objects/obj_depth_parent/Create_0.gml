_lastSpriteIndex = sprite_index;

if (sprite_index == -1)
    _offsetY = 0;
else
    _offsetY = sprite_height - sprite_yoffset;

_customOffsetY = undefined;
_depthUpdate = false;
depth = -(y + _offsetY);
