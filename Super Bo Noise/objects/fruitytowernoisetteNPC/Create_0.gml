event_inherited()
dialog[0] = dialog_create("fruity mid is a game and exists")
dialog[1] = dialog_create("it will be releasing after you solve this ARG")
dialog[2] = dialog_create("bitch.", -4, function() //anon@197@gml_Object_fruitytowernoisetteNPC_Create_0
{
    if (global.peppermancutscene1 == -4 || (!global.peppermancutscene1))
    {
        global.peppermancutscene1 = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman1", 1)
    }
    return;
}
)
