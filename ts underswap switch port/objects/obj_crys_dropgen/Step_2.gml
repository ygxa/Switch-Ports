counter++;

if (counter == dripTime)
{
    if (consecutive < 3 && irandom(3) == 0)
    {
        consecutive++;
        var bul = instance_create_layer(x, y, layer, obj_ruins_drop);
        
        if (cosmetic)
        {
            with (bul)
            {
                depth = -300;
                damageAmount = other.damage;
            }
        }
    }
    else
    {
        consecutive = 0;
    }
    
    counter = 0;
}
