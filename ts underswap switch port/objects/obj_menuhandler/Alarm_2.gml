var pos = music_get_pos();
music_kill_current();
music_lcplay(menuVariant, true);
music_gain(0, 0);
music_gain(1, 500);
music_set_pos(pos);
