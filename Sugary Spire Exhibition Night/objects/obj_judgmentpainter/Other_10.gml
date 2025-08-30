textletter = 0
if ((dialogCurrent + 1) < array_length(dialogEvents))
{
    chatty = true;
    dialogCurrent++;
}
else
{
    chatty = false;
    progression = 2;
}
