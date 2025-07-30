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
	case baddiestate.charge:
        scr_enemy_charge();
        break;
}*/
if (state == baddiestate.stun && stunned > 40 && birdcreated == 0) {
    birdcreated = 1;
    with (instance_create(x, y, obj_enemybird)) ID = other.id;
}
if (state != baddiestate.stun && state != baddiestate.frozen) 
	birdcreated = 0;
if (flash == 1 && alarm[2] <= 0) alarm[2] = (0.15 * room_speed);
if (state != baddiestate.grabbed) 
	depth = 0;
if (state != baddiestate.stun && state != baddiestate.frozen) 
	thrown = 0;
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox, { baddieID : other.id }))
    {
        sprite_index = other.sprite_index;
        mask_index = other.mask_index
        baddieID = other.id;
        other.boundbox = 1;
    }
}
if !pizzano scr_scareenemy();
scr_commonenemy();
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
var targetplayer = instance_nearest(x,y ,obj_player)
if x != targetplayer.x && grounded
{
	if ((targetplayer.x > x - 400) && (targetplayer.x < x + 400)) && (y <= targetplayer.y+20 && y >= targetplayer.y- 20)
	{
		if (state = baddiestate.walk)
		{
			state = baddiestate.charge
			substate = 0
			movespeed = 0
			image_xscale = (-sign((x - obj_player.x)));
			sprite_index = spr_banana_chargestart
			image_index = 0
		}
	}
}
if (sprite_index == spr_banana_chargestart && floor(image_index) == (image_number - 1))
{
	sprite_index = spr_banana_charge	
}
if (hitboxcreate == 0 && state = baddiestate.charge && sprite_index = spr_banana_charge)
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_forkhitbox, { ID : other.id})) {
        ID = other.id
		image_xscale = other.image_xscale
		image_index = other.image_index
		depth = -1
		sprite_index = spr_chargershitbox
		mask_index = spr_chargershitbox
	}
}
	if state = baddiestate.walk
	{
		movespeed = 0	
		hsp = 0
	}