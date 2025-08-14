if state = "chat"{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_font(fnt_text)
	draw_set_color(c_white)
	draw_sprite(textbox,0,160,235)
	
	if textbox != spr_textbox{
		var n = clamp(floor(textletter),0,string_length(text));
		draw_text(140,170,"* "+wrap_txt(string_copy(text,1,n),25));
	}
	else{
		var n = clamp(floor(textletter),0,string_length(text));
		draw_text(100,170,"* "+wrap_txt(string_copy(text,1,n),25));		
	}
		
}
