event_inherited();
image_speed = 0;
shootTimer = irandom(40);

if (room == rm_crys_start_save)
    throwFreq = 40;
else if (room == rm_crys_premines)
    throwFreq = 45 + irandom(3);
else
    throwFreq = 60 + irandom(3);

damageAmount = 999;
lastImageFrame = 0;
depth = -(y + sprite_height);
