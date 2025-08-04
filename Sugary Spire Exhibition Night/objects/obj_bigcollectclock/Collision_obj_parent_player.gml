if (laughing == false)
{
	fmod_studio_event_instance_start("event:/SFX/enemies/bearLaugh", (x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2))
	fmod_studio_event_instance_start(sfx_bigcollectget)
	scr_queueTVAnimation(global.TvSprPlayer_Happy, 150)
	var val = 50
	create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), string(val))
	global.Collect += val
	global.ComboTime = 60
	scr_ghostcollectible()
	laughing = true
	sprite_index = spr_bigcollectclocklaugh
}
