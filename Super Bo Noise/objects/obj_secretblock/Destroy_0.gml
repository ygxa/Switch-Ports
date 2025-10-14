if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (2)
    {
        with (create_debris((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_height))), particlespr))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0
            image_index = irandom_range(0, 3)
        }
    }
    with (instance_create((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_height))), obj_parryeffect))
    {
    }
    scr_soundeffect(choose(sfx_breakblock1,sfx_breakblock2))
    ds_list_add(global.saveroom, id)
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
scr_destroy_tiles(32, "Tiles_Foreground1")
scr_destroy_tiles(32, "Tiles_Foreground2")
scr_destroy_nearby_tiles()
