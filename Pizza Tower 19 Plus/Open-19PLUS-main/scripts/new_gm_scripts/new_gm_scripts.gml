function struct_get_names(s) {
    var ass = json_stringify(s);
    ass = string_delete(string_delete(ass, 1, 1), string_length(ass), 1);
	
    var shit = string_split(ass, ",", false), thingy = [];
    for (var i = 0; i < array_length(shit); i++) {
        array_push(thingy, string_trim(string_replace_all(string_copy(shit[i], 1, string_pos(":", shit[i]) - 1), "\"", "")));
    }
	
    return thingy;
}

function array_shift(arr)
{
	if (array_length(arr) == 0) 
		return undefined;
		
	var first = arr[0];
	var len = array_length(arr);
	var result = array_create(len - 1);

	for (var i = 1; i < len; i++){
		result[i - 1] = arr[i];
	}

	return [first, result];
}