image_speed = 0;

walk = 0;
fun = 0;
follow = 1;
runmove = 0;
dir = 0;
walkbuffer = 0;
walktimer = 0;
slided = 0;
blushtimer = 0;
name = "susie";
target = 12;
usprite = spr_susieup;
dsprite = spr_susiedown;
rsprite = spr_susieright;
lsprite = spr_susieleft;
slidesprite = spr_susie_slide;

usprite_blush = spr_susieup;
dsprite_blush = spr_susiedown;
rsprite_blush = spr_susieright;
lsprite_blush = spr_susieleft;
facing = 0
parent = obj_player;
/*
pd = parent.spr_down;
pr = parent.spr_right;
pl = parent.spr_left;
pu = parent.spr_up;
*/
for (i = 0; i < 75; i += 1)
{
    remx[i] = parent.x;
    remy[i] = parent.y;
    _facing[i] = parent.facing;
    sliding[i] = 0;
}

/*
mywidth = sprite_width;
myheight = sprite_height;
xoffset = 0;
yoffset = 0;
forget = 0;

