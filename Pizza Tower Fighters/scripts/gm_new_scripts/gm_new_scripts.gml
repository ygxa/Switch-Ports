function array_concat(a, b) {
    var la = array_length(a);
    var lb = array_length(b);
    var res = array_create(la + lb, 0);
    var i;
    for (i = 0; i < la; i++) res[i] = a[i];
    for (i = 0; i < lb; i++) res[la + i] = b[i];
    return res;
}

function string_split(str, delim) {
    var res = array_create(0, "");
    var dlen = string_length(delim);
    var pos = string_pos(delim, str);
    while (pos > 0) {
        res = array_concat(res, [string_copy(str, 1, pos - 1)]);
        str = string_copy(str, pos + dlen, string_length(str));
        pos = string_pos(delim, str);
    }
    return array_concat(res, [str]);
}

function string_concat(arr, delim) {
    var len = array_length(arr);
    var s = "";
    if (len > 0) s = arr[0];
    for (var i = 1; i < len; i++) s += delim + arr[i];
    return s;
}

function array_contains(arr, val) {
    var len = array_length(arr);
    for (var i = 0; i < len; i++) if (arr[i] == val) return true;
    return false;
}

function is_callable(value) {
	if (value == undefined) 
		return false;
		
	if (is_real(value))
		return script_exists(value);

	return true;
}

function array_filter(arr, predicate) {
    var len = array_length(arr);
    var res = array_create(0, 0);
    for (var i = 0; i < len; i++) {
        if (predicate(arr[i])) res = array_concat(res, [arr[i]]);
    }
    return res;
}

function array_get_index(arr, val) {
    var len = array_length(arr);
    for (var i = 0; i < len; i++) {
        if (arr[i] == val) return i;
    }
    return -1;
}

function struct_exists(_struct) {
    return !is_undefined(_struct) && is_struct(_struct);
}

function variable_clone(src) {
    if ( ds_exists(src, ds_type_list) ) {
        var newList = ds_list_create();
        var len     = ds_list_size(src);
        for (var i = 0; i < len; i++) {
            var v = ds_list_get(src, i);
            ds_list_add(newList, variable_clone(v));
        }
        return newList;
    }
    else if ( ds_exists(src, ds_type_map) ) {
        var newMap = ds_map_create();
        var keys   = ds_map_keys(src);
        var kcount = ds_list_size(keys);
        for (var i = 0; i < kcount; i++) {
            var key = ds_list_get(keys, i);
            var val = ds_map_find_value(src, key);
            ds_map_add(newMap, key, variable_clone(val));
        }
        ds_list_destroy(keys);
        return newMap;
    }
    else if ( is_struct(src) ) {
        var out   = {};
        var names = variable_struct_get_names(src);
        for (var i = 0; i < array_length(names); i++) {
            var f = names[i];
            out[f] = variable_clone(src[f]);
        }
        return out;
    }
    else {
        return src;
    }
}

function array_shuffle(arr) {
    var len = array_length(arr);
    for (var i = len - 1; i > 0; i--) {
        var j = irandom(i);
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    return arr;
}

function variable_get_hash(container, key) {
    if (is_struct(container)) {
        if (variable_exists(container, key)) {
            return variable_get(container, key);
        }
    } else if (is_map(container)) {
        if (ds_map_exists(container, key)) {
            return container[? key];
        }
    }
    return undefined;
}