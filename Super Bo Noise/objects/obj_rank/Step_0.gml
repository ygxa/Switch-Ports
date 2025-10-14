if (floor(image_index) == (image_number - 1))
{
    if (sprite_index == spr_rankNP && brownfade >= 1)
    {
        sprite_index = spr_rankp_Endloop
        image_speed = 1
        image_index = 0
    }
    if (sprite_index != spr_rankp_Endloop)
        image_speed = 0
}
if (!set)
{
    if (global.collect >= global.collectN)
    {
        if (obj_player1.character == "P" && obj_player1.ispeppino)
        {
            if (global.rank == "s")
                sprite_index = spr_rankNS
            if (global.rank == "a")
                sprite_index = spr_rankNA
            if (global.rank == "b")
                sprite_index = spr_rankNB
            if (global.rank == "c")
                sprite_index = spr_rankNC
            if (global.rank == "d")
                sprite_index = spr_rankND
            if (global.rank == "p")
            {
                sprite_index = spr_rankNP
                image_speed = 1
            }
        }
        else
        {
            if (global.rank == "s")
                sprite_index = spr_rankNS
            if (global.rank == "a")
                sprite_index = spr_rankNA
            if (global.rank == "b")
                sprite_index = spr_rankNB
            if (global.rank == "c")
                sprite_index = spr_rankNC
            if (global.rank == "d")
                sprite_index = spr_rankND
            if (global.rank == "p")
            {
                sprite_index = spr_rankNP
                image_speed = 1
            }
        }
    }
    if (global.collectN > global.collect)
    {
        if (obj_player2.character == "P" && obj_player1.ispeppino)
        {
            if (global.rank == "s")
                sprite_index = spr_rankNS
            if (global.rank == "a")
                sprite_index = spr_rankNA
            if (global.rank == "b")
                sprite_index = spr_rankNB
            if (global.rank == "c")
                sprite_index = spr_rankNC
            if (global.rank == "d")
                sprite_index = spr_rankND
            if (global.rank == "p")
            {
                sprite_index = spr_rankNP
                image_speed = 1
            }
        }
        else
        {
            if (global.rank == "s")
                sprite_index = spr_rankNS
            if (global.rank == "a")
                sprite_index = spr_rankNA
            if (global.rank == "b")
                sprite_index = spr_rankNB
            if (global.rank == "c")
                sprite_index = spr_rankNC
            if (global.rank == "d")
                sprite_index = spr_rankND
            if (global.rank == "p")
            {
                sprite_index = spr_rankNP
                image_speed = 1
            }
        }
    }
    set = true
}
if brown
{
    brownfade = approach(brownfade, 1, 0.07)
    switch toppin_state
    {
        case (94 << 0):
            if (brownfade < 1)
                break
            else
            {
                var spd = 20
                var yy = camera_get_view_height(view_camera[0]) - 62
                toppin_y[toppin_index] -= spd
                toppin_yscale[toppin_index] = 1.2
                if (toppin_y[toppin_index] <= yy)
                {
                    if (toppin[toppin_index] == 1)
                    {
                        createmoney[toppin_index] = 1
                        if toppinvisible
                            audio_play_sound(SEWER_CUTOUT_NINJA_SLAP,1,0)
                    }
                    if toppinvisible
                        audio_play_sound(SEWER_CUTOUT_NINJA_SLAP,1,0)
						
                    toppin_y[toppin_index] = yy
                    toppin_state = (143 << 0)
                    brown = 1
                }
                break
            }
        case (143 << 0):
            toppin_yscale[toppin_index] = approach(toppin_yscale[toppin_index], 1, 0.1)
            if (toppin_yscale[toppin_index] == 1)
            {
                toppin_index++
                if (toppin_index >= array_length(toppin))
                {
                    toppin_state = (2 << 0)
                    alarm[3] = 40
                }
                else
                    toppin_state = (94 << 0)
            }
            break
    }

}
if instance_exists(obj_treasureviewer)
    visible = false
