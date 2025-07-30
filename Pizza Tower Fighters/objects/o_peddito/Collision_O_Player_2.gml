if (other.object_index != o_player_doise2)
{
    with (other)
    {
        if (blastdamaged == 0)
        {
            player_hurt(15, 5, other.facing, 3);
            blastdamaged = 1;
        }
    }
}
else
{
    with (other)
        player_hurt(999, 3, facing, 3);
    
    instance_destroy();
    audio_play_sound(su_doise_death, 50, false);
    
    with (instance_create_layer(x, y, "part", o_fireflameffect))
        sprite_index = s_poofeffect;
}
