function state_player_shotgundash()
{
    image_speed = 0.35;
    hsp = xscale * movespeed;
    
    if (floor(image_index) == (image_number - 1) || !input_check("attack"))
    {
        state = 68;
        sprite_index = spr_shotgunidle;
        landAnim = 0;
        movespeed = 6;
        
        if (!grounded)
        {
            state = 59;
            sprite_index = spr_shotgunfall;
        }
    }
    
    exit;
}
