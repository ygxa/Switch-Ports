function scr_tilttile()
{
    static rm = room;
    
    exit;
    
    if (!layer_exists("Tiles_1") || room == mansion_9)
        exit;
    
    gpu_set_blendenable(false);
    var MAX_IT = 3;
    var update = false;
    var tilew, tileh, tilemap;
    
    if (rm != room)
    {
        rm = room;
        tilemap = layer_tilemap_get_id(layer_get_id("Tiles_1"));
        tilew = tilemap_get_width(tilemap) - 1;
        tileh = tilemap_get_height(tilemap) - 1;
        update = true;
    }
    
    for (var i = 0; i < array_length(tiltsurf); i++)
    {
        if (!surface_exists(tiltsurf[i]))
        {
            if (!update)
            {
                tilemap = layer_tilemap_get_id(layer_get_id("Tiles_1"));
                tilew = tilemap_get_width(tilemap) - 1;
                tileh = tilemap_get_height(tilemap) - 1;
                update = true;
            }
            
            if (i < 2)
                tiltsurf[i] = surface_create((tilew + 3) * 32, 32 * MAX_IT);
            else
                tiltsurf[i] = surface_create(32 * MAX_IT, (tileh + 1) * 32);
        }
    }
    
    if (update)
    {
        for (var i = 0; i < array_length(tiltsurf); i++)
        {
            if (i < 2 && (surface_get_width(tiltsurf[i]) != ((tilew + 1) * 32) || surface_get_height(tiltsurf[i]) != 32))
                surface_resize(tiltsurf[i], (tilew + 3) * 32, 32 * MAX_IT);
            else if (surface_get_width(tiltsurf[i]) != 32 || surface_get_height(tiltsurf[i]) != ((tileh + 1) * 32))
                surface_resize(tiltsurf[i], 32 * MAX_IT, (tileh + 1) * 32);
            
            surface_set_target(tiltsurf[i]);
            draw_clear_alpha(c_black, 0);
            surface_reset_target();
        }
        
        var tileset = tilemap_get_tileset(tilemap);
        
        for (var i = -2; i <= tilew; i++)
        {
            var tile1 = tilemap_get(tilemap, clamp(i + 1, 0, tilew), 0);
            var tile2 = tilemap_get(tilemap, clamp(i + 1, 0, tilew), tileh);
            
            for (var r = 0; r < MAX_IT; r++)
            {
                surface_set_target(tiltsurf[0]);
                
                if (tile1 != -1)
                    draw_tile(tileset, tile1, 0, (i + 2) * 32, r * 32);
                
                surface_reset_target();
                surface_set_target(tiltsurf[1]);
                
                if (tile2 != -1)
                    draw_tile(tileset, tile2, 0, (i + 2) * 32, r * 32);
                
                surface_reset_target();
            }
        }
        
        for (var i = 0; i <= tileh; i++)
        {
            var tile1 = tilemap_get(tilemap, 0, i);
            var tile2 = tilemap_get(tilemap, tilew, i);
            surface_set_target(tiltsurf[2]);
            
            for (var r = 0; r < MAX_IT; r++)
            {
                if (tile1 != -1)
                    draw_tile(tileset, tile1, 0, r * 32, i * 32);
            }
            
            surface_reset_target();
            surface_set_target(tiltsurf[3]);
            
            for (var r = 0; r < MAX_IT; r++)
            {
                if (tile2 != -1)
                    draw_tile(tileset, tile2, 0, r * 32, i * 32);
            }
            
            surface_reset_target();
        }
    }
    
    draw_surface(tiltsurf[0], -32, -32 * MAX_IT);
    draw_surface(tiltsurf[1], -32, room_height);
    draw_surface(tiltsurf[2], -32 * MAX_IT, 0);
    draw_surface(tiltsurf[3], room_width, 0);
    gpu_set_blendenable(true);
}
