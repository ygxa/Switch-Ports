event_inherited();
obj_gamemanager.bindTextHandler(method(obj_battlemanager.id, function(argument0)
{
    if ((instance_exists(obj_md_monster) && (obj_md_monster.state == (1 << 0) || obj_md_monster.preReveal)) || (instance_exists(obj_md_asg) && obj_md_asg.talking))
    {
        var asg = instance_exists(obj_md_asg) && obj_md_asg.talking;
        var b = -4;
        
        if (!instance_exists(obj_speechbubble))
        {
            if (asg)
            {
                b = instance_create_xy(obj_md_asg.x + 130, obj_md_asg.y + 20, obj_speechbubble);
                
                if (obj_md_asg.x <= 40)
                {
                    b.visuals.width = 230;
                    b.visuals.height = 91;
                }
                else
                {
                    b.visuals.width = 230;
                    b.visuals.height = 113;
                }
            }
            else
            {
                b = instance_create_xy(obj_md_monster.x + 40, obj_md_monster.y - obj_md_monster.sprite_yoffset - 18, obj_speechbubble);
                b.visuals.width = 230;
                b.visuals.height = 113;
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
            if (asg)
            {
                sound = snd_asgblip;
                textEffect = 0;
                textType = 3;
                textSpeed = 1;
            }
            else if (!obj_md_monster.preReveal)
            {
                sound = snd_mdblip;
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
var bn = "battles.md.";
normalSprite = sprite_index;
hurtSprite = sprite_index;
name = dxd_raw(bn + "name");
flavorScene = bn + "flavor";
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
hurtSound = snd_monhurt1;
bt_add_act(bn, "act0");
bt_add_act(bn, "act1");
obj_battlemanager.spareObjOverride = id;
obj_battlemanager.spareEvOverride = 11;
fakeSpareable = true;
defense = 4;
realDefense = "Yes";
xpReward = 0;
goldReward = 0;
hp = 80;
maxHp = hp;
invincible = true;
state = (0 << 0);
sceneState = 0;
face = spr_mdfaceb_plain;
deadCounter = 0;
preReveal = false;
didCriticalHit = false;
rot = 0;
normpartx = array_create(4);
normparty = array_create(4);
normpartrot = array_create(4);
normpartx[0] = 44;
normparty[0] = 90;
normpartx[1] = 44;
normparty[1] = 54;
normpartx[2] = 44;
normparty[2] = 74;
normpartx[3] = 32;
normparty[3] = 22;
partx = array_create(4);
party = array_create(4);
partrot = array_create(4);
grav = 0;
step = 0;
float = false;
siner = 0;
angrySpeed = 0.05;
actualAngrySpeed = 0.05;
angryRot = 0.12;
actualAngryRot = 0.12;
flavorColor = make_color_rgb(239, 228, 176);

if (global.flavor_sprites)
    image_blend = flavorColor;

stage = 0;
earlyWinOutcome = 0;
vcheck = false;
vfightcrit = 0;
vfightnorm = 0;
vfightmiss = 0;
vdidfightcrit = false;
vdidfightnorm = false;
vdidfightmiss = false;
vtalk = 0;
vspare = 0;
vflee = 0;
vitem = 0;
vsfcounter = 0;
override = true;
instance_create_xy(40, 8, obj_md_asg);
