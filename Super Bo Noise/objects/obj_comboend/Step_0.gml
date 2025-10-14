if (room == rank_room || room == timesuproom)
{
    visible = false
    instance_destroy()
    return;
}
if (timer > 0)
    timer--
else
{
    timer = timer_max
    if (comboscore > 0)
    {
        if (combominus <= 1)
            combominus = 1
        comboscore -= round(combominus)
        if (comboscore < 0)
            comboscore = 0
        create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect))
    }
    else if (alarm[1] == -1)
        alarm[1] = 50
}
if (global.combotime > 0 && global.combo > 0)
    y = approach(y, (ystart + 100), 10)
title_index += 0.35
if (title_index >= 2)
    title_index = frac(title_index)
title = clamp(title, 0, 16)
