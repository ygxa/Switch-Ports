var surf = application_surface;
    var win_w = display_get_width();
    var win_h = display_get_height();
	var scale = 320 / surface_get_width(surf);
    var new_w = 320; 
	var new_h = surface_get_height(surf) * scale;
    // Center horizontally
    var _x = (win_w - new_w) * 0.5;

draw_surface_stretched(surf, _x, 0, 320, win_h);
