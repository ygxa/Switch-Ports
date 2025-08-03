var len = array_length(bullets);

for (var i = 0; i < len; i++)
{
    var b = bullets[i];
    
    if (b != -4 && instance_exists(b))
    {
        with (b)
            event_user(10);
    }
}

launched = true;
sfx_play(snd_fall);
