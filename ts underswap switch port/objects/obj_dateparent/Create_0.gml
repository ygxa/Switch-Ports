state = 0;
selectedChoice = -1;
incStateCallback = false;
incStateCallbackThisFrame = false;
borderLeft = 0;
borderRight = 0;
borderTop = 0;
borderBottom = 0;
borderCurrentlyDrawing = false;
borderCutoff = false;
borderCutoffObjects = ds_list_create();
borderCutoffSurface = -1;

setSkip = function(argument0)
{
    with (obj_hangoutmanager)
        canSkip = argument0;
};

drawBorderObjectsToSurface = function()
{
    if (borderCutoff)
    {
        if (borderCutoffSurface == -1 || !surface_exists(borderCutoffSurface))
            borderCutoffSurface = surface_create(1024, 512);
        
        surface_set_target(borderCutoffSurface);
        draw_clear_alpha(c_black, 0);
        borderCurrentlyDrawing = true;
        var count = ds_list_size(borderCutoffObjects);
        
        for (var i = 0; i < count; i++)
        {
            with (ds_list_find_value(borderCutoffObjects, i))
                event_perform(ev_draw, ev_draw_begin);
        }
        
        ds_list_clear(borderCutoffObjects);
        borderCurrentlyDrawing = false;
        surface_reset_target();
    }
    else if (borderCutoffSurface != -1 && surface_exists(borderCutoffSurface))
    {
        surface_free(borderCutoffSurface);
        borderCutoffSurface = -1;
    }
};
