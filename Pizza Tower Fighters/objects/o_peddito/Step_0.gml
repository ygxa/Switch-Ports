if (instance_exists(target))
    direction = point_direction(x, y, target.x, target.y);

hsp = lengthdir_x(float_by, direction);
vsp = lengthdir_y(float_by, direction);
x += hsp;
y += vsp;

if (hsp != 0)
    image_xscale = sign(hsp);

facing = sign(hsp);
timertilldeath--;

if (timertilldeath == 0 || (!instance_exists(target) || instance_exists(o_youwon)))
{
    instance_destroy();
    instance_create_layer(x, y, layer, o_player_doise_explosion);
    
    with (instance_create_layer(x, y, "part", o_fireflameffect))
        sprite_index = s_poofeffect;
}
