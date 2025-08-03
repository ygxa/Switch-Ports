if (global.bev_subtype == 0)
{
    global.journal_kills[3]++;
    global.areapopulations[global.currentarea]--;
}
else if (global.bev_subtype == 1)
{
    journal_spare_counter(3);
    
    with (head)
    {
        path_end();
        x = 0;
        y = 0;
        image_speed = 0;
        image_index = 0;
    }
}
else if (global.bev_subtype == 2)
{
    alarm[0] = 10;
}

event_inherited();
