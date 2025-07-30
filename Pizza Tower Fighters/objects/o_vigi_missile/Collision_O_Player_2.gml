if (player != 2)
{
    with (instance_create_layer(other.x, other.y, layer, o_player_vigi_super_explosion))
        playa = 1;
    
    instance_destroy();
    
    with (other)
    {
        projectilehit = 1;
        player_hurt(5, 2, other.timer, -5);
    }
}
