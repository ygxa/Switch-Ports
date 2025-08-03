if (instance_exists(obj_battledamage) && obj_battledamage.monsterHpTarget == 0)
    sfx_play(snd_looxcry);
else
    sfx_play(snd_looxhurt);
