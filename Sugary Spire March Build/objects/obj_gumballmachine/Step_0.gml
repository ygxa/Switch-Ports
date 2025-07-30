/*switch state
{
    case baddiestate.idle:
        scr_enemy_idle()
        break
    case baddiestate.charge:
        scr_enemy_charge()
        break
    case baddiestate.turn:
        scr_enemy_turn()
        break
    case baddiestate.walk:
        scr_enemy_walk()
        break
    case baddiestate.land:
        scr_enemy_land()
        break
    case baddiestate.hit:
        scr_enemy_hit()
        break
    case baddiestate.stun:
        scr_enemy_stun()
        break
    case baddiestate.Throw:
        scr_enemy_throw()
        break
    case baddiestate.grabbed:
        scr_enemy_grabbed()
        break
}*/

if (state == baddiestate.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != baddiestate.stun && state != baddiestate.frozen)
    birdcreated = 0
if (bombreset > 0)
    bombreset--
if (state != baddiestate.Throw && bombreset == 0)
{
    if (state == baddiestate.walk || state == baddiestate.idle)
    {
        image_index = 0
        state = baddiestate.Throw
		sprite_index = spr_throw
    }
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != baddiestate.grabbed)
    depth = 0
if (state != baddiestate.stun && state != baddiestate.frozen)
    thrown = 0
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox, { baddieID : other.id }))
    {
        sprite_index = other.sprite_index
        mask_index = other.mask_index;
        baddieID = other.id
        other.boundbox = 1
    }
}
