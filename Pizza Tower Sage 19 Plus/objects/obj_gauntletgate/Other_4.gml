save_open();
var _startingpos = (4 * (world - 1)) + (world - 1);

for (var i = _startingpos; i < (_startingpos + 4); i++)
{
    if (!ini_read_real("Treasures", global.levels[i], false))
    {
        metrequirement = false;
        break;
    }
}

if (ini_read_real("GameProgress", string_concat(level, "unlocked"), false))
{
    create_func(true);
    instance_destroy();
}

save_close();
