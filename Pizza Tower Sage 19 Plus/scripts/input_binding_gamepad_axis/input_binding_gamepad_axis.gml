function input_binding_gamepad_axis(argument0, argument1)
{
    __input_initialize();
    
    if ((os_type == os_switch || ((os_type == os_ios || os_type == os_tvos) && !(false || os_type == os_gxgames))) && (argument0 == 32775 || argument0 == 32776))
        return new __input_class_binding().__set_gamepad_button(argument0);
    
    return new __input_class_binding().__set_gamepad_axis(argument0, argument1);
}
