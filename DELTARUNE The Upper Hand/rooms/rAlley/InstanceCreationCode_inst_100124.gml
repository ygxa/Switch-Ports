func = function()
{
    do_text(undefined, undefined, ["* didn't you just say not to bring it back to my room?"], ["ow"], [sFontSans], undefined, [snd_txtSans], undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
};

ey = 10;

draw = function()
{
    ext(sProps2, 7, x + 20, y + ey, 2, 2);
};
