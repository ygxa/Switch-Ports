if (sprite_index == spr_gustavo_showpizza)
{
    if (image_index > (image_number - 1))
        image_index = image_number - 1
}
if (sprite_index == spr_gustavo_givepizza)
{
    if (image_index > (image_number - 1))
    {
        image_index = 0
        sprite_index = spr_gustavo_point
    }
}
if (state == (2 << 0))
{
    var player = instance_nearest(x, y, obj_player1)
    if (player.x != x)
        image_xscale = (-(sign(x - player.x)))
}
scr_collide()
