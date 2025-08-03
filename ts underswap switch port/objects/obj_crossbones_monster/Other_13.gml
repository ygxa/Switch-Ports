var scene;

if (sbOverride != -4)
    scene = sbOverride;
else if (fightType == 2)
    scene = "battles.cb_g.sb";
else
    scene = "battles.cb.sb";

with (bt_speech_bubble(bubbleX, bubbleY, scene))
{
    other.sbOverride = -4;
    
    if (instance_exists(writer))
    {
        writer.sound = other.removedMask ? snd_sansblip : snd_cbblip;
        writer.skippable = true;
        allowSkip = true;
    }
    
    sound = other.removedMask ? snd_sansblip : snd_cbblip;
    textEffect = 0;
    textType = 7;
    textSpeed = 1;
}
