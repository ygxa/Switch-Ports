if (other.state == PlayerState.doughmount || other.state == PlayerState.doughmountspin || other.state == PlayerState.doughmountballoon)
{
	event_play_multiple("event:/SFX/general/collect", x, y)
	create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), "10")
	global.Collect += 10
	global.PizzaMeter += 1
	global.ComboTime += 10
	scr_ghostcollectible(false)
	create_collect_effect(x, y, sprite_index, 10)
	instance_destroy()
}
