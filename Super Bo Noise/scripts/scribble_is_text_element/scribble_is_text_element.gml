function scribble_is_text_element(argument0)
{
    return is_struct(argument0) && instanceof(argument0) == "__scribble_class_element";
}
