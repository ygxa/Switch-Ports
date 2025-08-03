event_inherited();
spriteSet = 0;
spriteUp = spr_ala_up;
spriteLeft = spr_ala_left;
spriteRight = spr_ala_right;
spriteDown = spr_ala_down;
spriteDownTalk = spr_ala_down_talk;
spriteLeftTalk = spr_ala_left_talk;
spriteRightTalk = spr_ala_right_talk;
spriteUpTalk = spr_ala_up_talk;
talkChar = "adm";

switchSpriteSet = function(argument0)
{
    switch (argument0)
    {
        case 0:
        default:
            spriteUp = spr_ala_up;
            spriteLeft = spr_ala_left;
            spriteRight = spr_ala_right;
            spriteDown = spr_ala_down;
            spriteDownTalk = spr_ala_down_talk;
            spriteLeftTalk = spr_ala_left_talk;
            spriteRightTalk = spr_ala_right_talk;
            spriteUpTalk = spr_ala_up_talk;
            break;
        
        case 1:
            spriteUp = spr_ala_up_dark;
            spriteLeft = spr_ala_left_dark;
            spriteRight = spr_ala_right_dark;
            spriteDown = spr_ala_down_dark;
            spriteDownTalk = spr_ala_down_dark;
            spriteLeftTalk = spr_ala_left_dark;
            spriteRightTalk = spr_ala_right_dark;
            spriteUpTalk = spr_ala_up_dark;
            break;
    }
    
    spriteSet = argument0;
};
