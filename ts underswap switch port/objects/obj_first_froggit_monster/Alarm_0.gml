if (!asgoreIntervened)
{
    var rare = irandom(99) == 0;
    
    if (instance_exists(obj_battledamage) && obj_battledamage.monsterHpTarget == 0)
        sfx_play(rare ? snd_froggitcry_rare : snd_froggitcry);
    else
        sfx_play(rare ? snd_froggithurt_rare : snd_froggithurt);
}
else
{
    sfx_play(snd_monhurt1);
}
