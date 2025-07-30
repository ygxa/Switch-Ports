with (other)
{
    if (state == 44 || state == 45 || state == 82)
    {
        image_index = 0;
        sprite_index = spr_shotgunpullout;
        instance_destroy(other);
        shotgunAnim = 1;
        state = 68;
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", 2, spr_tv_shotgun, 3), "shotgun");
        global.heattime = 60;
    }
}
