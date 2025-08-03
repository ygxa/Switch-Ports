if (file_exists(("file" + _string(global.save_variant))))
    room_goto(rm_load);
else
    room_goto(rm_menu_start);
