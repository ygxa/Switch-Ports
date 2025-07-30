if (player != 2)
{
    with (other)
    {
        projectilehit = 1;
        
        if (object_index != O_Pizzaface)
        {
            if (state != (2 << 0))
                player_hurt(10, 6, other.vsp, 3);
        }
        else
        {
            player_hurt(10, 6, other.vsp, 3);
        }
    }
    
    if (damagemeter != 0)
    {
        if (instance_exists(o_player_vigilante))
            o_player_vigilante.damagemeter += damagemeter;
        
        damagemeter = 0;
    }
    
    instance_destroy();
    
    with (instance_create_layer(x, y, layer, o_vigilante_bullet_dead))
        playuh = other.player;
}
