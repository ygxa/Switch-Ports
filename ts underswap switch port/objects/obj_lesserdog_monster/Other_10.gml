if (global.bev_subtype == 1)
    offsetUiX = 0;

event_inherited();

switch (global.bev_subtype)
{
    case 2:
        vattacked = true;
        alarm[7] = 10;
        break;
    
    case 0:
        journal_set_health(24, (2 << 0));
        global.areapopulations[global.currentarea]--;
        break;
    
    case 1:
        journal_set_health(24, (1 << 0));
        break;
}
