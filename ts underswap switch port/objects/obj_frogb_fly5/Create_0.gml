event_inherited();

if (instance_exists(obj_froggit_jumper))
{
    if (x >= (obj_froggit_jumper.x - 8) && x <= (obj_froggit_jumper.x + obj_froggit_jumper.sprite_width + 8))
    {
        instance_destroy();
        exit;
    }
    
    instance_create_xy(x - 2, y - 2, obj_frogb_appear);
}

depth = -2;
vspeed = random_range(-6.25, -4.5);
hspeed = random_range(-1, 1);
gravity = 0.35;
gravity_direction = 270;
image_speed = 0.75;
