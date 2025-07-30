function Scr_Pause_Layout_killer()
{
    switch (currentlayout)
    {
        case 1:
            instance_deactivate_layer(layout4obj);
            layer_set_visible(layout3tile2, false);
            layer_set_visible(layout3tile1, false);
            instance_deactivate_layer(layout2obj);
            layer_set_visible(layout2tile2, false);
            layer_set_visible(layout2tile1, false);
            layer_set_visible(layout4tile2, false);
            layer_set_visible(layout4tile2, false);
            layer_set_visible(layout4tile1, false);
            instance_deactivate_layer(layout3obj);
            break;
        
        case 2:
            instance_deactivate_layer(layout4obj);
            layer_set_visible(layout3tile2, false);
            layer_set_visible(layout3tile1, false);
            instance_deactivate_layer(layout1obj);
            layer_set_visible(layout1tile2, false);
            layer_set_visible(layout1tile1, false);
            layer_set_visible(layout1tile3, false);
            layer_set_visible(layout4tile2, false);
            layer_set_visible(layout4tile1, false);
            instance_deactivate_layer(layout3obj);
            break;
        
        case 3:
            instance_deactivate_layer(layout4obj);
            layer_set_visible(layout1tile2, false);
            layer_set_visible(layout1tile1, false);
            instance_deactivate_layer(layout2obj);
            layer_set_visible(layout2tile2, false);
            layer_set_visible(layout2tile1, false);
            layer_set_visible(layout4tile2, false);
            layer_set_visible(layout4tile2, false);
            layer_set_visible(layout4tile1, false);
            instance_deactivate_layer(layout1obj);
            break;
        
        case 4:
            instance_deactivate_layer(layout3obj);
            layer_set_visible(layout1tile2, false);
            layer_set_visible(layout1tile1, false);
            instance_deactivate_layer(layout2obj);
            layer_set_visible(layout2tile2, false);
            layer_set_visible(layout2tile1, false);
            layer_set_visible(layout3tile2, false);
            layer_set_visible(layout3tile2, false);
            layer_set_visible(layout3tile1, false);
            instance_deactivate_layer(layout1obj);
            break;
    }
}
