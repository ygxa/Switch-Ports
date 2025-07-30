function input_combo_params_set_top_down(argument0, argument1, argument2, argument3, argument4)
{
    static _global = __input_global();
    
    with (_global.__combo_params)
    {
        __reset = false;
        __side_on = false;
        __forward_verb = argument0;
        __counterclockwise_verb = argument1;
        __backward_verb = argument2;
        __clockwise_verb = argument3;
        __reference_direction = argument4;
    }
    
    __input_trace("Combo params set for top-down usage (forward=\"", argument0, "\", counter-clockwise=\"", argument1, "\", backward=\"", argument2, "\", clockwise=\"", argument3, "\", reference direction=", argument4, ")");
}
