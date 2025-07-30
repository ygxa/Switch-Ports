with (obj_towerarcadeicon)
{
    if (num <= other.diff)
    {
        instance_destroy();
        
        with (instance_create_depth(x, y, depth, obj_noncollideablephysicsobject))
        {
            image_xscale = other.image_xscale;
            sprite_index = other.sprite_index;
            image_index = other.image_index;
            vsp = irandom_range(-7, -6);
            hsp = 6 * image_xscale;
        }
    }
}
