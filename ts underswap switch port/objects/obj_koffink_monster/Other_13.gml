event_inherited();
var bubbleX = drawOnGround ? (x - 10) : (x + 150);
var bubbleY = drawOnGround ? (y - 126) : (y + 12);

with (bt_speech_bubble(bubbleX, bubbleY, "battles.kk.sb"))
{
    if (instance_exists(writer))
    {
        writer.sound = snd_koffinblip;
        writer.skippable = true;
        allowSkip = true;
    }
    
    sound = snd_koffinblip;
    textEffect = 0;
    textType = 3;
    textSpeed = 1;
}
