if is_hub() || !scr_roomcheck() exit;
//Bobbing
bobbing = wave(2, -2, 3, 0);
//Draw Combo Meter
draw_set_font(global.combofont);
draw_set_halign(fa_center);
draw_set_color(c_white);
var _cx = 652
var _hy = 88 + combo_y + hand_y
var _gy = _hy + 6
_hy = clamp(_hy, 88, 142)
if !surface_exists(goo_surface) {
	goo_surface = surface_create(100, 180)
	surface_set_target(goo_surface)
	draw_clear_alpha(c_black, 0)
	surface_reset_target()
} else {
	surface_set_target(goo_surface)
		draw_clear_alpha(c_black, 0)
		draw_sprite(spr_combometer_goo, goo_index, 0 - 3, _hy + 6)
		draw_set_blend_mode(bm_subtract)
		draw_sprite(spr_combometer_cut, 0, 0, 0)
		draw_set_blend_mode(bm_normal)
	surface_reset_target()
	draw_surface(goo_surface, _cx + combo_x - 50, 88 + combo_y - 91)
		
}
draw_sprite_ext(spr_combometer, -1, _cx + combo_x, 88 + combo_y, 1, 1, 0, c_white, alpha) 
draw_sprite_ext(spr_combometer_hand, -1, _cx + hand_x, _hy, 1, 1, 0, c_white, alpha) 
var _ct = string(global.combo) + "x"
draw_text(_cx + combo_x, combo_y, _ct)
//Draw TV
if sprite_index != spr_tvturnon draw_sprite_ext(draw_static ? spr_tvpropellerstatic : spr_tvpropeller , propindex, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
scr_palette_as_player()
/*
#region Draw TV
if staticdraw == 0 
{
	draw_sprite_ext(tvsprite, image_index, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);

	if tvsprite != spr_tvturnon
		draw_sprite_ext(spr_tvpropeller, propindex, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_tvstatic, statindex /*incase of spam, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
	if tvsprite != spr_tvturnon
		draw_sprite_ext(spr_tvpropellerstatic, propindex, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}

#endregion
*/

draw_sprite_ext(sprite_index, image_index, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);

pal_swap_reset();

if draw_static {
	static_index += 0.3
	draw_sprite_ext(spr_tv_newstatic, static_index, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}


//non palette effected
/*
if staticdraw == 0 
{
if tvsprite != spr_tvturnon
		draw_sprite_ext(spr_tvpropeller, propindex, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_tvstatic, statindex /*incase of spam, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
	if tvsprite != spr_tvturnon
		draw_sprite_ext(spr_tvpropellerstatic, propindex, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}
if tvsprite != spr_tvturnon draw_sprite_ext(spr_tvframe, image_index, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
*/
//Mute Icon easter egg
if tvsprite != spr_tvoff && tvsprite != spr_tvturnon && global.dialogueVolume <= 0 {
	draw_sprite_ext(spr_tvmuteicon, 0, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}
//Inventory
//draw_sprite_ext(invsprite, image_index, 700, 57 + DrawY, 1, 1, 0, c_white, 1);
draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_color(c_white);
	
draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_color(c_white);
//New Timer
var timerx = 480
var timery = 490 + timer_y
// Sucrose Timer Vars
var minsx = timerx - 90
var secx = timerx - 10
var minsy = timery - 15
// Bar Timer Vars
var perc = clamp(1 - (target_fill / global.maxwave), 0, 1)
var john_ypos = -12 * (perc)
var dist = clamp(perc * 268, 0, 268)
// Time Vars
var timeinsecs = floor(target_fill / 60)
var mins = max(floor(timeinsecs / 60), 0)
var secs = max((timeinsecs % 60), 0)
	
if (global.panic == 1 || global.starrmode == 1) {
	if !sucroseTimer target_fill = lerp(target_fill, global.fill, 0.03)
	else target_fill = approach(target_fill, global.fill, 10)
	var gaining_time = global.fill > target_fill
	var display_mins = string(abs(mins))
	var display_secs = string(abs(secs))
	if secs < 10
		display_secs = "0" + display_secs
	if !sucroseTimer {
		if coneball_sprite != spr_bartimer_showtime {
			draw_sprite_ext(spr_bartimer_normalBack, (coneball_index), timerx, timery, 1, 1, 0, c_white, 1)
			draw_sprite_part(spr_bartimer_strip, 0, 0, 0, dist + 45, 113, timerx - 184, timery - 56)
			draw_sprite_ext(spr_bartimer_roll, roll_index, timerx - 147 + dist, timery + john_ypos + 31, 1, 1, 0, c_white, 1)
		}
		draw_sprite_ext(coneball_sprite, floor(coneball_index), timerx, timery, 1, 1, 0, c_white, 1)
		draw_text(timerx, timery - 50, display_mins + ":" + display_secs)
	}
	else {
		draw_set_font(global.timerfont);
		draw_set_halign(fa_left);
		var _tmr_spr = oldTimer_sprite
		if _tmr_spr == spr_timer && gaining_time _tmr_spr = spr_timer_gain
		draw_sprite_ext(oldBall_sprite, oldBall_index, timerx, timery, 1, 1, 0, c_white, 1)
		draw_sprite_ext(_tmr_spr, oldTimer_index, timerx, timery, 1, 1, 0, c_white, 1)
		if mins < 10
			display_mins = "0" + display_mins
		if oldTimer_sprite != spr_timer_timesup {
			draw_set_color(gaining_time ? #60D048 : #F80000)
			draw_text(minsx, minsy, display_mins)
			draw_text(secx, minsy + 1, display_secs)
			draw_set_color(c_white)
			
		}
	}
}
draw_set_font(global.font);
draw_set_halign(fa_center);

	
	
	
//Message
draw_text(xi, yi, string_hash_to_newline(message));
	
/*
draw_sprite_ext(spr_tvcomboshadow, image_index, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, combofade - .5);
if global.combotime > 0 && global.combo > 0 {
	draw_sprite_ext(spr_tvcombo, image_index, 832, 74 + bobbing, 1, 1, 0, c_white, alpha);
	draw_set_font(global.combofont);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	//draw_text_color(821, 52, string_hash_to_newline(draw_combo), c_white, c_white, c_white, c_white, alpha);		
	var _combo = string(global.combo)
	if (global.combo < 10)
		_combo = "0" + string(global.combo)
	var _string_length = string_length(_combo);
	for (var i = 0; i < _string_length; i++) 
	{
		var _xx = (-(string_width(_combo)/ 2) + ((string_width(_combo)/_string_length) * i)) 
		var _yy = (i * -4)		
		if ComboShake == true {
			_xx += irandom_range(-2,2);
			_yy += irandom_range(-2,2);
		}			
		draw_text_color(838 + _xx, 50 + _yy + bobbing, string_char_at(_combo, i + 1), c_white, c_white, c_white, c_white, alpha);		
	}
	// D3 Combo Meter
    // var barindex = clamp((round(((global.combotime / 60) * 4)) - 1), 0, 3);
	// draw_sprite_ext(spr_loadbar, barindex, 832, 74, 1, 1, 0, c_white, alpha);
		
	// Cooler Combo Meter
	if !surface_exists(BarSurface) {
		BarSurface = surface_create(112, 32);
	} else {
		surface_set_target(BarSurface);
		draw_clear_alpha(c_white, 0);
			
			
				
		draw_sprite_tiled(spr_barpop2, 0, BarX, 0);
			
		draw_set_color(#480028);
		draw_rectangle(112 * (global.combotime/60), -50, 112, 50, false);
		draw_set_color(c_white);
			

		draw_sprite_ext(spr_barpop3, 0, 112 * (global.combotime/60), -64, 1, 5, 0, c_white, 1);
			
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(spr_barpop, 1, 0, 0, 1, 1, 0, c_white, 1);	
		gpu_set_blendmode(bm_normal);
			
		surface_reset_target();
			
		BarX += -0.5 + (0.45 * (global.combofreeze/30));
			
	
		draw_surface_ext(BarSurface, 763, 107 + bobbing, 1, 1, 0, c_white, alpha);
			
		draw_sprite_ext(spr_barpop, 0, 763, 107 + bobbing, 1, 1, 0, c_white, alpha);
	}
		
} else {
	if chooseOnecomboend == true
		draw_sprite_ext(comboendSprite, comboendImage, 832, 74 + bobbing, 1, 1, 0, c_white, combofade * alpha);	
}
*/
	
var tgt = -100
var spd = 2
if lap_out > 0 {
	tgt = 90
	spd = 2
	lap_out--
}
lap_y = approach(lap_y, tgt, spd)
draw_set_halign(fa_center)
draw_set_font(global.lapfont)
var x_shk = random_range(-1, 1)
var y_shk = random_range(-1, 1)
if global.lapcount > 0 {
	draw_sprite(spr_lapbg, 0, 480 + x_shk, lap_y + y_shk)	
	draw_text(480 + x_shk, lap_y + y_shk, global.lapcount)
		
}
#region TEXT
//NEW TEXT
if shownewtext = true
{
draw_sprite_ext(textbubblesprites, textbubbleframes, 448, 45, 1, 1, 0, c_white, 1)
	
if !surface_exists(textpromptsurface)
	textpromptsurface = surface_create(300,100)
surface_set_target(textpromptsurface)
draw_clear_alpha(c_black, 0)
//var pizzafont = true;
var _new_message = new_message;
//Font Options
//if pizzafont = false
//{
	draw_set_font(global.bubblefont);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	_new_message = new_message;
/*}
else
{
	draw_set_font(global.smallfont);
	draw_set_halign(fa_left);
	draw_set_color(make_color_rgb(255,240,240));//c_white);
	_new_message = string_upper(new_message);
}*/	
//Text
if textbubblesprites = spr_tv_bubble
{
	//CONT. So I moved it here 
	var _length = -(floor(string_width(_new_message)) + 5)
	if floor(text_x) <= _length//- 775)
	{
		textbubblesprites = spr_tv_bubbleclose;
		textbubbleframes = 0;
	}
	draw_text(text_x, 30, _new_message)
}
	
surface_reset_target()
//draw_text(367, 300, string(floor(text_x)))
//draw_text(367, 350, string(string_width(new_message)))	
if surface_exists(textpromptsurface)
	draw_surface(textpromptsurface, 283, -10)
//Fade Effect
if textbubblesprites = spr_tv_bubble
	draw_sprite(spr_tv_bubblefade,-1, 448, 45)		
}
	

	

#endregion


if global.panic
	var promptY = 425
else
	var promptY = 500

draw_set_alpha(promptalpha)
draw_text_scribble(480, promptY, "[fa_middle][shake]" + controlprompt)
draw_set_alpha(1)