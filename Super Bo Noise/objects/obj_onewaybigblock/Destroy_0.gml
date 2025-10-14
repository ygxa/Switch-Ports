if (room == rm_blank)
    return;
if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create((x + 32), (y + 32), obj_baddieDead))
        sprite_index = spr_bigdoughblockdead
    scr_sleep(5)
    scr_soundeffect(choose(sfx_breakblock1,sfx_breakblock2))
    ds_list_add(global.saveroom, id)
}
instance_destroy(solid_inst)
