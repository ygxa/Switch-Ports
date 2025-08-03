event_inherited();
obj_gamemanager.bindTextHandler(method(obj_battlemanager.id, function(argument0)
{
    if (instance_exists(obj_ff_asg))
    {
        var b = -4;
        
        if (!instance_exists(obj_speechbubble))
        {
            if (obj_ff_asg.currentTalkTarget)
            {
                b = instance_create_xy(obj_ff_asg.x + 130, obj_ff_asg.y + 20, obj_speechbubble);
                b.visuals.width = 200;
                b.visuals.height = 113;
            }
            else
            {
                b = instance_create_xy(obj_first_froggit_monster.x - 120, obj_first_froggit_monster.y - 126, obj_speechbubble);
                b.visuals.width = 230;
                b.visuals.height = 100;
                b.visuals.side = 1;
                b.visuals.point_offset = 70;
            }
            
            var writer = instance_create(obj_writer);
            writer.draw = false;
            writer.speechBubble = true;
            writer.skippable = false;
            b.writer = writer;
            b.expectingMore = true;
            b.allowSkip = true;
        }
        
        with ((b == -4) ? obj_speechbubble : b)
        {
            if (obj_ff_asg.currentTalkTarget)
            {
                sound = snd_asgblip;
                textEffect = 0;
                textType = 3;
                textSpeed = 1;
            }
            else
            {
                sound = snd_textblip2;
                textEffect = 0;
                textType = 0;
                textSpeed = 1;
            }
            
            text = format_dialogue_both(argument0, obj_speechbubble.visuals.width - 20, global.lang_charwidth_sm, false);
            startDialogue();
        }
        
        return true;
    }
    
    return false;
}));
depth = -5;
journalId = 3;
var bnp = "battles.froggit.";
normalSprite = spr_froglook;
hurtSprite = spr_frogdamage;
dustFilename = "rh_f";
name = dxd_raw(bnp + "name");
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
bt_add_act(bnp, "act0");
bt_add_act(bnp, "act1");
bt_add_act(bnp, "act2");
maxHp = 20;
hp = maxHp;
defense = 1;
xpReward = 10;
goldReward = 0;
isFleeAvailable = false;
flavorColor = make_color_rgb(82, 222, 119);
image_blend = global.flavor_sprites ? flavorColor : c_white;
doLook = false;
head = instance_create(obj_frog_head);
horzSpeed = 0;
asgoreIntervened = false;
fade = 0;
obj_battlemanager.winSceneOverride = "battles.first_froggit.fightk";
