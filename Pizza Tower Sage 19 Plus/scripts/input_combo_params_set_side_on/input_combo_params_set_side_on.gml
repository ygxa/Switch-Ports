function input_combo_params_set_side_on(argument0, argument1, argument2)
{
    static _global = __input_global();
    
    with (_global.__combo_params)
    {
        __reset = false;
        __side_on = true;
        __forward_verb = argument0;
        __counterclockwise_verb = undefined;
        __backward_verb = argument1;
        __clockwise_verb = undefined;
        __reference_direction = argument2;
    }
    
    __input_trace("Combo params set for side-on usage (forward=\"", argument0, "\", backward=\"", argument1, "\", reference direction=", argument2, ")");
}
