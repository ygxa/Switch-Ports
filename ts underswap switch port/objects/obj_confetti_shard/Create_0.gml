depth = -10020;
image_speed = 0.25;
direction = random(360);
speed = 5;
gravity_direction = 270;
gravity = 0.2;
destroyOnContact = false;
image_blend = make_color_rgb(choose(0, 255), choose(0, 255), choose(0, 255));

if (image_blend == c_black)
    image_blend = c_red;

freeze = function()
{
    image_speed = 0;
    speed = 0;
    gravity = 0;
};

reverse = function()
{
    image_speed = 0.25;
    speed = 6;
    direction = point_direction(x, y, obj_dateheart.x, obj_dateheart.y);
    gravity_direction = direction;
    gravity = 0.2;
    destroyOnContact = true;
};
