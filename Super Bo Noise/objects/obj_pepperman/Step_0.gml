if (room == rm_blank)
    return;
targetplayer = instance_nearest(x, y, obj_player1)
targetblock = instance_nearest(x, y, obj_pepper_marbleblock)
wastedhits = 8 - elitehit
switch state
{
    case (136 << 0):
        scr_pepperman_walk()
        break
    case (155 << 0):
        scr_pepperman_shoulderbash()
        break
    case (94 << 0):
        scr_pepperman_jump()
        break
    case (110 << 0):
        scr_pepperman_freefall()
        break
    case (139 << 0):
        scr_enemy_hit()
        break
    case (140 << 0):
        scr_enemy_stun()
        break
    case (6 << 0):
        scr_enemy_grabbed()
        break
    case (156 << 0):
        scr_enemy_pummel()
        break
    case (157 << 0):
        scr_enemy_staggered()
        break
}

if (state == (140 << 0))
{
    if thrown
        savedthrown = true
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1
        idle_timer = 1
    }
}
else
    savedthrown = false
if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == (94 << 0))
{
    use_collision = 0
    x += hsp
    y += vsp
    if (vsp < 20)
        vsp += grav
}
else
    use_collision = 1
if (state == (140 << 0) || state == (155 << 0) || (!use_collision) || elitehit <= 1)
    invincible = 1
else
    invincible = 0
if (state != (140 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != (6 << 0))
    depth = 0
if (state != (140 << 0))
    thrown = false
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
