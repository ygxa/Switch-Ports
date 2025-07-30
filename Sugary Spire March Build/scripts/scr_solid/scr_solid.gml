/// @desc With this function you can check for collision objects.
/// @param {any*} x The X position to check.
/// @param {any*} y The Y position to check.
/// @param {bool} [no_slope] Toggle to check for Slopes.
function scr_solid(pos_x, pos_y, no_slope = false) {
	return place_meeting_collision(pos_x, pos_y, no_slope);
	//var old_x = x;
	//var old_y = y;
	//x = pos_x;
	//y = pos_y;
	//if place_meeting(x, y, obj_solid)
	//{
	//    x = old_x
	//    y = old_y
	//    return true;
	//}
	
	//#region New Platforms
	//var platform = noone
	//if place_meeting(x, y, obj_platform)
	//{
	//	var _list = ds_list_create();
	//	var _platforms = instance_place_list(x, y, obj_platform, _list, false);
	//	var collided = false;
	//	if _platforms > 0
	//	{
	//		for (var i = 0; i < _platforms; ++i;)
	//		{
	//			var platform = (_list[| i]);
	//			var _can_collide = (sign(platform.image_yscale) <= -1 ? y <= old_y : y > old_y);
	//			if _can_collide == true && platform.can_collide(object_index) && place_meeting(x, y, platform) && !place_meeting(x, old_y, platform)
	//				collided = true;
	//		}
	//	}
	//	ds_list_destroy(_list);
	//	if collided
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}	
	//}
	//var Sideplatform = noone
	//if place_meeting(x, y, obj_sidePlatform)
	//{
	//	var _list = ds_list_create();
	//	var _Sideplatforms = instance_place_list(x, y, obj_Sideplatform, _list, false);
	//	var collided = false;
	//	if _Sideplatforms > 0
	//	{
	//		for (var i = 0; i < _Sideplatforms; ++i;)
	//		{
	//			var Sideplatform = (_list[| i]);
	//			var _can_collide = (sign(Sideplatform.image_xscale) < 0 ? x >= old_x : x <= old_x);
	//			if _can_collide == true && Sideplatform.can_collide(object_index) && place_meeting(x, y, Sideplatform) && !place_meeting(old_x, y, Sideplatform)
	//				collided = true;
	//		}
	//	}
	//	ds_list_destroy(_list);
	//	if collided
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}	
	//}
	//#endregion
	//var movingPlatform = noone;
	//if place_meeting(x, y, obj_movingPlatform)
	//{
	//	var movingPlatform = instance_place(x, y, obj_movingPlatform)
	//	if y > old_y
	//	{
	//		var _list = ds_list_create();
	//		var _movingPlatforms = instance_place_list(x, y, obj_movingPlatform, _list, false);
	//		var collided = false;
	//		if _movingPlatforms > 0
	//		{
	//			for (var i = 0; i < _movingPlatforms; ++i;)
	//			{
	//				var movingPlatform = (_list[| i]);
	//				var _can_collide = movingPlatform.can_collide(object_index);
	//				if _can_collide == true && place_meeting(x, y, movingPlatform) && !place_meeting(x, old_y, movingPlatform)
	//					collided = true;
	//			}
	//		}
	//		ds_list_destroy(_list);
	//		if collided
	//		{
	//			x = old_x
	//			y = old_y
	//			return true;
	//		}
	//	}
	//}
	//var slope = instance_place(x, y, obj_slope)
	//if slope && no_slope {
	//	if scr_solid_slope(x, y) {
	//		x = old_x;
	//		y = old_y;
	//		return true;		
	//	}
	//} else if slope && !no_slope {
	//	if triangle_meeting(x, y, slope.x, slope.y + slope.sprite_height, slope.x + slope.sprite_width, slope.y, slope.x + slope.sprite_width, slope.y + slope.sprite_height) {
	//		x = old_x;
	//		y = old_y;
	//		return true;		
	//	}
	//}
	////Platform Slopes
	//if place_meeting(x, y, obj_slopePlatform) && !no_slope
	//{
	//	var _list = ds_list_create();
	//	var Oplatform_slopeList = instance_place_list(x, y, obj_slopePlatform, _list, false);
	//	var collided = false;
	//	if Oplatform_slopeList > 0
	//	{
	//		for (var i = 0; i < Oplatform_slopeList; ++i;)
	//		{
	//			var Oplatform_slope = (_list[| i]);
	//			var _can_collide = Oplatform_slope.can_collide(object_index);
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
	//x = old_x
	//y = old_y
	//return 0;	

}
/// @desc With this function you can check for collision objects. For Players.
/// @param {any*} x The X position to check.
/// @param {any*} y The Y position to check.
/// @param {bool} [no_slope] Toggle to check for Slopes.
function scr_solid_player(pos_x, pos_y, no_slope = false) {
	return place_meeting_collision(pos_x, pos_y, no_slope);
	//var old_x = x
	//var old_y = y
	//x = pos_x
	//y = pos_y
	//if place_meeting(x, y, obj_solid)
	//{
	//    x = old_x
	//    y = old_y
	//    return 1;
	//}
	
	
	//#region New Platforms
	//var platform = noone
	//if place_meeting(x, y, obj_platform)
	//{
	//	var _list = ds_list_create();
	//	var _platforms = instance_place_list(x, y, obj_platform, _list, false);
	//	var collided = false;
	//	if _platforms > 0
	//	{
	//		for (var i = 0; i < _platforms; ++i;)
	//		{
	//			var platform = (_list[| i]);
	//			var _can_collide = (sign(platform.image_yscale) <= -1 ? y <= old_y : y > old_y);
	//			if _can_collide == true && platform.can_collide(object_index) && place_meeting(x, y, platform) && !place_meeting(x, old_y, platform)
	//				collided = true;
	//		}
	//	}
	//	ds_list_destroy(_list);
	//	if collided && state != states.ladder
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}	
	//}
	//var Sideplatform = noone
	//if place_meeting(x, y, obj_sidePlatform)
	//{
	//	var _list = ds_list_create();
	//	var _Sideplatforms = instance_place_list(x, y, obj_Sideplatform, _list, false);
	//	var collided = false;
	//	if _Sideplatforms > 0
	//	{
	//		for (var i = 0; i < _Sideplatforms; ++i;)
	//		{
	//			var Sideplatform = (_list[| i]);
	//			var _can_collide = (sign(Sideplatform.image_xscale) < 0 ? x >= old_x : x <= old_x);
	//			if _can_collide == true && Sideplatform.can_collide(object_index) && place_meeting(x, y, Sideplatform) && !place_meeting(old_x, y, Sideplatform)
	//				collided = true;
	//		}
	//	}
	//	ds_list_destroy(_list);
	//	if collided
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}	
	//}
	//#endregion
	//var movingPlatform = noone;
	//if place_meeting(x, y, obj_movingPlatform)
	//{
	//	var movingPlatform = instance_place(x, y, obj_movingPlatform)
	//	if y > old_y
	//	{
	//		var _list = ds_list_create();
	//		var _movingPlatforms = instance_place_list(x, y, obj_movingPlatform, _list, false);
	//		var collided = false;
	//		if _movingPlatforms > 0
	//		{
	//			for (var i = 0; i < _movingPlatforms; ++i;)
	//			{
	//				var movingPlatform = (_list[| i]);
	//				var _can_collide = movingPlatform.can_collide(object_index);
	//				if _can_collide == true && place_meeting(x, y, movingPlatform) && !place_meeting(x, old_y, movingPlatform)
	//					collided = true;
	//			}
	//		}
	//		ds_list_destroy(_list);
	//		if collided && state != states.ladder
	//		{
	//			x = old_x
	//			y = old_y
	//			return true;
	//		}
	//	}
	//}	
	////Slopes
	//var Oslope = instance_place(x, y, obj_slope)
	//if Oslope && no_slope {
	//	if scr_solid_slope(x, y) {
	//		x = old_x;
	//		y = old_y;
	//		return true;		
	//	}	
	//} else if Oslope && !no_slope {
	//	if triangle_meeting(x, y, Oslope.x, Oslope.y + Oslope.sprite_height, Oslope.x + Oslope.sprite_width, Oslope.y, Oslope.x + Oslope.sprite_width, Oslope.y + Oslope.sprite_height) {
	//		x = old_x;
	//		y = old_y;
	//		return true;		
	//	}
	//}
	////Platform Slopes
	//if place_meeting(x, y, obj_slopePlatform) && !no_slope
	//{
	//	var _list = ds_list_create();
	//	var Oplatform_slopeList = instance_place_list(x, y, obj_slopePlatform, _list, false);
	//	var collided = false;
	//	if Oplatform_slopeList > 0
	//	{
	//		for (var i = 0; i < Oplatform_slopeList; ++i;)
	//		{
	//			var Oplatform_slope = (_list[| i]);
	//			var _can_collide = Oplatform_slope.can_collide(object_index);
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
	//				var _check = old_bbox_bottom <= platform_slope;
	//				if (quickfix || _check) && triangle_meeting(x, y, Oplatform_slope.x, Oplatform_slope.y + Oplatform_slope.sprite_height, Oplatform_slope.x + Oplatform_slope.sprite_width, Oplatform_slope.y, Oplatform_slope.x + Oplatform_slope.sprite_width, Oplatform_slope.y + Oplatform_slope.sprite_height) {
	//					collided = true;
	//					break;
	//				}				
	//			}
	//		}
	//	}
	//	ds_list_destroy(_list);
	//	if collided && state != states.ladder
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}
	//}
	//x = old_x
	//y = old_y
	//return false;
}
