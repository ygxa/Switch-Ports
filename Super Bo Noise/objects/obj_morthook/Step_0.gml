var _found = 0;

with (obj_player1)
{
    if (state == 13 || state == 14 || state == 15 || state == 16)
        _found = 1;
}

if (_found)
    image_alpha = 1;
else
    image_alpha = 0.5;
