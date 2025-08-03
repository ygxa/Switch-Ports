image_index++;

if (floor(image_index) >= (image_number - 1))
{
    sfx_play_pitch(snd_bark, 1.4);
    alarm[6] = star7countdown;
}
else
{
    sfx_play_pitch(snd_bark, 0.7);
    alarm[5] = (room == rm_star7B) ? star7countdown : 20;
}
