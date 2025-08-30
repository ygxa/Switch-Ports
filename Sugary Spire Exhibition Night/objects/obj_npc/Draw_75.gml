var sep = 32
var wrap_w = 800

var old = draw_get_font()
var wave_x = wave(-5, 5, 5, 20)
draw_set_font(global.npcfont)
var newtext = string_replace_all(text, "/1", "#");
var newtext2 = string_replace_all(newtext, " ", "        ");

var textheight = string_height_ext(newtext2, sep, wrap_w)
var total_lines = ceil(textheight / sep)
var my_height = (total_lines + 0) * sep
var tgty = 1

if (total_lines == 1)
	tgty = max(my_height, 96)
else
	tgty = max(my_height, 128)

var active = speaking
draw_set_font(old)

switch (ropetype)
{
	case RopeType.top:
		draw_sprite_ext(myrope, propdex, wave_x + 64, boxy - 15, 1, 1, 0, c_white, 1)
		draw_sprite_ext(myrope, propdex, wave_x + 864, boxy - 15, 1, 1, 0, c_white, 1)
		break
	
	case RopeType.bottom:
		if (!(boxy <= -tgty))
			draw_sprite_ext(myrope, propdex, wave_x + 432, boxy + tgty, 1, 1, 0, c_white, 1)
		break
}

var drawing = true
boxy = max(boxy, -tgty)

if (active)
{
	if (voice_cooldown <= 0 && talk_sound != -4)
	{
		voice_cooldown = 100
		event_play_oneshot(talk_sound, x, y)
	}
	
	if (boxstate == 0)
	{
		boxvsp += 0.35
		boxy = approach(boxy, 50, boxvsp)
		
		if (boxy >= 50)
			boxstate = 1
	}
	else
	{
		boxy = lerp(boxy, 30 + wave(-2, 2, 4, 0), 0.2)
	}
}
else
{
	boxstate = 0
	boxvsp = 0
	boxy = approach(boxy, -tgty, 5)
	
	if (boxy <= -tgty)
		drawing = false
}

if (!drawing)
{
	event_perform(ev_cleanup, 0)
	exit
}

if (!surface_exists(mysurf))
	mysurf = surface_create(960, tgty)

if (!surface_exists(mycut))
	mycut = surface_create(960, tgty)

if (surface_exists(mycut))
{
	surface_set_target(mycut)
	draw_set_color(c_white)
	draw_rectangle(-960, -540, 1920, 1080, false)
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(mybubble, bubblesubimg, 480, 0, 9, tgty / sprite_get_height(mybubble), 0, c_white, 1)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
}

if (surface_exists(mysurf))
{
	surface_set_target(mysurf)
	draw_set_color(c_white)
	draw_sprite_tiled(mytex, 0, mytex_x, mytex_y)
	gpu_set_blendmode(bm_subtract)
	draw_surface(mycut, 0, 0)
	gpu_set_blendmode(bm_normal)
	draw_sprite_ext(mybubble, bubblesubimg2, surface_get_width(mysurf) / 2, 0, 9, tgty / sprite_get_height(mybubble), 0, c_white, 1)
	surface_reset_target()
	draw_surface(mysurf, 0 + wave_x, boxy)
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(global.npcfont)
draw_set_color(c_white)

draw_text_ext(wave_x + 80, boxy + 5, string(newtext2), sep, wrap_w)

