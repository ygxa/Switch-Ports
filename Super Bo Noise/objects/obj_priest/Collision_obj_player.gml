var _transfo = 0
with (other)
{
    if (!scr_transformationcheck())
    {
        if (state == (13 << 0) || state == (14 << 0) || state == (16 << 0) || state == (14 << 0) || state == (35 << 0) || state == (37 << 0) || state == (36 << 0))
        {
            if (hsp != 0)
                xscale = sign(hsp)
            movespeed = abs(hsp)
        }
        state = (2 << 0)
        scr_soundeffect(Detransfo)
        scr_soundeffect(choose(priestmeow1,priestmeow2))
		scr_soundeffect(sfx_beandoctor)
        dir = xscale
        _transfo = 1
        create_particle(x, y, (9 << 0))
    }
}
if _transfo
{
    var p = other.id
    with (instance_create((other.x - 540), (camera_get_view_y(view_camera[0]) - 100), obj_priestangel))
    {
        priestID = other.id
        playerid = p
    }
    if (sprite_index != spr_angelpriest)
        sprite_index = spr_priest_pray
    if (collect && ds_list_find_index(global.saveroom, id) == -1)
    {
        ds_list_add(global.saveroom, id)
        var val = 500
        global.collect += val
        global.combotime = 60
        with (instance_create((x + 16), y, obj_smallnumber))
            number = string(val)
        for (var i = 0; i < val; i += round(val / 16))
            create_collect((other.x + (irandom_range(-60, 60))), (other.y + (irandom_range(-60, 60))), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), round(val / 16))
    }
}
