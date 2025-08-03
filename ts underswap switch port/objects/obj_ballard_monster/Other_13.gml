var bn = "battles.ruinedknights.ballard.sb_";
var scene;

if (justkill)
{
    scene = bn + "k";
}
else if (vdidencourage)
{
    scene = bn + "encourage";
    vdidencourage = false;
    obj_rk_manager.lastInteracted = monsterIndex;
}
else if (vdidstare)
{
    scene = bn + "stare";
    vdidstare = false;
    obj_rk_manager.lastInteracted = monsterIndex;
}
else
{
    scene = bn + "neutral";
}

var b = bt_speech_bubble(x - 40, ystart - 110, scene);
b.expectingMore = false;
b.textType = 3;
b.textEffect = 6;
