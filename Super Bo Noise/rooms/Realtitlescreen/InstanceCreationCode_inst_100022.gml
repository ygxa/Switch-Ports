if (!variable_global_exists("titlecutscene"))
    global.titlecutscene = 1
if global.titlecutscene
    scene_info = [[cutscene_title_start], [cutscene_set_sprite, obj_player1, spr_null, 0.35, 1], [cutscene_wait, 120], [cutscene_title_middle], [cutscene_set_sprite, obj_player1, spr_null, 0.3, -1], [cutscene_set_vsp, obj_player1, -6], [cutscene_waitfor_sprite, obj_player1], [cutscene_title_end]]
else
    scene_info = [[cutscene_wait, 2]]
