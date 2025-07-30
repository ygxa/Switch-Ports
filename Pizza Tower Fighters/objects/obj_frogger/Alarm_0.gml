array_push(console, "Started frogger");

for (var i = 0; i < array_length(sprites); i++)
{
    if (directory_exists(working_directory + "/frogger/Sprites"))
    {
        if (directory_exists(working_directory + "/frogger/Sprites/" + sprites[i]))
        {
            if (string_copy(sprite, 0, 5) != "s_pal")
            {
                ini_open(working_directory + "/frogger/Sprites/" + sprites[i] + "/info.frog");
                sprite_replace(i, working_directory + "/frogger/Sprites/" + sprites[i] + "/img.png", ini_read_real("info", "frames", 0), 0, 0, ini_read_real("info", "xorig", 0), ini_read_real("info", "yorig", 0));
                ini_close();
                array_push(console, "Replaced sprite " + sprites[i]);
            }
            else
            {
                game_end();
            }
        }
    }
}

alarm[1] = 15;
array_push(console, "Ended frogger");
