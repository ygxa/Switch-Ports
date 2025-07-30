event_inherited();

create_func = function(argument0 = false)
{
    with (instance_create_depth(x, y, depth, obj_sagegate))
    {
        level = other.level;
        targetRoom = other.targetRoom;
        gatespr = other.gatespr;
        gateox = other.gateox;
        gateoy = other.gateoy;
        unlocked = true;
        unlockedanim = argument0;
    }
};

gatespr = spr_sagegate_entry;
gateox = 78;
gateoy = 142;
