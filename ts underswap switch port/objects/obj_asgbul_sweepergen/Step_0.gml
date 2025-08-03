siner++;

if (orbiting)
{
    for (var i = 0; i < ds_list_size(bullets); i++)
    {
        var bullet = ds_list_find_value(bullets, i);
        var theta = point_direction(x, y, bullet.x, bullet.y);
        var radius = point_distance(x, y, bullet.x, bullet.y);
        theta += (orbitSpeed + (radius / (40 * wavesGenerated)));
        bullet.x = x + lengthdir_x(radius, theta);
        bullet.y = y + lengthdir_y(radius, theta);
    }
}

orbitSpeed += (orbitAccel * orbitMult);
