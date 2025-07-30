function ScrParry_Projectile()
{
    if (place_meeting(x, y, o_noise_bomb))
    {
        instance_destroy(o_noise_bomb);
        instance_create_layer(x, y, layer, o_player_noise_explosion);
    }
}
