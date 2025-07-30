hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 15;
unparry = false;

if (global.hazards == 1)
{
    state = monster_spawn;
    layer_set_visible("scarylayer", true);
}
else
{
    state = monster_fall;
    walksp = 6;
    mask_index = s_monster_pep;
}

facing = 1;
doublekey = 0;
detect = false;
sprint = false;
damagemeter = 0;
damagemetermax = 0;
damagenull = false;
