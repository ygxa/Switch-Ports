image_xscale = obj_player1.xscale;

if (obj_player1.state == 63)
{
    x = obj_player1.x;
    y = obj_player1.y;
}

if (obj_player1.state == 58)
{
    x = obj_player1.x + (-obj_player1.image_xscale * 20);
    y = obj_player1.y + 30;
}

if (obj_player1.state != 63 && obj_player1.state != 58)
    instance_destroy();

image_speed = 0.35;
