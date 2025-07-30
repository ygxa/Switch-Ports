function __input_gamepad_type_swap_ab(argument0)
{
    static _global = __input_global();
    
    if (_global.__ps_region_swap)
        return true;
    
    switch (argument0)
    {
        case "switch":
        case "switch joycon left":
        case "switch joycon right":
        case "super famicom":
        case "8bitdo":
        case "snes":
            return false;
            break;
    }
    
    return false;
}
