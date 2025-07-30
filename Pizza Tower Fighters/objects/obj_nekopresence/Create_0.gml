ready = false;
userid = 0;
index = 0;
alarm[0] = room_speed * 5;
image_speed = 0.35;
depth = -200;

if (!np_initdiscord("1230948654077054986", true, "0"))
    show_debug_message("NekoPresence init fail.");
