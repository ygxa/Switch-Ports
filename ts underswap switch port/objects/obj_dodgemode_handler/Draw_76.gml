if (everyLayer)
{
    var layers = layer_get_all();
    
    for (var i = 0; i < array_length(layers); i++)
    {
        var curr = layers[i];
        
        if (layer_get_depth(curr) < -2000)
            continue;
        
        var name = layer_get_name(curr);
        
        if (name == "Instances")
            continue;
        
        if (string_starts_with(name, "Outline"))
            continue;
        
        layer_script_begin(curr, dodgeroom_predraw);
        layer_script_end(curr, shader_postdraw);
    }
}
