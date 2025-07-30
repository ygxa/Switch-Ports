function input_accessibility_global_toggle_set(argument0)
{
    static _global = __input_global();
    
    _global.__toggle_momentary_state = argument0;
}
