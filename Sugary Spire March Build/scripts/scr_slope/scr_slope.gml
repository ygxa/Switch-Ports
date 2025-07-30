/// @desc With this function you can check for collision slopes (Depecrated)
/// @param {bool} [no_platform] Ignore platform slopes?
function scr_slope(no_platform = false) {
	return scr_slope_ext(x, y + 1, no_platform);
}
/// @desc With this function you can check for collision slopes.
/// @param {any*} x The X position to check.
/// @param {any*} y The Y position to check.
/// @param {bool} [no_platform] Ignore platform slopes?
function scr_slope_ext(pos_x, pos_y, no_platform = false) {
	return place_meeting_slope(pos_x, pos_y, !no_platform);
	//var old_x = x;
	//var old_y = y;
	//x = pos_x
	//y = pos_y
	//#region Objects

	////Platform Slopes
	//if place_meeting(x, y, obj_slopePlatform) && !no_platform
	//{
	//	var _list = ds_list_create();
	//	var Oplatform_slopeList = instance_place_list(x, y, obj_slopePlatform, _list, false);
	//	var collided = false;
	//	if Oplatform_slopeList > 0
	//	{
	//		for (var i = 0; i < Oplatform_slopeList; ++i;)
	//		{
	//			var Oplatform_slope = (_list[| i]);
	//			var _can_collide = Oplatform_slope.canCollide(object_index);
	//			if _can_collide == true {				
	//				with (Oplatform_slope) {
	//					var object_side = other.bbox_left;
	//					var slope_start = bbox_top;
	//					var slope_end = bbox_bottom;
	//					if (image_xscale > 0) {
	//						object_side = other.bbox_right;
	//						slope_start = bbox_bottom;
	//						slope_end = bbox_top;
	//					}			
	//					var m = ((sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left));
	
	//					var platform_slope = (slope_start - round((m * (object_side - bbox_left))));
	//				}
	//				var old_bbox_bottom = (bbox_bottom - y) + old_y;		
	//				var quickfix = old_bbox_bottom <= Oplatform_slope.bbox_bottom && (Oplatform_slope.image_xscale > 0 ? object_side <= Oplatform_slope.bbox_left + 1 : object_side >= Oplatform_slope.bbox_right - 1);
	//				if (quickfix || old_bbox_bottom < platform_slope) && triangle_meeting(x, y, Oplatform_slope.x, Oplatform_slope.y + Oplatform_slope.sprite_height, Oplatform_slope.x + Oplatform_slope.sprite_width, Oplatform_slope.y, Oplatform_slope.x + Oplatform_slope.sprite_width, Oplatform_slope.y + Oplatform_slope.sprite_height) {
	//					collided = true;
	//					break;
	//				}				
	//			}
	//		}
	//	}
	//	ds_list_destroy(_list);
	//	if collided
	//	{
	//		x = old_x;
	//		y = old_y;
	//		return true;
	//	}
	//}	
	//if place_meeting(x, y, obj_slope)
	//{
	//	var slope = instance_place(x, y, obj_slope)
	//	if triangle_meeting(x, y, slope.x, slope.y + slope.sprite_height, slope.x + slope.sprite_width, slope.y, slope.x + slope.sprite_width, slope.y + slope.sprite_height) {
	//		x = old_x;
	//		y = old_y;
	//		return true;		
	//	}
	//}	
	//#endregion
	
	//x = old_x;
	//y =	old_y;
	//return false;
}

function scr_solid_slope(argument0, argument1) {
	place_meeting_slopeSolid(argument0, argument1);
	/*
	var old_x = x;
	var old_y = y;
	x = argument0;
	y = argument1;
	var _xscale = sign(image_xscale);
	if scr_slope_ext(x, y) {
		if place_meeting(x, y, obj_slope) {
			var inst = instance_place(x, y, obj_slope);
			var other_xscale = sign(inst.image_xscale);
			if other_xscale != _xscale {
				x = old_x;
				y = old_y;
				return true;
			}
		}
	}
	x = old_x;
	y = old_y;
	return false;
	*/
}

function slopeCheck(x_pos, y_pos) { //still needed
	return scr_slope_ext(x_pos, y_pos + 1) && !scr_solid_slope(x_pos, y_pos + 1) && !scr_solid_slope(x_pos, y_pos) && scr_slope_ext(x_pos, (y_pos - bbox_top) + bbox_bottom);
}

function scr_slopePlatform(argument0, argument1) {
	place_meeting_slopePlatform(argument0, argument1);
	/*
	var old_x = x;
	var old_y = y;
	x = argument0;
	y = argument1;
	//Platform Slopes
	if place_meeting(x, y, obj_slopePlatform)
	{
		var _list = ds_list_create();
		var Oplatform_slopeList = instance_place_list(x, y, obj_slopePlatform, _list, false);
		var collided = false;
		if Oplatform_slopeList > 0
		{
			for (var i = 0; i < Oplatform_slopeList; ++i;)
			{
				var Oplatform_slope = (_list[| i]);
				var _can_collide = Oplatform_slope.canCollide(object_index);
				if _can_collide == true {				
					if triangle_meeting(x, y, Oplatform_slope.x, Oplatform_slope.y + Oplatform_slope.sprite_height, Oplatform_slope.x + Oplatform_slope.sprite_width, Oplatform_slope.y, Oplatform_slope.x + Oplatform_slope.sprite_width, Oplatform_slope.y + Oplatform_slope.sprite_height) {
						collided = true;
						break;
					}				
				}
			}
		}
		ds_list_destroy(_list);
		if collided
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}	
	x = old_x;
	y = old_y;
	return false;	
	*/
}

/// @desc Checks for Slope below player. Returns Slope Acceleration.
/// @returns {real} Slope Acceleration.
function slopeMomentum_acceleration() {
	if place_meeting_slope(x, y + 1, false) {	
		with (instance_place(x, (y + 1), obj_slope))
		{
			var slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if sign(image_xscale) >= 1 {
				return -slope_acceleration;
			} else {
				return slope_acceleration;
			}
		}
	}
	if place_meeting_slopePlatform(x, y + 1) {	
		with (instance_place(x, (y + 1), obj_slopePlatform))
		{
			var slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if sign(image_xscale) >= 1 {
				return -slope_acceleration;
			} else {
				return slope_acceleration;
			}
		}
	}
}
/// @desc Checks for Slope below player. Returns Slope Direction.
/// @returns {real} Slope Direction.
function slopeMomentum_direction() {
	if place_meeting_slope(x, y + 1, false) {
		with (instance_place(x, (y + 1), obj_slope))
			return (sign(image_xscale));
	}
	if place_meeting_slopePlatform(x, y + 1) {
		with (instance_place(x, (y + 1), obj_slopePlatform))
			return (sign(image_xscale));
	}	
}

function player_slopeMomentum(add, sub = add) {
	var inst = instance_place(x, y + 1, obj_slopePlatform)
	if instance_place(x, y + 1, obj_slope) != -4
		inst = instance_place(x, y + 1, obj_slope)

	if groundedSlope && inst != -4 {
		var _xscale = sign(inst.image_xscale)
		var slope_acceleration = abs(inst.image_yscale) / abs(inst.image_xscale)
		if sign(image_xscale) == _xscale
			movespeed -= sub * slope_acceleration
		else
			movespeed += add * slope_acceleration
		
	}
	
}