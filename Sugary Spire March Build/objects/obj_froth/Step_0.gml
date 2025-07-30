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
if point_in_circle(x,y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != baddiestate.inhaled
	state = baddiestate.inhaled
if (state == baddiestate.stun && stunned > 40 && birdcreated == 0) {
    birdcreated = 1;
    with (instance_create(x, y, obj_enemybird)) ID = other.id;
}
if (state != baddiestate.stun && state != baddiestate.frozen) birdcreated = 0;
//if (state == baddiestate.walk) state = baddiestate.float;
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
if (bombreset > 0)
bombreset--
/*
if point_in_rectangle(obj_player.x + obj_player.hsp, obj_player.y + obj_player.vsp, x - 50, y, x + 50, y + 200) && obj_player.state != states.bushdisguise
{
	if (state == baddiestate.float && substate = 0 && bombreset == 0)
	{
		image_index = 0;
		substate = 1
		hsp = 0
	}
}
*/
if state == baddiestate.stun grav = 0.5 else grav = 0
if state == baddiestate.walk state = baddiestate.float
scr_commonenemy()
if state != baddiestate.float || substate == 0
scr_scareenemy();
if state != baddiestate.float substate = 0
if place_meeting(x, y + 1, obj_player) && state == baddiestate.float && substate == 1 && sprite_index == spr_snowclouddiveboil
{
	
	with obj_player
	{
		hsp = 0
		player_x = x
		state = states.bushdisguise
		sprite_index = spr_player_frothstuck
		bushdetection = 3
	}
	instance_destroy()
}
if substate == 0 {
	y = approach(y, ystart, 2)
}