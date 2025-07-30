function audio_get_playing()
{
    var arr = [];
    var l = 0;
    
    while (audio_exists(l))
        l++;
    
    for (var i = 0; i < l; i++)
    {
        if (audio_is_playing(i))
            array_push(arr, i);
    }
    
    return arr;
}
