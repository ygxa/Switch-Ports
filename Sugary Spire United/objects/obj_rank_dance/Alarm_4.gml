/// @description Leave To Hub
scr_hatScript();
scr_levelSet();
global.levelname = "none";
obj_player.targetDoor = "A";
obj_player.targetRoom = hub_w1;
audio_stop_all();
instance_create(x, y, obj_fadeout);
alarm[0] = -1
alarm[1] = -1
alarm[2] = -1
alarm[3] = -1
alarm[5] = -1
