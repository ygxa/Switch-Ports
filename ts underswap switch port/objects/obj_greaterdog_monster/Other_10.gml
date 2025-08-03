if (global.bev_subtype == 0)
    dustFilename = vout ? "si_gd2" : "si_gd";

event_inherited();

switch (global.bev_subtype)
{
    case 2:
        alarm[7] = 10;
        break;
    
    case 0:
        visible = true;
        ded = true;
        goldReward += 20;
        journal_set_health(26, (2 << 0));
        
        if (ds_map_find_value(global.flags, "plot") < 57)
            global.areapopulations[global.currentarea]--;
        
        break;
    
    case 1:
        journal_set_health(26, (1 << 0));
        break;
}
