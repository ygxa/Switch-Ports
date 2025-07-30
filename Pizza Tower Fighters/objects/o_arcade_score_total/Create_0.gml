laya_id = layer_get_id("Background");
background_id = layer_background_get_id(laya_id);
scoringgg = 0;
showrank = 0;
ranksprite = s_rank_fail;
timer = 300;
scale = 2;

if (global.TOTALSCORE > 899)
    scale = 1;
