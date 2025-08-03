if (stream != undefined)
{
    if (destroyAutomatically && !audio_is_playing(destroyInstance))
        instance_destroy();
}
else
{
    instance_destroy();
}
