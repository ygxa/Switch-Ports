event_inherited()
dialog[0] = dialog_create("piracy is a crime you know")
dialog[1] = dialog_create("getting games is illegel")
dialog[2] = dialog_create("bitch.", -4, function() //anon@171@gml_Object_obj_grapeNPC_Create_0
{
    if (global.peppermancutscene1 == -4 || (!global.peppermancutscene1))
    {
        global.peppermancutscene1 = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman1", 1)
    }
    return;
}
)
