if (handAlpha < 1)
{
    handAlpha += 0.1;
    alarm[8] = 1;
}
else if (handLX == -1)
{
    scene_resume();
}
else
{
    moveX = (564 - obj_player.x) / 120;
    moveY = (444 - obj_player.y) / 120;
    moveCounter = 0;
    hspeed = -0.16666666666666666;
    alarm[9] = 1;
}
