event_inherited();
image_speed = 0;
image_index = 0;
lookDirection = 1;
defaultDirection = lookDirection;

if (sprite_index != -1)
    spriteDown = sprite_index;
else
    spriteDown = -1;

spriteLeft = -1;
spriteUp = -1;
spriteRight = -1;
alwaysAnimateImageSpeed = -1;
overrideNonTalk = false;
disableBaseNPCStep = false;
stepFunction = undefined;
drawFunction = undefined;
disableInteract = false;
