x += hsp
y += vsp
switch state
{
    case (2 << 0):
        image_speed = 0.35
        sprite_index = spr_horsey
        break
    case (91 << 0):
        image_speed = 0.35
        sprite_index = spr_horsey_lose
        with (obj_objecticontracker)
        {
            if (objectID == other.id)
                instance_destroy()
        }
        break
    case (8 << 0):
        image_speed = 0.1
        sprite_index = spr_horsey_win
        with (obj_objecticontracker)
        {
            if (objectID == other.id)
                instance_destroy()
        }
        break
}

