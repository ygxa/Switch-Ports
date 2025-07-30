#region //elevator select
if (state == elevatorstates.selecting)
{
	var txt = hub_array[selected, 1]
	var yy = string_height(txt)
	var length = array_length(hub_array)
	/*var txt1 = selected == 0 ? "" : hub_array[selected - 1, 1]
	var txt2 = selected == length ? "" : hub_array[selected + 1, 1]
	var txt0 = selected <= 1 ? "" : hub_array[selected - 2, 1]
	var txt3 = selected >= length - 1 ? "" : hub_array[selected + 2, 1]


    /*for (var i = 0; i < array_length(hub_array); i++)
    {
        var txt = hub_array[i][1]
        if (string_width(txt) > w)
            w = string_width(txt)
        h += string_height(txt)
    }
	
    w += pad
    h += pad
    yy = (270 + (h / 2))
    draw_rectangle_color((480 - (w / 2)), (270 - (h / 2)), (480 + (w / 2)), yy, c_black, c_black, c_black, c_black, 0)
    yy -= (pad / 2)
	*/
    //draw_set_valign(fa_bottom)
    draw_set_halign(fa_center)
	draw_set_font(global.font)
	
	
    
	if !surface_exists(surface2)
		surface2 = surface_create(480, 240)
	surface_set_target(surface2)	
	  
	draw_sprite_tiled(bg_menuTile, -1, drawx++, drawy++)
	var yy = 40
	for (var i = 0; i < length; i++) {
		var txt = hub_array[i, 1]
		var c = selected == i ? c_white : c_gray
		draw_text_color(240, yy + ScrollY, txt, c, c, c, c, 1)
		yy += 60
	}	
	draw_set_blend_mode(bm_subtract)
	draw_sprite(spr_elevatorfadeoff, -1, 0, 0)
	draw_set_blend_mode(bm_normal)
	surface_reset_target()
	
	draw_surface(surface2, 240, 150)
 
}
else if state = elevatorstates.cutscene {
	draw_sprite_tiled(bg_menuTile, -1, drawx++, drawy++)
	draw_set_font(global.font)
	draw_set_halign(fa_center)
	var msg = "I CANT DRAW! \nPUT A CUTSCENE HERE"
	draw_text(480 + random_range(1, -1), 270 - (string_height(msg) / 2), msg)
	
	
	
}	
#endregion