/// @description Set up the timer.

// Inherit the parent event
event_inherited();

// Sprites
spr_Lowering = spr_timedButtonLowering;
spr_Pressed = spr_timedButtonPressed; 
spr_Released = spr_timedButtonReleased; 
spr_Reverting = spr_timedButtonReverting;

// Counter to count down from.
countdownCounter = -1;
