if (obj_guntarget.selectorIndex < 2)
{
    with (obj_guntarget)
    {
        selectorIndex++;
        
        if (selectorIndex == 1)
            alarm_set(0, 5);
    }
}
