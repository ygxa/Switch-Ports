depth = -5;
image_xscale = 2;
image_yscale = 2;
permadeath = string_upper(global.playername) == "DEATH";
backLayerAlpha = 0;
backLayerYOff = 10;
text = "";
textX[0] = 0;
textY = 0;
writer = -4;
nextLineTimer = -1;
state = 0;
textAlpha = 1;
blankTimer = -1;
didChoice = false;
choice = 0;
bigTextAlpha = 1;
charaShake = 0;
charaStage = 0;
stillFadeMusic = true;
nextLine = true;
textSpeed = 2;
textSound = -1;
textType = 0;

startDialogue = function()
{
    if (writer == -4 || !instance_exists(writer))
    {
        writer = instance_create(obj_writer);
        writer.draw = false;
    }
    
    writer.resume();
    writer.message = text;
    writer.sound = textSound;
    writer.textSpeed = textSpeed;
};

obj_gamemanager.customViewMode = false;

with (instance_create(obj_fader))
{
    toSolid = false;
    alpha = 1;
    fadeSpeed = 0.015;
}

alarm[1] = 50;
