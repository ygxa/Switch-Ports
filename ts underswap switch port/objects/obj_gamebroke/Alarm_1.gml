if (submode == 0 && currentLine >= 18)
{
    alarm[2] = 30;
    exit;
}
else if (submode == 1 && currentLine >= 6)
{
    exit;
}
else if (submode == 2 && currentLine >= 8)
{
    exit;
}

currentLine++;
currFade = 0;
alarm[0] = 1;
