if (doNotDamage)
    exit;

if (image_alpha > 0.2 && obj_player.y > (bbox_bottom - 20))
    event_inherited();
