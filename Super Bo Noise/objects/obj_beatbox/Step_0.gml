if (obj_player1.sprite_index != spr_player_breakdance && obj_player1.sprite_index != spr_playerN_breakdance)
{
    instance_create(x, y, obj_genericpoofeffect)
    instance_destroy()
}
scr_collide()
