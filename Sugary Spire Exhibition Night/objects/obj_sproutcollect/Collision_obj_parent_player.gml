if (grounded)
{
	event_play_multiple("event:/SFX/general/collect", (x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2))
	scr_queueTVAnimation(global.TvSprPlayer_Happy, 150)
	var val = 50
	create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), string(val))
	global.Collect += val
	global.ComboTime = 60
	create_collect_effect(x, y, sprite_index, val)
	scr_ghostcollectible(false)
	instance_destroy()
}
