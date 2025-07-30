if (room == rm_blank)
    exit;

if (obj_player1.state == 49 || (obj_player1.state == 63 && (obj_player1.tauntstoredstate == 49 || obj_player1.tauntstoredstate == 40)) || obj_player1.state == 50 || obj_player1.state == 40 || obj_player1.state == 51)
    sprite_index = spr_swordstonetaken;
else
    sprite_index = spr_swordstone;

if (sprite_index == spr_swordstone && !instance_exists(ID))
{
    with (instance_create(x, y - 20, obj_grabmarker))
        other.ID = id;
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
{
    instance_destroy(ID);
}
