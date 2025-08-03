var aftershot = instance_create_xy(x, y, obj_gunshot_atk2);
aftershot.image_blend = image_blend;

if (criticalHit)
    sfx_play(snd_saber, 80, false);

shotNum++;

if (shotNum < 1)
    alarm[4] = 3;
