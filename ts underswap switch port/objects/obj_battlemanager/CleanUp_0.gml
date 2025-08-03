if (hpBarSurface != -1 && surface_exists(hpBarSurface))
    surface_free(hpBarSurface);

var k = ds_map_find_first(statQueue);

while (!is_undefined(k))
{
    var list = ds_map_find_value(statQueue, k);
    ds_list_destroy(list);
    k = ds_map_find_next(statQueue, k);
}

ds_map_destroy(statQueue);

if (boxSurfaceTransform != -1 && surface_exists(boxSurfaceTransform))
    surface_free(boxSurfaceTransform);

ds_list_destroy(boxObjectsTransform);

if (boxSurfaceCutoff != -1 && surface_exists(boxSurfaceCutoff))
    surface_free(boxSurfaceCutoff);

ds_list_destroy(boxObjectsCutoff);
ds_list_destroy(boxObjectsPost);
