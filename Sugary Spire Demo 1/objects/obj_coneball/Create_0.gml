depth = -100;
scr_sound(124);
image_speed = 0.35;
coneballspeed = 1;
x = obj_player.x;
y = -100;
dis = 800;
mindis = 150;
dir = 0;
timer = 150;
attacking = false;
atktimer = 250;
projcool = 5;
fading = false;
alpha = 1;
attack = 1;

hurtplayer = function()
{
    with (obj_player)
    {
        if ((state == 17 || state == 18 || state == 11) && cutscene == 0)
            continue;
        
        if (state == 20 && hurted == 0)
            continue;
        
        if (state == 8)
            continue;
        
        if (state == 5 || state == 7)
            continue;
        
        if (state != 70 && hurted == 0 && cutscene == 0 && state != 69 && state != 93)
        {
            scr_sound(74);
            global.hurtcounter += 1;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = 1;
            
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump;
            else
                sprite_index = spr_hurt;
            
            movespeed = 8;
            vsp = -5;
            timeuntilhpback = 300;
            
            if (global.collect > 100)
                global.collect -= 100;
            else
                global.collect = 0;
            
            if (global.collect != 0)
            {
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
                instance_create(x, y, obj_pizzaloss);
            }
            else if (obj_player.shotgunAnim == 1)
            {
                obj_player.shotgunAnim = 0;
            }
            
            instance_create(x, y, obj_spikehurteffect);
            state = 70;
            image_index = 0;
            flash = 1;
            global.style -= 15;
        }
    }
};
