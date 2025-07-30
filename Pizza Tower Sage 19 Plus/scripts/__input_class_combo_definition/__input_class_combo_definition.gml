function __input_class_combo_definition(argument0, argument1, argument2) constructor
{
    static __global = __input_global();
    
    static ignore = function(argument0)
    {
        if (argument0 == -3)
            argument0 = __global.__basic_verb_array;
        
        var _i = 0;
        
        repeat (array_length(argument0))
        {
            var _verb = argument0[_i];
            
            if (!variable_struct_exists(__used_dict, _verb))
                variable_struct_set(__ignore_dict, _verb, true);
            
            _i++;
        }
        
        return self;
    };
    
    static __remove_ignored = function(argument0)
    {
        variable_struct_remove(__ignore_dict, argument0);
        variable_struct_set(__used_dict, argument0, true);
    };
    
    static press = function(argument0)
    {
        __remove_ignored(argument0);
        array_push(__phase_array, 
        {
            __type: (0 << 0),
            __verb: argument0
        });
        return self;
    };
    
    static release = function(argument0)
    {
        __remove_ignored(argument0);
        array_push(__phase_array, 
        {
            __type: (1 << 0),
            __verb: argument0
        });
        return self;
    };
    
    static press_or_release = function(argument0)
    {
        __remove_ignored(argument0);
        array_push(__phase_array, 
        {
            __type: (2 << 0),
            __verb: argument0
        });
        return self;
    };
    
    static hold = function(argument0)
    {
        __remove_ignored(argument0);
        array_push(__phase_array, 
        {
            __type: (3 << 0),
            __verb: argument0
        });
        return self;
    };
    
    static charge = function(argument0, argument1 = 60)
    {
        __remove_ignored(argument0);
        array_push(__phase_array, 
        {
            __type: (4 << 0),
            __verb: argument0,
            __min_time: argument1
        });
        return self;
    };
    
    __name = argument0;
    __phase_timeout = argument1;
    __directional = argument2;
    __ignore_dict = {};
    __used_dict = {};
    __phase_array = [];
}
