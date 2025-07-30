function __input_source_relinquish(argument0)
{
    static _global = __input_global();
    
    var _i = 0;
    
    repeat (1)
    {
        _global.__players[_i].__source_remove(argument0);
        _i++;
    }
}
