if (global.canmove && obj_player.steps > requiredSteps)
{
    var inNoZone = false;
    
    with (obj_player)
    {
        inNoZone = place_meeting(x, y, obj_encounter_nozone);
        steps = 0;
    }
    
    if (!inNoZone || xrandom(1) <= noZoneChance)
    {
        if (global.debug)
            //show_debug_message("triggered encounterer " + object_get_name(object_index));
        
        event_user(0);
    }
    else if (global.debug)
    {
        //show_debug_message("nozone'd encounterer " + object_get_name(object_index));
    }
}

if (trackKills && global.canmove)
{
    var currentKills = ds_map_find_value(global.flags, roomFlag);
    
    if (is_undefined(currentKills))
        currentKills = ds_map_find_value(global.flags, "last_killed");
    else
        currentKills += ds_map_find_value(global.flags, "last_killed");
    
    ds_map_set(global.flags, roomFlag, currentKills);
    var preEmpty = empty;
    empty = currentKills >= maxKills;
    
    if (!preEmpty && empty)
    {
        requiredSteps = min(120, requiredSteps);
        
        //if (global.debug)
            //show_debug_message(_string("empty quick steps enabled - new steps: {0}", requiredSteps));
    }
    
    trackKills = false;
}
