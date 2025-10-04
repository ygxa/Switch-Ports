res_i();
i = 20;
ey = 10;

draw = function()
{
    ext(sProps, 12, x + i, y + ey);
};

func = function()
{
    do_text(undefined, undefined, ["Well then"], ["ow"], undefined, undefined, undefined, undefined, undefined, [3], undefined, function()
    {
        oPlayer.move = true;
    });
};
