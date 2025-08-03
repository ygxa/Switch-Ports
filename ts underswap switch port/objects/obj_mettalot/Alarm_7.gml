if (handAlpha > 0)
{
    handAlpha -= 0.1;
    alarm[7] = 1;
}
else
{
    if (handLX == -1)
    {
        handLX = obj_player.x - 14;
        handLY = obj_player.y - 10;
        handRX = obj_player.x + 9;
        handRY = obj_player.y - 10;
        handLInd = 3;
        handRInd = 4;
    }
    else
    {
        handLX = -1;
        handLY = -1;
        handRX = -1;
        handRY = -1;
        handLInd = 0;
        handRInd = 0;
        obj_player.lookDirection = 2;
        sfx_play(snd_click);
    }
    
    handAlpha = 0.1;
    alarm[8] = 1;
}
