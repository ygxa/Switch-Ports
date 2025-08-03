if (guiSurface != -1 && surface_exists(guiSurface))
{
    surface_free(guiSurface);
    guiSurface = -1;
}

if (!cleanedUp)
{
    cleanedUp = true;
    game_cleanup();
}

var timeSources = time_source_get_children(1);
var i = 0;
var n = array_length(timeSources);

while (i < n)
{
    time_source_destroy(timeSources[i]);
    i++;
}
