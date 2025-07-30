image_speed = 0.35;
chose = 0;
message = "";
comboAnim = false;
showtext = 0;
tvsprite = spr_tvoff;
noisesprite = spr_player_freefall2;
xi = 500;
yi = 600;
imageindexstore = 0;
chooseOnecomboend = true;
ComboShake = false;
comboendImage = 0;
comboendSprite = spr_badcombo_boil;
combocanFade = true;
once = 0;
global.hurtcounter = 0;
global.hurtmilestone = 3;
global.mallowfollow = 0;
global.crackfollow = 0;
alpha = 1;
shownranka = 0;
shownrankb = 0;
shownrankc = 0;
global.erank = 0;
global.srank = 0;
global.arank = 0;
global.brank = 0;
global.crank = 0;
character = "PIZZELLE";
BarSurface = -4;
BarX = 0;
tvcount = 500;
draw_combo = 0;
combofade = 0;
invsprite = spr_invempty;
staticdraw = 0;
statictimer = 20;
ChannelState = 0;
OLDChannelState = 0;
playerstate = obj_player.state;
supermario = 0;
tvlength = 0;
propindex = 0;
statindex = 0;
bobbing = 0;
global.newhudtvanim = ds_queue_create();
alarm[1] = 1;
DrawY = 0;

function scr_combotext(argument0 = global.combo)
{
    var sprite = spr_badcombo_intro;
    
    if (argument0 < 5)
    {
        sprite = spr_badcombo_intro;
        
        if (chance(0.25))
            scr_dialogue(120);
    }
    else if (argument0 < 10)
    {
        sprite = spr_sourcombo_intro;
        
        if (chance(0.5))
            scr_dialogue(26);
    }
    else if (argument0 < 15)
    {
        sprite = spr_okcombo_intro;
        
        if (chance(0.75))
            scr_dialogue(32);
    }
    else if (argument0 < 15)
    {
        sprite = spr_alrightcombo_intro;
        
        if (chance(0.85))
            scr_dialogue(79);
    }
    else if (argument0 < 20)
    {
        sprite = spr_sweetcombo_intro;
        scr_dialogue(16);
    }
    else if (argument0 < 25)
    {
        sprite = spr_spicycombo_intro;
        scr_dialogue(5);
    }
    else if (argument0 < 30)
    {
        sprite = spr_ruthlesscombo_intro;
        scr_dialogue(119);
    }
    else
    {
        sprite = spr_wtfcombo_intro;
        scr_dialogue(121);
    }
    
    return sprite;
}
