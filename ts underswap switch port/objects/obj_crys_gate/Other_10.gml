open = !open;

if (open)
{
    sfx_play(snd_dooropen);
    image_index = 1;
}
else
{
    sfx_play(snd_bang);
    image_index = 0;
}

toggleBlocker();
doShake(3);
view_shake(2, 1);
