if (playerhit > 0)
    playerhit -= 1;

if (floor(image_index) == 5 && created == false)
{
    if (facing == 1)
    {
        with (instance_create_layer(x + 60, y, layer, o_player_noise_shockwave))
        {
            player = other.player;
            facing = other.facing;
            amountleft = other.amountleft--;
        }
    }
    else
    {
        with (instance_create_layer(x - 60, y, layer, o_player_noise_shockwave))
        {
            player = other.player;
            facing = other.facing;
            amountleft = other.amountleft--;
        }
    }
    
    created = true;
}
