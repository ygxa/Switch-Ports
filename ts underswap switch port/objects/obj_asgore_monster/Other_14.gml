event_inherited();

if (global.bev_subtype == 1)
{
    invincible = false;
    bt_add_act("battles.asgore.", "act_hug");
    vruthfinal = true;
    
    if (isRuth)
        doRuthAttack = true;
    
    hp = 2;
}
