event_inherited();
currActor = 0;
prevArgState = 0;
argState = 0;
turn = 0;
fadeIn = false;
attackGenerated = false;
attackTime = 0;
attackType = -1;
secondHatFirst = false;
harryActive = true;
larryActive = true;
harryDepth = undefined;
larryDepth = undefined;
shouldMakeHeal = false;
hatBullets = [-4, -4, -4];
hatOrder = [0, 1, 2];
hatIndex = -1;
flyingBirdIdx = -1;
bomb = false;
firstAttacks = [0, 3, 4, 6, 2];
laughTimer = -1;
doneFishPropeller = 0;
isRuth = ruth_enabled();

function move_to_pos(argument0, argument1, argument2)
{
    argument0.x = number_approach_smooth(argument0.x, argument1, 0.5, 0.5);
    argument0.y = number_approach_smooth(argument0.y, argument2, 0.5, 0.5);
}

function dropHat(argument0)
{
    with (argument0)
    {
        showContents();
        
        with (contentObj)
            doContentAction();
    }
    
    sfx_play(snd_click, 80, false);
}

function doLaugh()
{
    if (laughTimer != -1)
        exit;
    
    if (obj_battlemanager.attackTimer < 40)
        exit;
    
    alarm[0] = 10;
    laughTimer = 60;
}

function endLaugh()
{
    if (laughTimer != -1)
    {
        with (obj_harry_monster)
        {
            if (isActive)
            {
                sprite_index = spr_harry_hurt;
                image_speed = 0;
                image_index = 0;
                forceDrawSelf = false;
            }
        }
        
        with (obj_larry_monster)
        {
            if (isActive)
            {
                sprite_index = spr_larry_hurt;
                image_speed = 0;
                image_index = 0;
                forceDrawSelf = false;
            }
        }
    }
}

with (obj_battlemanager)
{
    spareObjOverride = other.id;
    spareEvOverride = 15;
}
