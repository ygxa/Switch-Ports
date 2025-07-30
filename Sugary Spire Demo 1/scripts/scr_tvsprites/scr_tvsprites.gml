function scr_tvsprites()
{
    if (obj_player.character == "P")
    {
        idletvspr = spr_pizzytv;
        escapetvspr = spr_pizzytv_escape1;
        tvchange1 = 307;
        tvchange2 = 345;
        cottontvspr = spr_pizzytvcotton;
        hurttvspr = spr_pizzytvhurt;
        minecarttvspr = spr_pizzytvmine;
        bombtvspr = spr_pizzytvbomb;
        firetvspr = spr_pizzytvfire;
        angrytvspr = spr_pizzytvangry;
        orbtvspr = spr_pizzytv_croaked;
        mach1tvspr = spr_pizzytvmach1;
        mach2tvspr = spr_pizzytvmach2;
        mach3tvspr = spr_pizzytvmach3;
        mach4tvspr = spr_pizzytvmach4;
    }
    
    if (obj_player.character == "N")
    {
        idletvspr = spr_pizzanotv;
        escapetvspr = spr_pizzytv_escape1;
        tvchange1 = 212;
        tvchange2 = 212;
        cottontvspr = spr_pizzytvcotton;
    }
}
