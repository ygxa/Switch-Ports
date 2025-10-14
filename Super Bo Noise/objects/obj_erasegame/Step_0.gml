if (!instance_exists(obj_keyconfig))
{
    if (((-input_check_pressed("left")) || keyboard_check_pressed(vk_left)) && optionselected > 0)
        optionselected -= 1
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && optionselected < 1)
        optionselected += 1
}
if (optionselected == 1 && (input_check_pressed("jump") || keyboard_check_pressed(vk_return)))
{
    file_delete("saveData.ini")
    ini_open("saveData.ini")
    if (!ini_section_exists("SAGE2019"))
    {
        ini_write_string("SAGE2019", "shotgunsnick", 0)
        ini_write_string("SAGE2019", "dungeonbackup", 0)
        ini_write_string("SAGE2019", "srank", 0)
        ini_write_string("SAGE2019", "snicksrank", 0)
        ini_write_string("SAGE2019", "combo10", 0)
        ini_write_string("SAGE2019", "secret", 0)
        ini_write_string("SAGE2019", "knight", 0)
        ini_write_string("SAGE2019", "toppin", 0)
        ini_write_string("SAGE2019", "treasure", 0)
        fixed_ini_close()
    }
    global.SAGEshotgunsnick = 0
    global.SAGEshotgunsnicknumber = 0
    global.SAGEdungeonbackup = 0
    global.SAGEsrank = 0
    global.SAGEsnicksrank = 0
    global.SAGEcombo10 = 0
    global.SAGEsecret = 0
    global.SAGEknight = 0
    global.SAGEknighttaken = 0
    global.SAGEtoppin = 0
    global.SAGEtreasure = 0
    with (obj_SAGE2019achievementmarker)
    {
        snickshotgun = 0
        dungeonbackup = 0
        srank = 0
        snicksrank = 0
        combo10 = 0
        secret = 0
        knight = 0
        toppin = 0
        treasure = 0
    }
    obj_mainmenuselect.selected = 0
    instance_destroy()
}
if (input_check_pressed("slap") || keyboard_check_pressed(vk_escape) || (optionselected == 0 && (input_check_pressed("jump") || keyboard_check_pressed(vk_return))))
{
    obj_mainmenuselect.selected = 0
    instance_destroy()
}
