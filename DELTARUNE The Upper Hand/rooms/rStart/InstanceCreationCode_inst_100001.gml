res_i();
i1 = false;
i2 = 0;

if (file_exists("save1"))
    i2 = 1;

if (i2 == 0)
{
    funcStep = function()
    {
        if (KeyZ || KeyX || KeyC)
            i1 = true;
        
        if (i1)
        {
            i++;
            
            if (i == 60)
                room_goto(rMainMenu);
        }
    };
    
    funcDraw = function()
    {
        res_j();
        j1 = g_t("start_text");
        j2 = 201;
        j3 = 180;
        text = "";
        
        if (!i1)
        {
            print(j1[0], 320, j2 - 150, undefined, undefined, ["mid"]);
            text = j1[1] + j1[2];
            
            if (op.gamepad != 0)
                text = op.gp6 + j1[2];
            
            print(text, j3, j2 - 90, undefined, 8421504);
            text = j1[3] + j1[4];
            
            if (op.gamepad != 0)
                text = op.gp1 + j1[4];
            
            print(text, j3, j2 - 60, undefined, 8421504);
            text = j1[5] + j1[6];
            
            if (op.gamepad != 0)
                text = op.gp3 + j1[6];
            
            print(text, j3, j2 - 30, undefined, 8421504);
            text = j1[7] + j1[8];
            
            if (op.gamepad != 0)
                text = op.gp5 + j1[8];
            
            print(text, j3, j2, undefined, 8421504);
            text = j1[9] + j1[10];
            print(text, j3, j2 + 60, undefined, 8421504);
            text = j1[11] + j1[12];
            print(text, j3, j2 + 90, undefined, 8421504);
            print(j1[13], 320, j2 + 150, undefined, undefined, ["mid"]);
            ext(sControler, 0, 320, j2 + 220);
        }
    };
}
else
{
    funcStep = function()
    {
        i++;
        
        if (i == 10)
            room_goto(rMainMenu);
    };
}
