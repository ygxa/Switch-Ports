if (surface_exists(surf))
    surface_free(surf);

if (buffer_exists(surfbuffer))
    buffer_delete(surfbuffer);

ds_map_destroy(dialoguemap);
