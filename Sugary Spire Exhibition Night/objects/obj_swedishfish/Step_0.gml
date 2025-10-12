event_inherited()
enemyAttack_TriggerEvent()

if (state == PlayerState.titlescreen && sprite_index == spr_swed_charge)
{
	canBreakBlocks = true
	doRedAfterImage = true
	
	if (!instance_exists(hurtboxID))
	{
		with (instance_create(x, y, obj_forkhitbox, 
		{
			ID: other.id
		}))
		{
			other.hurtboxID = id
			ID = other.id
			image_xscale = other.image_xscale
			image_index = other.image_index
			depth = -1
		}
	}
}
