function scr_queue_tvanim(argument0 = -4, argument1 = 150)
{
    ds_queue_enqueue(global.newhudtvanim, argument0);
    ds_queue_enqueue(global.newhudtvanim, argument1);
}

function scr_forceplay_tvanim(argument0 = -4, argument1 = 150)
{
    obj_tv.tvsprite = ds_queue_dequeue(argument0);
    obj_tv.tvlength = ds_queue_dequeue(argument1);
    ds_queue_clear(global.newhudtvanim);
}
