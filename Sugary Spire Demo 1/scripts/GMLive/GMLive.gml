function gml_macro(argument0, argument1, argument2, argument3) constructor
{
    static h_name = undefined;
    static h_node = undefined;
    static h_is_expr = undefined;
    static h_is_stat = undefined;
    static __class__ = global.mt_gml_macro;
}

function gml_source(argument0, argument1, argument2, argument3) constructor
{
    static h_name = undefined;
    static h_code = undefined;
    static h_main = undefined;
    static h_length = undefined;
    static h_opt = undefined;
    static h_tokens = undefined;
    static h_token_count = undefined;
    static h___eof = undefined;
    
    static h_get_eof = function()
    {
        return undefined;
    };
    
    static h_to_string = function()
    {
        return undefined;
    };
    
    static __class__ = global.mt_gml_source;
    
    if (argument3 == undefined)
        argument3 = false;
}

function shader_set_live(argument0, argument1)
{
}

function live_validate_scripts()
{
}

global.gml_thread_status_none = [0];
global.gml_thread_status_running = [1];
global.gml_thread_status_waiting = [2];
global.gml_thread_status_done = [3];
global.gml_thread_status_error = [4];
