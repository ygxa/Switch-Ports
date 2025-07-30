instance_destroy();

with (playerid)
{
    if (!isgustavo)
        state = 2;
    else
        state = 193;
    
    visible = true;
}

with (obj_ghostfollow)
{
    x = xstart;
    y = ystart;
}
