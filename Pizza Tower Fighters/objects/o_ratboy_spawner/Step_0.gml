timer--;

if (timer == 0)
{
    timer = irandom_range(300, 600);
    
    if (!instance_exists(o_ratboy))
        instance_create_layer(x, y + irandom_range(100, -100), layer, o_ratboy);
    
    randomize();
}
