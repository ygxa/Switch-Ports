if active
{
    with (obj_player1)
    {
        state = (148 << 0)
        hsp = 0
        vsp = 0
        visible = false
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_pizzaportal_appear:
            scr_soundeffect(sfx_secretexit)
            sprite_index = spr_pizzaportalentrancestart
            break
        case spr_pizzaportalentrancestart:
            sprite_index = spr_pizzaportal_disappear
            with (obj_player1)
            {
                state = (2 << 0)
                if (room == water_9)
                    state = (270 << 0)
                visible = true
            }
            active = 0
            break
        case spr_pizzaportal_disappear:
            instance_create_unique(0, 0, obj_lap2visual)
            instance_destroy()
            break
    }

}
