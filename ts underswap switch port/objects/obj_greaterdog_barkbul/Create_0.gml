event_inherited();
depth = -3;
sprite_index = lang_get_sprite(spr_greaterdog_barkbul);
image_speed = 0;
image_index = irandom(image_number - 1);
direction = point_direction(x, y, obj_battleheart.x, obj_battleheart.y) + random_range(-5, 5);
speed = 4.5;
image_alpha = 0.4;
fade = false;
alarm[0] = 45;

with (obj_dogwell_bul)
{
    if (asleep)
        other.speed = 3;
}
