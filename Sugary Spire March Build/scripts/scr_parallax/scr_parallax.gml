//Functions - making sure
global.ParallaxMap = ds_map_create();


/// @desc This function passes a layer and an associated function.
/// @param {any*} lay_id ID or name of the layer to store.
/// @param {any*} function Function to be run along side the layer.
/// @param {array} [args] Arguments to be passed to the function.

function scr_addParallaxLayer(lay_id, func, args = []) {
	global.ParallaxMap[? lay_id] = { func : func, args : args };
	return;
}

function defaultParallax(parallaxValueH, parallaxValueV) {
	x += camx * parallaxValueH;
	y += camy * parallaxValueV;
}

function defaultParallaxGround(parallaxValueH, parallaxValueV) {
	var _sprite_height = sprite_get_height(layer_background_get_sprite(layer_background_get_id(id)));
	var _height = room_height - _sprite_height;
	var cam_y = clamp(camy, _height - 200, room_height)
	x += camx * parallaxValueH;
	y += (cam_y - clamp(cam_y * (parallaxValueV) * (camera_get_view_height(view_camera[0]) / _height), 0, (_sprite_height - camera_get_view_height(view_camera[0]))));
}

function defaultParallaxH(parallaxValueH, parallaxValueV) {
	x += (camera_get_view_x(view_camera[0]) * parallaxValueH);
	y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * (parallaxValueV) * (camera_get_view_height(view_camera[0]) / room_height), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0]))));
}

function defaultParallaxV(parallaxValueH, parallaxValueV) {
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * (parallaxValueH) * (camera_get_view_width(view_camera[0]) / room_width), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0]))));
	y += (camera_get_view_y(view_camera[0]) * parallaxValueV);
}

function defaultParallaxFar(parallaxValueH, parallaxValueV) {
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * (parallaxValueH) * (camera_get_view_width(view_camera[0]) / room_width), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0]))));
	y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * (parallaxValueV) * (camera_get_view_height(view_camera[0]) / room_height), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0]))));
}

function parallaxZigZagV(parallaxValueH, parallaxValueV) {
	var time = (global.ScrollOffset / 60)
	var _spd = layer_get_vspeed(id),
	var _sin = sin(time) * _spd
	x += (camera_get_view_x(view_camera[0]) * parallaxValueH);
	y += ((camera_get_view_y(view_camera[0]) * parallaxValueV) + _sin);
	y -= yShift
}

function parallaxZigZagVFar(parallaxValueH, parallaxValueV) {
	var time = (global.ScrollOffset / 60)
	var _spd = vspeed,
	var _sin = sin(time) * _spd	
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * (parallaxValueH) * (camera_get_view_width(view_camera[0]) / room_width), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0]))));
	y += _sin + (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * (parallaxValueV) * (camera_get_view_height(view_camera[0]) / room_height), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0]))));
	y -= yShift;
}


