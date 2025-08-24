function state_player_freefallland()
{
    scr_conveyorBeltKinematics();
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    crouchAnim = false;
    movespeed = 0;
    slamHurt = (sprite_index == spr_groundPoundland) ? 180 : 0;
    alarm[4] = 14;
    vsp = 0;
    hsp = 0;
    
    if (sprite_animation_end())
    {
        state = PlayerState.normal;
        image_index = 0;
        
        if (slamHurt && global.playerCharacter == Characters.Pizzelle)
            sprite_index = spr_groundPoundEnd_intro;
        else
            sprite_index = spr_idle;
        
        freeFallSmash = 0;
    }
    
    if (global.blastmode)
        image_speed = 0.2;
    else
        image_speed = 0.35;
}
