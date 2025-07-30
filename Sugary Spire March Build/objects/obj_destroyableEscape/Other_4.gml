/// @description Escape Go Away
if global.panic == false {
	x = -999;
	y = -999;
}
OldPanic = global.panic;
// Inherit the parent event
event_inherited();

