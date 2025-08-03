with (bt_speech_bubble(x + 220, y + 20, "battles.asgore.intro"))
{
    if (instance_exists(writer))
    {
        writer.sound = snd_asgblip;
        writer.textSpeed = 2;
    }
    
    sound = snd_asgblip;
    textEffect = 0;
    textType = 3;
    textSpeed = 2;
}
