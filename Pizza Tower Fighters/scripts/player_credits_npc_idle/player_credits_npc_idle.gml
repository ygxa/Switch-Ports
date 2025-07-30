function player_credits_npc_idle()
{
    if (accel_final > 0)
        accel_final -= accel;
    
    if (accel_final < accel)
    {
        accel_final = 0;
        last_h = 0;
    }
    
    hsp = accel_final * last_h;
    vsp += grv;
    
    if (hsp != 0)
        facing = sign(hsp);
    
    player_col();
    
    if (place_meeting(x, y + 1, ObjWall) || detect == 1)
    {
        justspawned = 0;
        blastdamaged = 0;
        abletodouble = 1;
        abletorecover = 1;
        image_speed = 1;
    }
    
    switch (spriteuser)
    {
        case "Monoe":
            sprite_index = S_MonoeCredits;
            mask_index = S_MonoeCredits;
            break;
        
        case "Fern":
            sprite_index = S_FernCredits;
            mask_index = S_FernCredits;
            break;
        
        case "Fil":
            sprite_index = S_FilCredits;
            mask_index = S_FilCredits;
            break;
        
        case "Cocoa":
            sprite_index = S_CocoaCredits;
            mask_index = S_CocoaCredits;
            break;
        
        case "Roo":
            sprite_index = S_Gaproo;
            mask_index = S_Gaproo;
            break;
        
        case "Wizz":
            sprite_index = S_Wizzler;
            mask_index = S_Wizzler;
            break;
    }
    
    if (global.player1 == "PS" && spriteuser != "Roo")
        image_xscale = sign(o_player_default.x - x);
}
