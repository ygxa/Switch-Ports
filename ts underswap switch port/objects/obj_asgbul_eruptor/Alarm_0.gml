var sfx = sfx_play(snd_click);
var g = min(0.8, slow);
audio_sound_gain(sfx, g, 0);
var tempOff = off + irandom_range(-2, 2);

for (var i = 0; i < 6; i++)
{
    with (bt_bullet_attack(obj_asgbul_generic, damageAmount, x, y))
    {
        direction = (180 + tempOff) - (i * 30);
        speed = 4;
    }
}

off -= 15;

if (off < -30)
    off = 0;

alarm[0] = 32 - (24 * g);
