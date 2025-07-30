scr_hatScript();
scr_playerreset();
global.levelname = "none";
obj_player.targetDoor = "A";
obj_player.targetRoom = 79;
audio_stop_all();
instance_create(x, y, obj_fadeout);
