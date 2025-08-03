var bn = "battles.ruinedknights.karapaes.sb_";
var scene;

if (justkill)
{
    scene = bn + "k";
}
else if (vdidpraise)
{
    scene = bn + "praise";
    vdidpraise = false;
    obj_rk_manager.lastInteracted = monsterIndex;
}
else if (vdidrebuke)
{
    scene = bn + "rebuke";
    vdidrebuke = false;
    obj_rk_manager.lastInteracted = monsterIndex;
}
else
{
    scene = bn + "neutral";
}

bt_speech_bubble(x - 10, ystart - 110, scene).expectingMore = false;
