function __input_error()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += _string(argument[_i]);
        _i++;
    }
    
    //show_error("Input 7.0.0:\n" + _string + "\n ", false);
}
