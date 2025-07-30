function __scribble_font_add_all_from_project()
{
    var _i = 0;
    
    repeat (1000)
    {
        if (!font_exists(_i))
            break;
        
        var _skip = false;
        var _tags = asset_get_tags(_i, 7);
        var _j = 0;
        
        repeat (array_length(_tags))
        {
            if (string_lower(_tags[_j]) == "scribble skip")
            {
                _skip = true;
                break;
            }
            
            _j++;
        }
        
        var _name = font_get_name(_i);
        
        if (string_copy(_name, 1, 9) == "__newfont")
            _skip = true;
        
        if (!_skip)
            __scribble_font_add_from_project(_i);
        
        _i++;
    }
}
