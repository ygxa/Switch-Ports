function __scribble_get_state()
{
    static _struct = 
    {
        __frames: 0,
        __default_font: "scribble_fallback_font",
        __blink_on_duration: 50,
        __blink_off_duration: 50,
        __blink_time_offset: 0,
        __standard_anim_desync: false,
        __standard_anim_desync_to_default: false,
        __standard_anim_default: false,
        __msdf_anim_desync: false,
        __msdf_anim_desync_to_default: false,
        __msdf_anim_default: false,
        __msdf_thickness_offset: 0,
        __markdown_styles_struct: {}
    };
    
    return _struct;
}
