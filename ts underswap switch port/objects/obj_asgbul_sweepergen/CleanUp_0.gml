for (var i = 0; i < ds_list_size(bullets); i++)
{
    var bullet = ds_list_find_value(bullets, i);
    
    with (bullet)
        instance_destroy();
}

ds_list_destroy(bullets);
