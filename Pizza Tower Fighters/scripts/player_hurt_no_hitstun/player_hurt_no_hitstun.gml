function player_hurt_no_hitstun()
{
    var _damage = argument0;
    var _player = object_index;
    hp -= _damage;
    randomize();
    
    if (hp > 0)
    {
        audio_play_sound(su_hit, 50, false);
        hitstun = 1;
        pause = 3;
        flash = 3;
        
        if (object_index == o_player_default || object_index == o_player_default2)
        {
            state = (2 << 0);
            sprite_index = s_test_hurt;
        }
        
        if (object_index == o_player_noise || object_index == o_player_noise2)
        {
            state = (2 << 0);
            sprite_index = s_noise_hurt;
        }
        
        if (object_index == o_player_vigilante || object_index == o_player_vigilante2)
        {
            state = (2 << 0);
            sprite_index = s_vigilante_hurt;
        }
        
        if (object_index == o_player_fakepep || object_index == o_player_fakepep2)
        {
            state = (2 << 0);
            sprite_index = s_fakepep_hurt;
        }
        
        if (object_index == o_trainingdummy)
        {
            state = (2 << 0);
            damagedealt = _damage;
            combo++;
            combotimer = 60;
            sprite_index = s_pizzaboy;
        }
    }
    else
    {
        player_kill();
    }
}
