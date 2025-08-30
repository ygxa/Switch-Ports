function scribble_typists_add_event(_name, _function)
{
    static _system                = __scribble_initialize();
    static _effects_map           = _system.__effects_map;
    static _macros_map            = _system.__macros_map;
    static _typewriter_events_map = _system.__typewriter_events_map;

    
    _typewriter_events_map[? _name] = _function;
}

function __scribble_initialize()
{
	static _sys = undefined;
	if (is_undefined(_sys)) {
		var _typewriter_events_map = ds_map_create();
		_typewriter_events_map[? "pause"]  = undefined;
		_typewriter_events_map[? "delay"]  = undefined;
		_typewriter_events_map[? "sync"]   = undefined;
		_typewriter_events_map[? "speed"]  = undefined;
		_typewriter_events_map[? "/speed"] = undefined;

		var _macros_map = ds_map_create();

		var _effects_map = ds_map_create();
		_effects_map[? "wave"]    = 1;
		_effects_map[? "shake"]   = 2;
		_effects_map[? "rainbow"] = 3;
		_effects_map[? "wobble"]  = 4;
		_effects_map[? "pulse"]   = 5;
		_effects_map[? "wheel"]   = 6;
		_effects_map[? "cycle"]   = 7;
		_effects_map[? "jitter"]  = 8;
		_effects_map[? "blink"]   = 9;
		_effects_map[? "slant"]   = 10;

		_sys = {
			__typewriter_events_map: _typewriter_events_map,
			__macros_map:            _macros_map,
			__effects_map:           _effects_map
		};
	}
	
	return _sys;
}

function scribble_typist(_per_line = false)
{
    return new __scribble_class_typist(_per_line);
}

function __scribble_class_typist(_per_line) constructor{
	__in         = undefined;
	__last_element = undefined;	
	
	
	
	
    static function_per_char = function(_function)
    {
        __function_per_char = _function;
        
        return self;
    }
	
    static pause = function()
    {
        __paused = true;
        
        return self;
    }

    static in = function(_speed, _smoothness)
    {
        var _old_in = __in;
        
        __in         = true;
        __backwards  = false;
        __speed      = _speed;
        __smoothness = _smoothness;
        __skip       = false;
        
        if ((_old_in == undefined) || !_old_in) reset();
        
        return self;
    }
	
    static reset = function()
    {
        __last_page            = 0;
        __last_character       = 0;
        __last_audio_character = 0;
        
        __last_tick_frame = -infinity;
        
        __window_index     = 0;
        __window_array     = array_create(2*3, -__smoothness); __window_array[@ 0] = 0;
        __paused           = false;
        __delay_paused     = false;
        __delay_end        = -1;
        __inline_speed     = 1;
        __event_stack      = [];
        __skip             = false;
        __drawn_since_skip = false;
        
        return self;
    }
	
    static get_paused = function()
    {
        return __paused;
    }

    static unpause = function()
    {
        if (__paused)
        {
            var _head_pos = __window_array[__window_index];
            
            //Increment the window index
            __window_index = (__window_index + 2) mod (2*3);
            __window_array[@ __window_index  ] = _head_pos;
            __window_array[@ __window_index+1] = _head_pos - __smoothness;
        }
        __skip = false;
        __paused = false;
        
        return self;
    }

    static get_state = function()
    {
        if ((__last_element == undefined) || (__last_page == undefined) || (__last_character == undefined)) return 0.0;
        if (__in == undefined) return 1.0;
        
        if (!weak_ref_alive(__last_element)) return 2.0; //If there's no element then report that the element is totally faded out
        
        var _model = __last_element.ref.__get_model(true);
        if (!is_struct(_model)) return 2.0; //If there's no model then report that the element is totally faded out
        
        var _pages_array = _model.__get_page_array();
        if (array_length(_pages_array) <= __last_page) return 1.0;
        var _page_data = _pages_array[__last_page];
        
        var _max = __per_line? _page_data.__line_count : _page_data.__character_count;
        if (_max <= 0) return 1.0;
        
        var _t = clamp((__window_array[__window_index] + max(0, __window_array[__window_index+1] + __smoothness - _max)) / (_max + __smoothness), 0, 1);
        
        if (__in)
        {
            if (__delay_paused || (array_length(__event_stack) > 0))
            {
                //If we're waiting for a delay or there's something in our delay stack we need to process, limit our return value to just less than 1.0
                return min(1 - 2*math_get_epsilon(), _t);
            }
            else
            {
                return _t;
            }
        }
        else
        {
            return _t + 1;
        }
    }
}