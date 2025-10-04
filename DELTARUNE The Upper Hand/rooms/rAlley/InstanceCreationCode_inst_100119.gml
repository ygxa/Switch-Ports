func = function()
{
    do_text(undefined, undefined, ["YOU MOVED IT TWO INCHES! €€€€€€ £ MOVE IT TO YOUR ROOM!"], ["ow"], [sFontPapyrus], undefined, [snd_txtPap], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 3, x + 16, y + ey, 2, 2);
};
