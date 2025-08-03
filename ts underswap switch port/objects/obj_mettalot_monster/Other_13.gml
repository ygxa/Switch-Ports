if (died)
{
    obj_battlemanager.mainState = (0 << 0);
    
    if (isRuth)
        bt_speech_bubble(initX + (sprite_width * 0.6), initY - 20, "battles.metta.ruthdeath");
    else if (vflirt >= 3)
        bt_speech_bubble(initX + (sprite_width * 0.6), initY - 20, "battles.metta.betrayal");
    else
        bt_speech_bubble(initX + (sprite_width * 0.6), initY - 20, "battles.metta.death");
}
else
{
    bt_speech_bubble(initX + (sprite_width * 0.6), initY - 40, "battles.metta.sb");
}

with (obj_speechbubble)
    allowSkip = true;
