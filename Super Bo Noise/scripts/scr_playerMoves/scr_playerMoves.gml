function scr_dotaunt() //scr_dotaunt
{
    if (input_check_pressed("taunt") || input_finisher_buffer > 0)
    {
        input_finisher_buffer = 0
        if (((!input_check("up")) || (!supercharged)) && global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && (global.panic == true || instance_exists(obj_wartimer)) && global.combotime > 0)
        {
            global.tauntcount++
            global.collect += 25
            with (instance_create((x + 16), y, obj_smallnumber))
                number = string(25)
            create_collect(x, y, spr_taunteffect, 25)
            scr_soundeffect(sfx_collect)
        }
        if (!finisher)
        {
            taunttimer = 20
            tauntstoredmovespeed = movespeed
            tauntstoredvsp = vsp
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            state = (86 << 0)
            if (supercharged && input_check("up"))
            {
                global.hasFINALLYSUPERTAUNTED = true
                image_index = 0
                sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
                scr_soundeffect(taunt)
				scr_soundeffect(sfx_luckyML)
            }
            else
            {
                taunttimer = 20
                sprite_index = spr_taunt
                image_index = random_range(0, 11)
                scr_soundeffect(taunt)
            }
            with (instance_create(x, y, obj_taunteffect))
                player = other.id
        }
    }
}

