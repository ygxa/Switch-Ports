/* Experimental Screen Scale
#region Draw Screen
	//Scaling 
	var _monitorWidth = window_get_width();
	var _monitorHeight = (_monitorWidth * (9/16));
	var surfW = floor(_monitorWidth / surface_get_width(application_surface)) * 960;
	var surfH = floor(_monitorHeight / surface_get_height(application_surface)) * 540;	
	surfW = max(surfW, 480);
	surfH = max(surfH, 260);
	//Ghost Surface
	if !surface_exists(finalApplicationSurface) {
		finalApplicationSurface = surface_create(960, 540);
	}
	
	#region Shader Effects
	var shader = noone;
	var appa = 1;
	if !global.gamePauseState {
		//Greyscale/Posterization
		if (global.panic && global.minutes <= 1)
			shader = shd_greyscale;
		else
			shader = noone;
			
		//Screenmelt Alpha
		if (global.screenmelt && global.panic)
			appa = lerp(1, 0.45, (global.wave / global.maxwave))	
	}
	#endregion
	
	//Draw Application Surface
	surface_set_target(finalApplicationSurface)
		shader_set(shd_premulti);
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
			draw_surface_stretched_ext(application_surface, 0, 0, 960, 540, c_white, appa);
			gpu_set_blendmode(bm_normal);
		shader_reset();	
	
	surface_reset_target();
	
	
	if shader != noone
	{
		shader_set(shader);
		var ade = shader_get_uniform(shader, "fade")
		shader_set_uniform_f(fade, global.greyscalefade)
		draw_surface_stretched_ext(finalApplicationSurface, 0, 0, surfW, surfH, c_white, 1)
		shader_reset();		
	}
	else
		draw_surface_stretched_ext(finalApplicationSurface, 0, 0, surfW, surfH, c_white, 1)
	
	// Draw GUI and Border goes here
	
#endregion