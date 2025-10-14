function state_player_crouchjump() //state_player_crouchjump
{
    move = input_check("right") - input_check("left")
    mask_index = spr_crouchmask
    hsp = move * movespeed
    movespeed = 4 * getRPGMulti("movespeed")
    if ((!input_check("jump")) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav
        jumpstop = 1
    }
    if grounded
    {
        state = (102 << 0)
        jumpAnim = 1
        crouchAnim = 1
        image_index = 0
        jumpstop = 0
        scr_soundeffect(sfx_step)
    }
    if (jumpAnim == 1)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_crouchjump
        else
            sprite_index = spr_crouchjump
        if (floor(image_index) == (image_number - 1))
            jumpAnim = 0
    }
    if (jumpAnim == 0)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_crouchfall
        else
            sprite_index = spr_crouchfall
    }
    if (move != 0)
        xscale = move
    image_speed = 0.35
    return;
}

