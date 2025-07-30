function input_is_virtual(argument0)
{
    if (!is_struct(argument0))
        return false;
    
    return !argument0.__destroyed;
}
