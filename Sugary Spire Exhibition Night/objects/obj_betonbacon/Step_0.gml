movespeed = 2.5

if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != EnemyStates.inhaled)
	state = EnemyStates.inhaled

if (state != PlayerState.stun)
	depth = 0

if (state != PlayerState.charge && state != PlayerState.freezeframe)
	thrown = 0

ragereset = max(ragereset - 1, 0)

if (point_in_rectangle(obj_parent_player.x, obj_parent_player.y, x - 200, y - 50, x + 200, y + 50) && obj_parent_player.state != PlayerState.door && obj_parent_player.state != PlayerState.comingoutdoor)
{
	if (state != PlayerState.titlescreen && state == PlayerState.frozen && ragereset <= 0)
	{
		state = PlayerState.titlescreen
		sprite_index = baddieSpriteRage
		
		if (x != obj_parent_player.x)
			image_xscale = sign(obj_parent_player.x - x)
		
		ragereset = 200
		image_index = 0
		image_speed = 0.35
		flash = true
		alarm[4] = 5
		create_heat_afterimage(AfterImageType.plain)
	}
}

if (hitboxcreate == 0 && animation_end_old(undefined, 10) && state == PlayerState.titlescreen)
{
	hitboxcreate = 1
	
	with (instance_create(x, y, obj_forkhitbox, 
	{
		ID: other.id
	}))
	{
		ID = other.id
		image_xscale = other.image_xscale
		image_index = other.image_index
		depth = -1
	}
}

event_inherited()
