repeat (5)
{
    var s = irandom_range(0, sprite_last)
    if sprite_exists(s)
        array_push(slopArr, [s, (sprite_get_number(s) - 1), random_range(0, 960), random_range(0, 540)])
}
