event_inherited();
damageAmount = 5;
obj_madhouse.visible = false;
depth = -6200;

if (room == rm_star22_chase1)
{
    target = obj_player.y - 20;
}
else
{
    target = obj_player.x - 20;
    sprite_index = spr_madhouse_chase_up;
}

sfx_play(snd_speargrow);
alarm[0] = 20;
reappear = false;
