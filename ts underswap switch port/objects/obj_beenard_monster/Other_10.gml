if (global.bev_subtype == 0)
{
    journal_set_health(20, (2 << 0));
    global.areapopulations[global.currentarea]--;
}
else if (global.bev_subtype == 1)
{
    journal_set_health(20, (1 << 0));
    offsetUiX = 0;
    image_speed = 0;
    image_index = 0;
}
else if (global.bev_subtype == 2)
{
    alarm[2] = 10;
}

event_inherited();
