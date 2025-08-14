if parent = obj_player{
	if parent.sprite_index = parent.spr_down	
		depth = obj_player.depth - -1
}

if parent = obj_player{
	if parent.sprite_index = parent.spr_up	
		depth = obj_player.depth + -1
}

nowx = x;
nowy = y;
moved = 0;
walk = 0;
runmove = 0;
slided = 0;

if (parent.x != remx[0])
    moved = 1;

if (parent.y != remy[0])
    moved = 1;

if (sliding[target] == 1)
    moved = 1;

if (moved == 1 && follow == 1)
{
    blushtimer = 0;
    
    for (i = 75; i > 0; i -= 1)
    {
        remx[i] = remx[i - 1];
        remy[i] = remy[i - 1];
        _facing[i] = _facing[i - 1];
        sliding[i] = sliding[i - 1];
    }
    
    remx[0] = parent.x;
    remy[0] = parent.y;
    sliding[0] = parent.sliding;
    _facing[0] = parent.facing;
    
    //if (usprite == spr_susieup)
        x = remx[target] - 1
    //else if (usprite == spr_susieup)
        //x = remx[target] - 6;
    //else if (usprite == spr_susie_walk_up_lw)
        //x = remx[target] - 3;
    //else if (usprite == spr_noelle_walk_up_dw)
        //x = remx[target] - 4;
    //else
        //x = remx[target] - 2;
    
    //if (usprite == spr_susixeup)
        y = remy[target] -3
    //else if (usprite == spr_susieup)
        //y = remy[target] - 16;
	/*
    else if (usprite == spr_susie_walk_up_lw)
        y = remy[target] - 6;
    else if (usprite == spr_noelle_walk_up_dw)
        y = remy[target] - 20;
    else
        y = remy[target] - 12;
    */
    if (sliding[target] == 1)
    {
        x = remx[target];
        y = remy[target];
        sprite_index = slidesprite;
        slided = 1;
    }
    
    if (abs(remx[target + 1] - remx[target]) > 4)
        runmove = 1;
    
    if (abs(remy[target + 1] - remy[target]) > 4)
        runmove = 1;
    
    dir = _facing[target];
}

if (x != nowx)
    walk = 1;

if (y != nowy)
    walk = 1;

if (walk == 1)
    walkbuffer = 6;

if (walkbuffer > 3 && fun == 0)
{
    walktimer += 1.5;
    
    if (runmove == 1)
        walktimer += 1.5;
    
    if (walktimer >= 40)
        walktimer -= 40;
    
    if (walktimer < 10)
        image_index = 0;
    
    if (walktimer >= 10)
        image_index = 1;
    
    if (walktimer >= 20)
        image_index = 2;
    
    if (walktimer >= 30)
        image_index = 3;
}

if (walkbuffer <= 0 && fun == 0)
{
    if (walktimer < 10)
        walktimer = 9.5;
    
    if (walktimer >= 10 && walktimer < 20)
        walktimer = 19.5;
    
    if (walktimer >= 20 && walktimer < 30)
        walktimer = 29.5;
    
    if (walktimer >= 30)
        walktimer = 39.5;
    
    image_index = 0;
}

walkbuffer -= 0.75;

if (fun == 0 && slided == 0)
{
    if (_facing[target] == 0)
        sprite_index = dsprite;
    
    if (_facing[target] == 1)
        sprite_index = rsprite;
    
    if (_facing[target] == 2)
        sprite_index = usprite;
    
    if (_facing[target] == 3)
        sprite_index = lsprite;
}

if dsprite == spr_ralseidown && fun == 0
{
    distfrommcx = parent.x - (x + 2);
    distfrommcy = parent.y - (y + 12);
    
    if (abs(distfrommcy) <= 14 && abs(distfrommcx) <= 20)
    {
        if (distfrommcx <= 0 && parent.facing == 1)
            blushtimer += 1;
        
        if (distfrommcx >= 0 && parent.facing == 3)
            blushtimer += 1;
    }
    else
    {
        blushtimer = 0;
    }
    
    if (blushtimer >= 300)
    {
        if (sprite_index == dsprite)
            sprite_index = dsprite_blush;
        
        if (sprite_index == rsprite)
            sprite_index = rsprite_blush;
        
        if (sprite_index == usprite)
            sprite_index = usprite_blush;
        
        if (sprite_index == lsprite)
            sprite_index = lsprite_blush;
    }
}
else
{
    blushtimer = 0;
}

if sprite_index = lsprite
	facing = 3
if sprite_index = rsprite
	facing = 1
if sprite_index = usprite
	facing = 2
if sprite_index = dsprite
	facing = 0
