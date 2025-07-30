image_xscale = obj_player.xscale;

if (obj_player.state != 67 && obj_player.state != 98)
    instance_destroy();

if (obj_player.state != 98)
    x = obj_player.x + (16 * obj_player.xscale);
else if (obj_player.state == 98)
    x = obj_player.x + (32 * obj_player.xscale);

y = obj_player.y;
depth = obj_player.depth - 6;

if (obj_player.state == 29 || obj_player.sprite_index == spr_player_dive || (obj_player.state == 98 && obj_player.movespeed < 12))
    instance_destroy();
