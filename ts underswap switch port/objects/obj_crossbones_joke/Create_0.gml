event_inherited();
override = true;
image_xscale = 2;
image_yscale = 2;
image_blend = global.flavor_sprites ? #73A4FF : c_white;
obj_gamemanager.bindTextHandler(function(argument0)
{
    var b = -4;
    
    if (!instance_exists(obj_speechbubble))
    {
        b = instance_create_xy(x + sprite_width + 10, y, obj_speechbubble);
        b.visuals.width = 230;
        b.visuals.height = 113;
        var writer = instance_create(obj_writer);
        writer.draw = false;
        writer.skippable = true;
        writer.speechBubble = true;
        b.writer = writer;
        b.expectingMore = true;
        b.allowSkip = true;
    }
    
    with ((b == -4) ? obj_speechbubble : b)
    {
        sound = snd_cbblip;
        textEffect = 0;
        textType = 7;
        textSpeed = 1;
        text = format_dialogue_both(argument0, visuals.width - 20, global.lang_charwidth_sm, false);
        startDialogue();
    }
    
    return true;
});
