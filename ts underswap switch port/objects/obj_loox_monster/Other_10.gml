if (global.bev_subtype == 0)
{
    global.journal_kills[5]++;
    global.areapopulations[global.currentarea]--;
    xpReward += (clamp(vpickon, 0, 3) * 5);
}
else if (global.bev_subtype == 1)
{
    journal_spare_counter(5);
}
else if (global.bev_subtype == 2)
{
    alarm[1] = 10;
}

event_inherited();
