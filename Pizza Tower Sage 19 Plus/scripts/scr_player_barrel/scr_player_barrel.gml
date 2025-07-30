function scr_player_barrel()
{
    collide_destructibles = function(argument0, argument1)
    {
        if (argument1 < 0)
            scr_destroy_vertical(argument1);
        
        if (sprite_index == spr_barrelroll || sprite_index == spr_barrelslipnslide)
            scr_destroy_horizontal(argument0, (16 << 0));
    };
}
