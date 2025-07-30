function __input_class_icon_category(argument0) constructor
{
    static add = function(argument0, argument1)
    {
        static _a = __input_binding_get_label("gamepad button", 32769, false);
        static _b = __input_binding_get_label("gamepad button", 32770, false);
        
        if (__swap_ab)
        {
            if (argument0 == _a)
                argument0 = _b;
            else if (argument0 == _b)
                argument0 = _a;
        }
        
        variable_struct_set(__dictionary, argument0, argument1);
        return self;
    };
    
    __name = argument0;
    __dictionary = {};
    __swap_ab = __input_gamepad_type_swap_ab(argument0);
}
