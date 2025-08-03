if (stream != undefined)
{
    if (global.debug)
        //show_debug_message(_string("localization: clearing stream {0}", stream));
    
    audio_destroy_stream(stream);
    stream = undefined;
}
