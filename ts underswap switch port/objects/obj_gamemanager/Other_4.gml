if (!room_persistent && instance_exists(obj_player))
{
    if (global.flags != undefined && ds_exists(global.flags, ds_type_map))
    {
        if (ds_map_find_value(global.flags, "plot") >= 40 && ds_map_find_value(global.flags, "plot") < 67 && !ds_map_find_value(global.flags, "run"))
        {
            ds_map_set(global.flags, "run", true);
            
            if (!item_exists(16))
                items_add(16);
        }
        
        if (!ds_map_find_value(global.flags, "st_appatch") && item_exists(26))
            ds_map_set(global.flags, "st_appatch", true);
        
        if (global.journal_health[28] == (2 << 0) && !ds_map_find_value(global.flags, "st_lar_dead"))
        {
            ds_map_set(global.flags, "st_lar_dead", true);
            global.playerkills++;
        }
    }
    
    if (global.draw_dark_tiles && !drawDarkTilesEnable)
        global.draw_dark_tiles = false;
    else
        drawDarkTilesEnable = false;
}

music_modifier_gain(1);

if (textHandler != undefined && !textHandlerBound)
{
    textHandler = undefined;
    sceneEndHandler = undefined;
    sceneWaitHandler = undefined;
}
else
{
    textHandlerBound = false;
}

if (global.reset_state_on_room_start)
{
    room_persistent = false;
    global.undo_room_persistence = false;
    global.reset_state_on_room_start = false;
    var f = instance_create(obj_fader);
    f.toSolid = false;
    f.alpha = 1;
    
    if (instance_exists(global.currentmusic) && global.currentmusic.filename != "thedead")
    {
        f.fadeMusic = true;
        f.maxMusicVolume = global.ow_music_reset_volume;
        global.gev_type = 0;
        
        with (f)
            event_user(10);
    }
    
    f.color = global.fader_color_on_room_start;
    global.fader_color_on_room_start = 0;
    f.fadeSpeed = global.fader_speed_on_room_start;
    f.borderFadeSpeed = true;
    global.fader_speed_on_room_start = 0.1;
    
    if (global.resume_scene_on_room_start != undefined)
    {
        dx_scene(global.resume_scene_on_room_start);
        global.resume_scene_on_room_start = undefined;
    }
    else
    {
        global.canmove = true;
    }
}

if (global.fader_on_room_start)
{
    global.fader_on_room_start = false;
    var f = instance_create(obj_fader);
    f.toSolid = false;
    f.alpha = 1;
    f.color = global.fader_color_on_room_start;
    global.fader_color_on_room_start = 0;
    f.fadeSpeed = global.fader_speed_on_room_start;
    f.borderFadeSpeed = true;
    global.fader_speed_on_room_start = 0.1;
}

if (global.savespawn_on_room_start)
{
    global.savespawn_on_room_start = false;
    
    with (obj_save_spawn)
    {
        with (obj_player)
        {
            x = other.x;
            y = other.y;
        }
    }
}

if (global.entrancespawn_on_room_start != -1)
{
    with (obj_entrance)
    {
        if (entranceId == global.entrancespawn_on_room_start)
        {
            with (obj_player)
            {
                x = other.x;
                y = other.y;
            }
            
            break;
        }
    }
    
    global.canmove = true;
    global.entrancespawn_on_room_start = -1;
}

if (global.player_direction_on_room_start != 4)
{
    with (obj_player)
        lookDirection = global.player_direction_on_room_start;
    
    global.player_direction_on_room_start = 4;
}

if (global.scene_on_room_start_override)
{
    global.scene_on_room_start_override = false;
    global.canmove = false;
}

if (global.freeze_on_room_start > 0)
    global.canmove = false;

alarm[4] = 1;
viewWaitFrame = true;
viewXOffset = 0;
viewYOffset = 0;

if (global.name_dr)
{
    if (asset_has_tags(room, ["no_dr_text"], 3))
    {
        global._draw_text = draw_text;
        global._draw_text_transformed = draw_text_transformed;
    }
    else
    {
        global._draw_text = draw_text_dr;
        global._draw_text_transformed = draw_text_transformed_dr;
    }
}

var layers = layer_get_all();
var layerCount = array_length(layers);

for (var i = 0; i < layerCount; i++)
{
    var l = layers[i];
    var layerName = layer_get_name(l);
    
    if (layerName == "StaticSprites")
    {
        var elems = layer_get_all_elements(l);
        var len = array_length(elems);
        
        for (var j = 0; j < len; j++)
        {
            var curr = elems[j];
            
            if (layer_get_element_type(curr) == 4)
            {
                with (instance_create_xy(layer_sprite_get_x(curr), layer_sprite_get_y(curr), obj_staticsprite))
                {
                    sprite_index = layer_sprite_get_sprite(curr);
                    image_index = layer_sprite_get_index(curr);
                    image_speed = layer_sprite_get_speed(curr);
                    image_xscale = layer_sprite_get_xscale(curr);
                    image_yscale = layer_sprite_get_yscale(curr);
                    image_angle = layer_sprite_get_angle(curr);
                    image_blend = layer_sprite_get_blend(curr);
                    image_alpha = layer_sprite_get_alpha(curr);
                }
                
                layer_sprite_destroy(curr);
            }
        }
    }
    else if (string_starts_with(layerName, "StaticSpritesDummyLayer_Lang"))
    {
        var elems = layer_get_all_elements(l);
        var len = array_length(elems);
        
        for (var j = 0; j < len; j++)
        {
            var curr = elems[j];
            
            if (layer_get_element_type(curr) == 4)
            {
                with (instance_create_layer(layer_sprite_get_x(curr), layer_sprite_get_y(curr), l, obj_lang_staticsprite_dummy, 
                {
                    sprite: layer_sprite_get_sprite(curr)
                }))
                {
                    image_index = layer_sprite_get_index(curr);
                    image_speed = layer_sprite_get_speed(curr);
                    image_xscale = layer_sprite_get_xscale(curr);
                    image_yscale = layer_sprite_get_yscale(curr);
                    image_angle = layer_sprite_get_angle(curr);
                    image_blend = layer_sprite_get_blend(curr);
                    image_alpha = layer_sprite_get_alpha(curr);
                }
                
                layer_sprite_destroy(curr);
            }
        }
    }
    else if (string_starts_with(layerName, "StaticSpritesDummy_Lang"))
    {
        var elems = layer_get_all_elements(l);
        var len = array_length(elems);
        var layerDepth = layer_get_depth(l);
        
        for (var j = 0; j < len; j++)
        {
            var curr = elems[j];
            
            if (layer_get_element_type(curr) == 4)
            {
                with (instance_create_depth(layer_sprite_get_x(curr), layer_sprite_get_y(curr), layerDepth, obj_lang_staticsprite_dummy, 
                {
                    sprite: layer_sprite_get_sprite(curr)
                }))
                {
                    image_index = layer_sprite_get_index(curr);
                    image_speed = layer_sprite_get_speed(curr);
                    image_xscale = layer_sprite_get_xscale(curr);
                    image_yscale = layer_sprite_get_yscale(curr);
                    image_angle = layer_sprite_get_angle(curr);
                    image_blend = layer_sprite_get_blend(curr);
                    image_alpha = layer_sprite_get_alpha(curr);
                }
                
                layer_sprite_destroy(curr);
            }
        }
    }
    else if (string_starts_with(layerName, "StaticSpritesDummyLayer"))
    {
        var elems = layer_get_all_elements(l);
        var len = array_length(elems);
        
        for (var j = 0; j < len; j++)
        {
            var curr = elems[j];
            
            if (layer_get_element_type(curr) == 4)
            {
                with (instance_create_layer(layer_sprite_get_x(curr), layer_sprite_get_y(curr), l, obj_staticsprite_dummy))
                {
                    sprite_index = layer_sprite_get_sprite(curr);
                    image_index = layer_sprite_get_index(curr);
                    image_speed = layer_sprite_get_speed(curr);
                    image_xscale = layer_sprite_get_xscale(curr);
                    image_yscale = layer_sprite_get_yscale(curr);
                    image_angle = layer_sprite_get_angle(curr);
                    image_blend = layer_sprite_get_blend(curr);
                    image_alpha = layer_sprite_get_alpha(curr);
                }
                
                layer_sprite_destroy(curr);
            }
        }
    }
    else if (string_starts_with(layerName, "StaticSpritesDummy"))
    {
        var elems = layer_get_all_elements(l);
        var len = array_length(elems);
        var layerDepth = layer_get_depth(l);
        
        for (var j = 0; j < len; j++)
        {
            var curr = elems[j];
            
            if (layer_get_element_type(curr) == 4)
            {
                with (instance_create_depth(layer_sprite_get_x(curr), layer_sprite_get_y(curr), layerDepth, obj_staticsprite_dummy))
                {
                    sprite_index = layer_sprite_get_sprite(curr);
                    image_index = layer_sprite_get_index(curr);
                    image_speed = layer_sprite_get_speed(curr);
                    image_xscale = layer_sprite_get_xscale(curr);
                    image_yscale = layer_sprite_get_yscale(curr);
                    image_angle = layer_sprite_get_angle(curr);
                    image_blend = layer_sprite_get_blend(curr);
                    image_alpha = layer_sprite_get_alpha(curr);
                }
                
                layer_sprite_destroy(curr);
            }
        }
    }
    else if (layerName == "StaticSprites_Lang")
    {
        var elems = layer_get_all_elements(l);
        var len = array_length(elems);
        var layerDepth = layer_get_depth(l);
        
        for (var j = 0; j < len; j++)
        {
            var curr = elems[j];
            
            if (layer_get_element_type(curr) == 4)
            {
                with (instance_create_depth(layer_sprite_get_x(curr), layer_sprite_get_y(curr), layerDepth, obj_lang_staticsprite_instant, 
                {
                    sprite: layer_sprite_get_sprite(curr)
                }))
                {
                    image_index = layer_sprite_get_index(curr);
                    image_speed = layer_sprite_get_speed(curr);
                    image_xscale = layer_sprite_get_xscale(curr);
                    image_yscale = layer_sprite_get_yscale(curr);
                    image_angle = layer_sprite_get_angle(curr);
                    image_blend = layer_sprite_get_blend(curr);
                    image_alpha = layer_sprite_get_alpha(curr);
                }
                
                layer_sprite_destroy(curr);
            }
        }
    }
    else
    {
        var depthPos = string_pos("SetDepth_", layerName);
        
        if (depthPos > 0)
            layer_depth(l, -real(string_delete(layerName, 1, depthPos + 8)));
    }
}
