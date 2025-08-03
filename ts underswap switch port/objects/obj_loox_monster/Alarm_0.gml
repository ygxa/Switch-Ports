if (!isActive || spared)
    exit;

if (!visible)
{
    alarm[0] = 1;
    exit;
}

if (sprite_index == spr_loox && vstare != 1)
{
    sprite_index = spr_looxblink;
    image_speed = 0.25;
}

alarm[0] = 240;
