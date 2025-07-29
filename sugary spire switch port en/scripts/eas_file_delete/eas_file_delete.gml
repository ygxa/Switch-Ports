/// @description eas_file_delete(filename)
/// @param filename
function eas_file_delete(argument0) {
	if (!global.EAS_needasync) return eas_file_delete(argument0);

	ds_map_delete(global.EAS_map, eas_safe_path(argument0));



}
