var isOtherLoox = instance_number(obj_loox_monster) == 2 && obj_battlemanager.monsters[!monsterIndex].isActive;
var theOtherLoox;

if (isOtherLoox)
    theOtherLoox = obj_battlemanager.monsters[!monsterIndex];

if (isOtherLoox && ((monsterIndex == 0 && irandom(1) == 0 && !vpickondid && !theOtherLoox.vpickondid) || vchallenger != -1) && vstare == 0 && theOtherLoox.vstare == 0)
{
    if (vchallenger == -1)
    {
        vchallenger = irandom(1);
        theOtherLoox.vchallenger = !vchallenger;
    }
    
    bt_speech_bubble(x + sprite_width, y - 6, "battles.loox.stare");
    vdocombostare = true;
    vchallenger = -1;
}
else
{
    bt_speech_bubble(x + sprite_width, y - 6, "battles.loox.sb");
}
