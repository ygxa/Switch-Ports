if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (8)
    {
        with (create_debris((x + (random_range(0, 64))), (y + (random_range(0, 64))), particlespr))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_index = random_range(0, (image_number - 1))
            image_speed = 0
        }
    }
    repeat (3)
    {
        with (instance_create((x + (random_range(0, 64))), (y + (random_range(0, 64))), obj_parryeffect))
        {
        }
    }
    scr_soundeffect(choose(sfx_breakblock1,sfx_breakblock2))
    if (particlespr == spr_bottledebris)
        scr_soundeffect(sfx_bottledestroy)
    ds_list_add(global.saveroom, id)
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
scr_destroy_tiles(32, "Tiles_Foreground1")
scr_destroy_tiles(32, "Tiles_Foreground2")
scr_destroy_tiles(32, "Tiles_Bottle")
scr_destroy_nearby_tiles()
