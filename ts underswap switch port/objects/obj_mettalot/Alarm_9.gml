if (moveCounter++ < 120)
{
    obj_player.x += moveX;
    obj_player.y += moveY;
    handLX += moveX;
    handLY += moveY;
    handRX += moveX;
    handRY += moveY;
    alarm[9] = 1;
}
else
{
    hspeed = 0;
    lookDirection = 3;
    handAlpha = 0.9;
    alarm[7] = 1;
}
