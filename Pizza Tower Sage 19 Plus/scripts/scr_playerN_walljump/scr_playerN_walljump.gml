function scr_playerN_walljump()
{
    collide_destructibles = function(argument0, argument1)
    {
        scr_destroy_vertical(argument1);
        scr_destroy_horizontal(argument0);
    };
}
