if (!instance_exists(ID) || (obj_player.state == 67 || obj_player.state == 112 || obj_player.state == 101 || obj_player.state == 98))
    exit;

event_inherited();
