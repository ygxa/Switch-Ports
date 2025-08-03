event_inherited();
var sbRuth = false;

if (isRuth)
{
    if (vhug)
    {
        sbRuth = true;
    }
    else if (vruthfinal)
    {
        vruthfinal = false;
        sbRuth = true;
        vruth = 3;
    }
    else if (vruth == 0 && hp <= 120)
    {
        sbRuth = true;
    }
    else if (vruth == 1 && hp <= 80)
    {
        sbRuth = true;
    }
    else if (vruth == 2 && hp <= 50)
    {
        sbRuth = true;
    }
}

if (vfinaldid || vtalkdid != -1 || vaskdid != -1 || vreminddid != -1 || sbRuth)
{
    with (bt_speech_bubble(x + 220, y + 20, "battles.asgore.sb"))
    {
        if (instance_exists(writer))
        {
            writer.sound = snd_asgblip;
            
            if (global.ctoskip)
            {
                writer.skippable = true;
                allowSkip = true;
            }
        }
        
        sound = snd_asgblip;
        textEffect = 0;
        textType = 3;
        textSpeed = 1;
    }
}
