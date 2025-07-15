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

function is_callable(value){
	return script_exists(value)
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
