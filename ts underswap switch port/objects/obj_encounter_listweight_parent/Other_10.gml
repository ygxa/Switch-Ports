if (global.areapopulations[global.currentarea] <= 0)
{
    bt_start(allDeadEncounter);
}
else if (empty)
{
    bt_start_noone();
}
else
{
    var sum = 0;
    var len = array_length(encounterWeights);
    var fixedWeights = array_create(len);
    
    for (var i = 0; i < len; i++)
    {
        fixedWeights[i] = sum;
        sum += encounterWeights[i];
    }
    
    var r = xrandom(sum);
    var sel = -1;
    var prev = -1;
    
    for (var i = 0; i < len; i++)
    {
        var curr = fixedWeights[i];
        
        if (r >= curr && curr > prev)
        {
            sel = i;
            prev = curr;
        }
    }
    
    bt_start(encounters[sel]);
    ds_map_set(global.flags, "last_killed", 0);
    trackKills = true;
}

alarm[0] = 1;
