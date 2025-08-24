/// @description eas_file_is_read(handle)
/// @param handle
function eas_file_is_read(argument0) {
	gml_pragma("forceinline"); // it's recommended to inline one-line scripts for YYC.
	return ds_map_find_value(argument0, "is_read");



}
