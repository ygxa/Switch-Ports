

if (prevhp != eliteHP)
{
    if (eliteHP < prevhp)
    {

        touchedground = 0
        //hsp += ((-image_xscale) * 5)
        flickertime = 11
        alarm[6] = 5
    }
    prevhp = eliteHP
}


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

if bombreset > 0
	bombreset--
if ragereset > 0
	ragereset--
if (flickertime > 0) 
	invincible = true
else 
	invincible = false
																		
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