var _actor = 0;

with (obj_player1)
{
    if (state == 148)
        _actor = 1;
}

if (_actor)
    exit;

with (other)
{
    if (input_check("up") && grounded && !instance_exists(obj_option) && (state == 2 || state == 105 || state == 106 || state == 60 || state == 123 || state == 101))
    {
        instance_create(x, y, obj_option);
        state = 148;
    }
}
