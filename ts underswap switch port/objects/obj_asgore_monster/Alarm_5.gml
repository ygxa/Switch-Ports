if (wantShakeCmd)
{
    xCorrectOverride = true;
    x = initX + (shakeCmdAmount * irandom(1));
    y = initY + (shakeCmdAmount * irandom(1));
    alarm[5] = 1;
}
