var _discbuff = buffer_load(working_directory + "Data/disclaimer.txt");
discstr = buffer_read(_discbuff, buffer_string);
buffer_delete(_discbuff);
discanim = 0;
discspin = 0;
discsquash = false;
event_play_oneshot("event:/sfx/misc/disclamerspin");
