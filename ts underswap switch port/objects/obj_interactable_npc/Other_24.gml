if (disableInteract)
    exit;

global.currentnpc = id;
direction = point_direction((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + sprite_height, obj_player.x, (obj_player.y - obj_player.sprite_yoffset) + obj_player.sprite_height);
lookDirection = direction_calculate();
