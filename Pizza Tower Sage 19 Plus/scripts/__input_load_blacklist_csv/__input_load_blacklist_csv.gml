var _row_array = __input_csv_to_array(_string);
var _count     = 0;

for (var _y = 0, _n = array_length(_row_array); _y < _n; _y++) {
    var _column_array = _row_array[_y];
    if (array_length(_column_array) < 2) continue;

    var _os          = _column_array[0];
    var _filter_type = _column_array[1];
    var _os_struct   = variable_struct_get(_global.__blacklist_dictionary, _os);

    if (!is_struct(_os_struct)) {
        _os_struct = {};
        variable_struct_set(_global.__blacklist_dictionary, _os, _os_struct);
    }

    if (_filter_type == "description contains") {
        var _filter_array = variable_struct_get(_os_struct, _filter_type);
        if (!is_array(_filter_array)) {
            _filter_array = [];
            variable_struct_set(_os_struct, _filter_type, _filter_array);
        }
        for (var i = 2; i < array_length(_column_array); i++) {
            array_push(_filter_array, _column_array[i]);
            _count++;
        }
    }
    else {
        var _filter_struct = variable_struct_get(_os_struct, _filter_type);
        if (!is_struct(_filter_struct)) {
            _filter_struct = {};
            variable_struct_set(_os_struct, _filter_type, _filter_struct);
        }
        for (var i = 2; i < array_length(_column_array); i++) {
            variable_struct_set(_filter_struct, _column_array[i], true);
            _count++;
        }
    }
}
