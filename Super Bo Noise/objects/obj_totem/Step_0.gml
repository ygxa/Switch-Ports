totem_clear(id)
var empty = totem_empty(id)
if empty
{
    with (obj_indiancheese)
    {
        if (empty && state == (136 << 0) && x > (other.x - 72) && x < (other.x + 72) && y > (other.y - 74) && y < (other.y + 50) && grounded)
        {
            state = (190 << 0)
            totemID = other.id
            totem_add(other.id, id)
            empty = totem_empty(other.id)
            totemdir = (x > other.x ? -1 : 1)
            image_xscale = totemdir
            sprite_index = spr_indiancheese_howl
            image_index = 0
        }
    }
}
active = totem_count(id) > 0
