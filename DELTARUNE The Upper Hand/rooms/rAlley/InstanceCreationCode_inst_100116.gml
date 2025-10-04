func = function()
{
    do_text(undefined, undefined, ["* ok."], ["ow"], [sFontSans], undefined, [snd_txtSans], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 0, x + 10, y + ey, 2, 2);
};
