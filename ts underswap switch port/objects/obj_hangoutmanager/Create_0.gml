writer = -4;
portraitMode = false;
shrinkTextMultiplier = 1;
textSpeed = 1;
textFont = fnt_main;
textSound = snd_textblip1;
textEffect = 5;
canSkip = false;
allowCToSkip = true;
nextLine = true;
drawTextbox = true;
boxX1 = 32;
boxY1 = 325;
boxX2 = 608;
boxY2 = 465;
textX = 52;
textY = 340;
forceStr = "";
forceStrBackup = forceStr;
portraitMode = false;
portraitSprite = -1;
startScene = undefined;
startFade = true;
saveForChoiceText = "";
choice = 0;
choiceSelection = 0;
choiceArr = undefined;
choiceBuffer = 3;

startDialogue = function()
{
    if (writer == -4 || !instance_exists(writer))
    {
        writer = instance_create(obj_writer);
        writer.draw = false;
        writer.skippable = canSkip;
    }
    
    writer.resume();
    writer.message = text;
    writer.sound = textSound;
    writer.textSpeed = textSpeed;
    
    if (global.lang == "en")
    {
        shrinkTextMultiplier = 1;
    }
    else
    {
        var lb = linebreak_count(text);
        
        if (choice == 1)
            lb *= 0.5;
        else if (choice != 0)
            lb = 0;
        
        if (lb <= 2)
            shrinkTextMultiplier = 1;
        else
            shrinkTextMultiplier = 2.5 / lb;
    }
};

triggerEnd = function()
{
    var f = instance_create(obj_fader);
    f.fadeSpeed = 0.08;
    f.completeCallback = fadeEnd;
};

fadeEnd = function()
{
    with (obj_transition_parent)
        event_user(1);
    
    if (global.currentroom == -1)
        global.currentroom = rm_wake;
    
    room_goto(global.currentroom);
    global.currentroom = -1;
    global.reset_state_on_room_start = true;
};

dt_group(global.date_id);

if (startScene != undefined)
    dx_scene(startScene);

if (startFade)
{
    var f = instance_create(obj_fader);
    f.toSolid = false;
    f.alpha = 1;
}
