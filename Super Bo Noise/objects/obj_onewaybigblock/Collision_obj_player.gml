if (other.state != 139 && other.state != 63 && other.state != 188)
{
    var _col = collision_line(x + (35 * image_xscale), y + (16 * image_yscale), other.x, other.y, obj_solid, false, true);
    
    if (_col == -4)
        instance_destroy();
}
