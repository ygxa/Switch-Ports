// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
with (obj_cathud)
{
    if (id != other.id)
        instance_destroy()
}
depth = -5000
snd_blink = "event:/SFX/special/blink"
snd_blunk = "event:/SFX/special/blunk"
snd_meow = "event:/SFX/special/meow"
purrsnd = []
maxcats = 5
for (var i = 0; i < maxcats; i++)
    purrsnd[i] = //fmod_createEventInstance("event:/SFX/special/purr")
edgecount = sprite_get_number(spr_cathud_edges) / 2
show = true
cats = []
cat = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6) constructor //anon@580@gml_Object_obj_cathud_Create_0
{
    if (argument5 == undefined)
        argument5 = (0 << 0)
    if (argument6 == undefined)
        argument6 = (0 << 0)
    x = argument3
    y = argument4
    catSprite = argument1
    catID = argument2
    index = 0
    beenPet = false
    catNo = argument0
    position = argument5
    type = argument6
    rot = 0
    blinkTimer = irandom_range(100, 1200)
    blinking = false
    purrBuffer = irandom_range(500, 2400)
    purring = false
    meowBuffer = irandom_range(300, 1600)
    meowing = false
    xscale = 1
    yscale = 1
    step = function() //anon@1170@anon@580_gml_Object_obj_cathud_Create_0
    {
        self.blink()
        self.purr()
        self.meow()
        if (!beenPet)
            self.pet()
    }

    blink = function() //anon@1267@anon@580_gml_Object_obj_cathud_Create_0
    {
        var xrotadj = camera_get_view_x(view_camera[0])
        var yrotadj = camera_get_view_y(view_camera[0])
        if (rot == 0 || rot == 180)
            yrotadj += (rot == 0 ? -100 : 100)
        else
            xrotadj += (rot == 90 ? -100 : 100)
        if (blinkTimer > 0)
            blinkTimer--
        if (blinkTimer <= 0)
        {
            if (!blinking)
            {
                index = 1
                blinking = true
                blinkTimer = irandom_range(30, 90)
            }
            else
            {
                index = 0
                blinking = false
                blinkTimer = irandom_range(600, 1200)
            }
        }
    }

    pet = function() //anon@1956@anon@580_gml_Object_obj_cathud_Create_0
    {
        var mx = mouse_x - camera_get_view_x(view_camera[0])
        var my = mouse_y - camera_get_view_y(view_camera[0])
        if point_in_rectangle(mx, my, (x - 100), (y - 200), (x + 100), y)
        {
            purrBuffer = 0
            beenPet = true
            mail_trigger((20 << 0))
        }
    }

    purr = function() //anon@2246@anon@580_gml_Object_obj_cathud_Create_0
    {
        if meowing
        {
            purrBuffer = irandom_range(1200, 2400)
            return;
        }
        var xrotadj = camera_get_view_x(view_camera[0])
        var yrotadj = camera_get_view_y(view_camera[0])
        if (rot == 0 || rot == 180)
            yrotadj += (rot == 0 ? -100 : 100)
        else
            xrotadj += (rot == 90 ? -100 : 100)
        if (purrBuffer > 0)
            purrBuffer--
        if ((!purring) && purrBuffer <= 0)
        {
            purring = true
            purrBuffer = irandom_range(600, 900)
        }
        else if (purring && purrBuffer <= 0)
        {
            purring = false
            xscale = 1
            yscale = 1
            purrBuffer = irandom_range(1200, 2400)
        }
        var ev = obj_cathud.purrsnd[catNo]
    }

    meow = function() //anon@3235@anon@580_gml_Object_obj_cathud_Create_0
    {
        if purring
        {
            meowBuffer = irandom_range(600, 1600)
            return;
        }
        var xrotadj = camera_get_view_x(view_camera[0])
        var yrotadj = camera_get_view_y(view_camera[0])
        if (rot == 0 || rot == 180)
            yrotadj += (rot == 0 ? -100 : 100)
        else
            xrotadj += (rot == 90 ? -100 : 100)
        if (meowBuffer > 0)
            meowBuffer--
        if ((!meowing) && meowBuffer <= 0)
        {
            meowing = true
            meowBuffer = 100

        }
        if meowing
        {
            yscale = 1 + 0.1 * (sin(current_time / 2000))
            xscale = 1 - 0.2 * (sin(current_time / 2000))
            if (meowBuffer <= 0)
            {
                meowing = false
                meowBuffer = irandom_range(600, 1600)
                xscale = 1
                yscale = 1
            }
        }
    }

    draw = function(argument0) //anon@4037@anon@580_gml_Object_obj_cathud_Create_0
    {
        var correctedind = index + 2 * catID
        draw_sprite_ext(catSprite, correctedind, x, y, xscale, yscale, rot, c_white, argument0)
    }

}

event_perform(ev_other, ev_room_start)
