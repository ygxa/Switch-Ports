draw = function()
{
};

func = function()
{
    do_text(undefined, undefined, ["* Well,€€€€€€ there is a man here.", "* Or,€€€€€€ there might in fact€€€€€€ NOT,€€€€€€ be a man here.", "* Do you think someone is here?"], ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
    {
        make_prompt(undefined, [function()
        {
            do_text(undefined, undefined, ["* You got the Egg."], ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
            {
                oPlayer.move = true;
            });
        }, function()
        {
            oPlayer.move = true;
        }]);
    });
};
