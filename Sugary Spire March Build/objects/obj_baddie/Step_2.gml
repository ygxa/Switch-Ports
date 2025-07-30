var _state = global.freezeframe ? frozenstate : state
//Stun Touch
stuntouch--
stuntouch = max(0, stuntouch);
//Squash and Stretch
if squashedx = true
{
	squashvalx = approach(squashvalx,0.4,0.15)
	if squashvalx >= 0.4
		squashedx = false
}
else if squashedx = false
{
	squashvalx = approach(squashvalx,0,0.05)
}
if squashedy = true
{
	squashvaly = approach(squashvaly,0.4,0.15)
	if squashvaly >= 0.4
		squashedy = false
}
else if squashedy = false
{
	squashvaly = approach(squashvaly,0,0.05)
}
	
	
if (state != baddiestate.grabbed && state != baddiestate.panicwait && state != baddiestate.secretwait)
    scr_collide();
if state = baddiestate.grabbed {
	vsp = 0;
	hsp = 0;
	grounded = false;
}
if (secretjumped && grounded && invincible) {
	invincible = false;
	secretjumped = false;
}
/*
if _state != baddiestate.stun {
	linethrown = true	
	thrown = false
	
}*/
/*
if thrown && object_index != obj_applejim
	instance_create(x, y, obj_baddiethrow);
if place_meeting((x + 1), y, obj_baddiethrow) && !thrown
	instance_destroy();
if place_meeting((x + 1), y, obj_player) &&  obj_player.state == states.tumble && object_index != obj_crackerkicker
	instance_destroy();
if place_meeting((x + 1), y, obj_player) &&  obj_player.state == states.breakdance
	instance_destroy();
*/