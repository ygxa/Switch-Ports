if (karma)
{
    with (obj_battlemanager)
        statsKarmaHandler = new KarmaHandler(max(0.2, 0.6 * (global.playerlv / 20)), global.playermaxhp * 0.42857142857142855, 1);
}

if (phase >= 2)
{
    with (obj_battleheart_blue)
        canDash = true;
}

with (obj_battlemanager)
{
    drawButtonBase = drawButton;
    
    drawButton = function(argument0, argument1, argument2, argument3, argument4, argument5)
    {
        if (argument3 == lang_get_sprite(spr_act_icon))
        {
            with (obj_crossbones_monster)
            {
                argument0 += actButtonXOff;
                lastActButtonArgs = [argument0, argument1, argument2, argument3, argument4, argument5];
            }
        }
        
        drawButtonBase(argument0, argument1, argument2, argument3, argument4, argument5);
    };
}

if (fightType == 2 && ds_map_find_value(global.flags, "st_cb_battle") == 25)
{
    with (obj_battlemanager)
    {
        mainState = (7 << 0);
        attackTime = infinity;
        attackTimer = infinity;
        buildCache();
        boxType = (2 << 0);
        boxReset();
    }
    
    with (obj_battleheart)
    {
        visible = true;
        x = 312;
        y = 312;
        canMove = true;
    }
    
    faceSprite = spr_cbfaceb3_normal;
    removedMask = true;
    vattack = 302;
    phase = 3;
    global.bev_subtype = 0;
    event_user(1);
}
