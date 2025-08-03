warning = false;

if (wavesGenerated == 0)
{
    with (bt_bullet_attack(obj_asgbul_generic, damageAmount, x, y))
    {
        doIDie = false;
        sprite_index = spr_asgbul_fire_small_centered;
        ds_list_add(other.bullets, id);
    }
}
else
{
    with (bt_bullet_attack(obj_asgbul_generic_inbox, damageAmount, x - (13 * wavesGenerated), y))
    {
        doIDie = false;
        sprite_index = spr_asgbul_fire_small_centered;
        ds_list_add(other.bullets, id);
    }
    
    with (bt_bullet_attack(obj_asgbul_generic_inbox, damageAmount, x + (13 * wavesGenerated), y))
    {
        doIDie = false;
        sprite_index = spr_asgbul_fire_small_centered;
        ds_list_add(other.bullets, id);
    }
}

sfx_play(snd_click, 80, false);
wavesGenerated++;

if (wavesGenerated < 8)
    alarm[0] = 3;
else
    alarm[1] = 15;
