var rare = irandom(99) == 0;

if (instance_exists(obj_battledamage) && obj_battledamage.monsterHpTarget == 0)
    sfx_play_pitch(rare ? snd_froggitcry_rare : snd_froggitcry, 1);
else
    sfx_play_pitch(rare ? snd_froggithurt_rare : snd_froggithurt, 1);
