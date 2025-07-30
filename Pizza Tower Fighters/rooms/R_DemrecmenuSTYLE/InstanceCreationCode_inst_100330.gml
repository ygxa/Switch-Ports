name = "Exit with saving";

stepfunc = function()
{
    if (selected)
    {
        ini_open("Options.ini");
        ini_write_real("Demrec", "style1", global.buttonrgb1);
        ini_write_real("Demrec", "style2", global.buttonrgb2);
        ini_write_real("Demrec", "style3", global.buttonrgb3);
        ini_close();
        room_goto(R_Demrecmenu);
    }
};
