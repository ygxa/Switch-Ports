image_alpha -= 0.02;

if (image_alpha == 0)
{
    instance_destroy();
    
    with (instance_create_layer(0, 0, layer, o_peddito))
        target = other.target;
}
