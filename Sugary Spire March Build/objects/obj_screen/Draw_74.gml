#region Draw Screen
	//Scaling 
	var surfW = 960;
	var surfH = 540;	

	//Ghost Surface
	if !surface_exists(finalApplicationSurface) {
		finalApplicationSurface = surface_create(960, 540);
		if (buffer_exists(finalApplicationSurfBuffer)) {
			buffer_set_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
		}
	}
	
	#region Shader Effects
	var shader = noone;
	var appa = 1;
	if !global.gamePauseState {
		//Greyscale/Posterization
		if (global.panic && (global.fill <= (60 * 60)))
			shader = shd_greyscale;
		else
			shader = noone;
			
		//Screenmelt Alpha
		if (global.screenmelt && global.panic)
			appa = lerp(1, 0.5, (global.wave / global.maxwave));
	}
	#endregion
	
	//Draw Application Surface
	if (!global.gamePauseState) {
		surface_set_target(finalApplicationSurface)
			shader_set(shd_premulti);
				var fade = shader_get_uniform(shd_premulti, "fade");
				shader_set_uniform_f(fade, global.greyscalefade);
			
				gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
				draw_surface_stretched_ext(application_surface, 0, 0, 960, 540, c_white, appa);
				gpu_set_blendmode(bm_normal);
			
			shader_reset();	
	
		surface_reset_target();
	}
	
	if global.smoothscale {
		gpu_set_tex_filter(true);
			shader_set(shd_pixelscale);
				shader_set_uniform_f_array(uRes,sRes);		
				draw_surface_stretched_ext(finalApplicationSurface, 0, 0, surfW, surfH, c_white, 1);
			shader_reset();
		gpu_set_tex_filter(false);
	} else {
		draw_surface_stretched_ext(finalApplicationSurface, 0, 0, surfW, surfH, c_white, 1)
	}
	
	// Save to Buffer.
	if (!buffer_exists(finalApplicationSurfBuffer)) {
		finalApplicationSurfBuffer = buffer_create(surfW * surfH * 4, buffer_fixed, 1);
	}
	if (global.gamePauseState) {
		buffer_get_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
	}
	
#endregion