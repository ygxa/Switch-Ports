/*switch state {
    case baddiestate.idle:
        scr_enemy_idle();
        break;
    case baddiestate.turn:
        scr_enemy_turn();
        break;
    case baddiestate.walk:
        scr_enemy_walk();
        break;
    case baddiestate.land:
        scr_enemy_land();
        break;
    case baddiestate.hit:
        scr_enemy_hit();
        break;
    case baddiestate.stun:
        scr_enemy_stun();
        break;
    case baddiestate.Throw:
        scr_enemy_throw();
        break;
    case baddiestate.grabbed:
        scr_enemy_grabbed();
        break;
    case baddiestate.scared:
        scr_enemy_scared();
        break;
	case baddiestate.inhaled:
		scr_enemy_inhaled();
		break;
}*/
if flying = true
	{
	grav = 0
	movespeed = 0
	}
	
if state == baddiestate.walk {
	if !instance_exists(sightID) && !alarmed {
		sightID = instance_create(x, y, obj_guardhitbox)
		sightID.ID = id
	}
	walkspr = alarmed ? spr_guard_run : spr_guard
	if state == baddiestate.walk && alarmed movespeed = 4
	if alarm[3] > 0 hsp = 0
}
if (state == baddiestate.stun || state == baddiestate.scared || state == baddiestate.frozen || state == baddiestate.grabbed || alarmed) {
	alarm[3] = -1
	if instance_exists(sightID) instance_destroy(sightID)	
}
if point_in_circle(x,y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != baddiestate.inhaled
	state = baddiestate.inhaled
if (state == baddiestate.stun && stunned > 40 && birdcreated == 0) {
    birdcreated = 1;
    with (instance_create(x, y, obj_enemybird)) ID = other.id;
}
if (state != baddiestate.stun && state != baddiestate.frozen) birdcreated = 0;
if (flash == 1 && alarm[2] <= 0) alarm[2] = (0.15 * room_speed);
if (state != baddiestate.grabbed) depth = 0;
if (state != baddiestate.stun && state != baddiestate.frozen) thrown = 0;
if (boundbox == 0) && state != baddiestate.inhaled
{
    with (instance_create(x, y, obj_baddiecollisionbox, { baddieID : other.id }))
    {
        sprite_index = other.sprite_index;
        mask_index = other.mask_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}
scr_commonenemy()
scr_scareenemy();
var _x = x + (sign(image_xscale) * 150)

/*	
if triangle_meeting(obj_player.x, obj_player.y, x, y, _x, y + 85, _x, y - 85) && !alarmed && state == baddiestate.walk && obj_player.state != states.comingoutdoor && obj_player.state != states.door && grounded {
	sprite_index = spr_throw
	image_index = 0
	hsp = 0
	bombreset = 0
	state = baddiestate.Throw
	
}
*/
/*if obj_player.state = states.finishingblow && !(floor(image_index) == (image_number - 2))
{
with instance_nearest(x, y, obj_gumslime)
vsp = 0
}
if obj_player.state = states.finishingblow && (floor(image_index) == (image_number - 1))
{
with instance_nearest(x, y, obj_gumslime)
vsp = 2
}*/
/*
if (((obj_player.x > (x - 400)) && (obj_player.x < (x + 400))) && ((y <= (obj_player.y + 60)) && (y >= (obj_player.y - 60)))) {
    if ((state != baddiestate.scared) && (obj_player.state == states.mach3 or obj_player.state = states.pizzanomach)) {
        state = baddiestate.scared;
        sprite_index = scaredspr;
        if (x != obj_player.x)
            image_xscale = (-sign((x - obj_player.x)));
		movespeed = 0;
		hsp = 0;
		image_index = 0;
    }
}
*/
if stationary = true
	movespeed = 0