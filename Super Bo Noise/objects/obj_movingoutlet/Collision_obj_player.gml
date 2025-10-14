with (obj_player1)
{
    if ((state == (49 << 0) || state == (50 << 0) || state == (40 << 0)) && cutscene == 0)
    {
        with (instance_create(x, y, obj_knightdebris))
            image_index = 0
        with (instance_create(x, y, obj_knightdebris))
            image_index = 1
        with (instance_create(x, y, obj_knightdebris))
            image_index = 2
        with (instance_create(x, y, obj_knightdebris))
            image_index = 3
        with (instance_create(x, y, obj_knightdebris))
            image_index = 4
        with (instance_create(x, y, obj_knightdebris))
            image_index = 5
        if (x != other.x)
            obj_player1.hsp = (sign(x - other.x)) * 5
        else
            obj_player1.hsp = 5
        vsp = -3
        image_index = 0
        obj_player1.image_index = 0
        obj_player1.flash = 1
        state = (108 << 0)
    }
    else if (state == (53 << 0) && hurted == 0)
        instance_create(x, y, obj_bombexplosion)
    else if (state == (35 << 0))
    {
        with (instance_create(x, y, obj_boxxeddebris))
            image_index = 0
        with (instance_create(x, y, obj_boxxeddebris))
            image_index = 1
        with (instance_create(x, y, obj_boxxeddebris))
            image_index = 2
        with (instance_create(x, y, obj_boxxeddebris))
            image_index = 3
        with (instance_create(x, y, obj_boxxeddebris))
            image_index = 4
        if (x != other.x)
            obj_player1.hsp = (sign(x - other.x)) * 5
        else
            obj_player1.hsp = 5
        vsp = -3
        image_index = 0
        obj_player1.image_index = 0
        obj_player1.flash = 1
        state = (108 << 0)
    }
    else if (state == (26 << 0) || state == (27 << 0))
    {
        obj_player1.grav = 0.5
        repeat (8)
        {
            with (create_debris(x, y, spr_grapedebris))
            {
                vsp = random_range(-5, 0)
                hsp = random_range(-3, 3)
            }
        }
        if (x != other.x)
            obj_player1.hsp = (sign(x - other.x)) * 5
        else
            obj_player1.hsp = 5
        vsp = -3
        image_index = 0
        obj_player1.image_index = 0
        obj_player1.flash = 1
        state = (108 << 0)
    }
    else if (state != (109 << 0) && hurted == 0 && cutscene == 0 && state != (108 << 0))
    {
        global.hurtcounter += 1
        alarm[8] = 60
        alarm[7] = 120
        hurted = 1
        if (xscale == other.image_xscale)
            sprite_index = spr_hurtjump
        else
            sprite_index = spr_hurt
        movespeed = 8
        vsp = -5
        if (global.collect > 100)
            global.collect -= 100
        else
            global.collect = 0
        if (global.collect != 0)
        {
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
            instance_create(x, y, obj_pizzaloss)
        }
        instance_create(x, y, obj_spikehurteffect)
        state = (109 << 0)
        image_index = 0
        flash = 1
    }
}
