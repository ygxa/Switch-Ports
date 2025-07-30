function input_source_is_available(argument0)
{
    static _global = __input_global();
    
    var _p = 0;
    
    repeat (1)
    {
        if (_global.__players[_p].__source_contains(argument0))
            return false;
        
        _p++;
    }
    
    return true;
}
