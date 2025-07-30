// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_painter_walk(){
	if grounded hsp = approach(hsp, 0, 0.25)
	if flickertime > 0 sprite_index = spr_painter_hurt
	else sprite_index = spr_painter_idle
	if flickertime > 0 && sprite_index == spr_painter_hurt && grounded && vsp > 0 {
		vsp = -5
		hsp = approach(hsp, 0, 0.5)
		touchedground = 1
		
	}
}