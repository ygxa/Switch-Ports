depth = 10;
direction = random(360);
speed = random(3);
friction = 0.2;
image_speed = random_range(0.7, 1.2);

with (obj_bugerpant)
{
    other.x = x + irandom(sprite_width);
    other.y = y + irandom(sprite_height - 8);
}
