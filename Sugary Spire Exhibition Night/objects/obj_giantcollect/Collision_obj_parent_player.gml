event_play_oneshot("event:/SFX/general/collectgiantpizza")
event_play_multiple("event:/SFX/general/collect", x, y)
scr_ghostcollectible(false)
scr_queueTVAnimation(global.TvSprPlayer_Happy, 200)
global.Collect += 1000
global.PizzaMeter += 5
create_small_number(x, y, "1000")
global.ComboTime = 60
create_collect_effect(x, y, sprite_index, 1000)
instance_destroy()
