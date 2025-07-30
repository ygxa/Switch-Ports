//Default Parallax - making sure
function scr_default_parallax(overwrite = false)
{

scr_addParallaxLayer("Backgrounds_1", defaultParallax, [0.25, 0.25])
scr_addParallaxLayer("Assets_2BG1", defaultParallax, [0.25, 0.25])
scr_addParallaxLayer("Backgrounds_2", defaultParallax, [0.15, 0.15])
scr_addParallaxLayer("Assets_2BG2", defaultParallax, [0.15, 0.15])
scr_addParallaxLayer("Backgrounds_3", defaultParallax, [0.05, 0.05])
scr_addParallaxLayer("Assets_2BG3", defaultParallax, [0.05, 0.05])
scr_addParallaxLayer("Backgrounds_4", defaultParallax, [0.005, 0.005])
scr_addParallaxLayer("Assets_2BG4", defaultParallax, [0.005, 0.005])
scr_addParallaxLayer("Backgrounds_5", defaultParallax, [0.0005, 0.0005])
scr_addParallaxLayer("Assets_2BG5", defaultParallax, [0.0005, 0.0005])

scr_addParallaxLayer("Backgrounds_foregroundLow", defaultParallaxGround, [-0.15, -0.25])
scr_addParallaxLayer("Backgrounds_foreground", defaultParallax, [-0.15, -0.15])
scr_addParallaxLayer("Backgrounds_Ground1", defaultParallaxGround, [0.25, 0.25])
scr_addParallaxLayer("Backgrounds_Ground2", defaultParallaxGround, [0.15, 0.15])
scr_addParallaxLayer("Backgrounds_Ground3", defaultParallaxGround, [0.05, 0.05])
scr_addParallaxLayer("Backgrounds_Ground3_1", defaultParallaxGround, [0.015, 0.015])
scr_addParallaxLayer("Backgrounds_Ground4", defaultParallaxGround, [0.005, 0.005])
scr_addParallaxLayer("Backgrounds_H1", defaultParallaxH, [0.25, 0.25])
scr_addParallaxLayer("Backgrounds_H2", defaultParallaxH, [0.15, 0.15])
scr_addParallaxLayer("Backgrounds_H3", defaultParallaxH, [0.10, 0.10])
scr_addParallaxLayer("Backgrounds_H4", defaultParallaxH, [0.05, 0.05])
scr_addParallaxLayer("Backgrounds_V1", defaultParallaxV, [0.25, 0.25])
scr_addParallaxLayer("Backgrounds_V1", defaultParallaxV, [0.15, 0.15])
scr_addParallaxLayer("Backgrounds_far", defaultParallaxFar, [0.3, 0.3])
scr_addParallaxLayer("Backgrounds_far1", defaultParallaxFar, [0.25, 0.25])
scr_addParallaxLayer("Backgrounds_far2", defaultParallaxFar, [0.15, 0.15])
scr_addParallaxLayer("Backgrounds_far3", defaultParallaxFar, [0.05, 0.05])
scr_addParallaxLayer("Backgrounds_farh1", defaultParallaxH, [0.15, 0.05])
scr_addParallaxLayer("Backgrounds_farh2", defaultParallaxH, [0.05, 0.005])
scr_addParallaxLayer("Backgrounds_stillh", defaultParallax, [0.25, 1])
scr_addParallaxLayer("Backgrounds_stilld", defaultParallax, [0, 0])
scr_addParallaxLayer("Backgrounds_cloud", defaultParallax, [1, 0])
scr_addParallaxLayer("Backgrounds_cloud", defaultParallax, [0, 0.99])
scr_addParallaxLayer("Backgrounds_still", defaultParallaxFar, [1, 1])
scr_addParallaxLayer("Backgrounds_still1", defaultParallaxFar, [0.95, 0.95])
scr_addParallaxLayer("Backgrounds_still2", defaultParallaxFar, [0.85, 0.85])
scr_addParallaxLayer("Backgrounds_still3", defaultParallaxFar, [0.70, 0.70])
scr_addParallaxLayer("Assets_BG", defaultParallax, [0.1, 0.1])
scr_addParallaxLayer("Assets_BG1", defaultParallax, [0.05, 0.05])
scr_addParallaxLayer("Assets_BG2", defaultParallax, [0.1, 0.1])

scr_addParallaxLayer("Assets_HBG", defaultParallax, [0.15, 0])
scr_addParallaxLayer("Backgrounds_zigzag1", parallaxZigZagV, [5, 5]);

scr_addParallaxLayer("Backgrounds_far2_zigzag", parallaxZigZagVFar, [0.15, 0.15]);
/*
#region Backgrounds_long1
bg = function(set_array = -4)
{
	var _camera = new camera_get_position_struct(view_camera[0], set_array);
	var array = noone, _zoom = 1; //(camera_get_view_width(view_camera[0]) / 960);
	var lay_y = 0;
	#region Parallax Clamp
	if instance_exists(obj_parallax)
	{
		for (var i = 0; i < array_length(obj_parallax.layers); ++i) 
		{
			if obj_parallax.layers[i] != undefined
			{
				with obj_parallax.layers[i]
				{
					if layer_get_name(layer_id) == "Backgrounds_long1"
					{ 
						lay_y = layer_yoffset;
					}
				}
			}
		}
	}
	#endregion
	array[0] = (_camera.centeredcam_x * (0.25 / _zoom));
	array[1] = clamp(((_camera.centeredcam_y * (0.15 / _zoom)) + lay_y),lay_y - 192,lay_y + 32) - lay_y;
	return array;
}
add_parallax_function("Backgrounds_long1", bg, overwrite);
#endregion
#region Backgrounds_long2
bg = function(set_array = -4)
{
	var _camera = new camera_get_position_struct(view_camera[0], set_array);
	var array = noone, _zoom = 1; //(camera_get_view_width(view_camera[0]) / 960);
	var lay_y = 0;
	#region Parallax Clamp
	if instance_exists(obj_parallax)
	{
		for (var i = 0; i < array_length(obj_parallax.layers); ++i) 
		{
			if obj_parallax.layers[i] != undefined
			{
				with obj_parallax.layers[i]
				{
					if layer_get_name(layer_id) == "Backgrounds_long2"
					{ 
						lay_y = layer_yoffset;
					}
				}
			}
		}
	}
	#endregion
	array[0] = (_camera.centeredcam_x * (0.15 / _zoom));
	array[1] = clamp(((_camera.centeredcam_y * (0.15 / _zoom)) + lay_y), lay_y - 192,lay_y + 32) - lay_y;
	return array;
}
add_parallax_function("Backgrounds_long2", bg, overwrite);
#endregion
*/



}