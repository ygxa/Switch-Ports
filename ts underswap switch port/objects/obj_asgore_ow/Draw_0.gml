if (visible)
{
    if (quickHideFix && y >= 700)
        exit;
    
    draw_self();
    
    if (((type == 7 && sprite_index == spr_asg_hug) || (type == 10 && (sprite_index == spr_asgr_kneel_hug || sprite_index == spr_asgr_kneel_hug_end))) && items_get_armor() == 6)
    {
        if (sequence != undefined && layer_sequence_is_finished(sequence))
            draw_sprite(spr_chara_bench_cowboyhat, 0, obj_player.x + 2, obj_player.y + 6);
    }
}
