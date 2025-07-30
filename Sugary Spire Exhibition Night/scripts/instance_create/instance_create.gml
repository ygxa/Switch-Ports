function instance_create(x, y, obj, var_struct = undefined) {
    if (!is_undefined(var_struct)) {
        return instance_create_depth(x, y, 0, obj, var_struct);
    }
 
    return instance_create_depth(x, y, 0, obj);
}
