stream = undefined;
destroyAutomatically = false;
destroyInstance = undefined;

load = function(argument0, argument1)
{
    var failure = false;
    
    if (!file_exists(argument0))
        failure = true;
    
    if (!failure)
    {
        try
        {
            stream = audio_create_stream(argument0);
        }
        catch (ex)
        {
            debug_error(ex);
            stream = undefined;
            failure = true;
        }
    }
    
    if (failure)
    {
        instance_destroy();
        return argument1;
    }
    
    return stream;
};

destroyOnEnd = function(argument0)
{
    destroyAutomatically = true;
    destroyInstance = argument0;
};
