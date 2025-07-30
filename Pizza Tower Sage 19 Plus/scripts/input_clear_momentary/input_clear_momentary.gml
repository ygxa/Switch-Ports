function input_clear_momentary(argument0)
{
    static _global = __input_global();
    
    _global.__cleared = argument0;
}
