if down
{
    var ty = 24
    y = approach(y, ty, movespeed)
    if (y >= ty && alarm[0] == -1)
        alarm[0] = 80
}
else
{
    ty = (-sprite_height)
    y = approach(y, ty, movespeed)
    if (y <= ty)
        instance_destroy()
}
x = 480
