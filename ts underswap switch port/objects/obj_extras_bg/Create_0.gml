depth = 0;
benchFrame = 0;
hasFile = file_exists(_string("file{0}", global.save_variant));

if (hasFile)
    armor = items_get_armor();
else
    armor = -1;
