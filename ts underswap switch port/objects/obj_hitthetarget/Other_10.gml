event_inherited();

switch (state)
{
    case 1:
        setSkip(true);
        
        with (soul)
        {
            boundsX = [other.borderLeft + 5, other.borderRight - 21];
            boundsY = [other.borderTop + 5, other.borderBottom - 21];
        }
        
        dt_speech_bubble(370, 648, "stars.htt_explain");
        break;
    
    case 10:
        dx_scene("stars.htt_very_easy");
        incStateCallbackThisFrame = false;
        break;
    
    case 11:
        dx_scene("stars.htt_easy");
        incStateCallbackThisFrame = false;
        break;
    
    case 12:
        dx_scene("stars.htt_normal");
        incStateCallbackThisFrame = false;
        break;
    
    case 13:
        dx_scene("stars.htt_hard");
        incStateCallbackThisFrame = false;
        break;
    
    case 14:
        dx_scene("stars.htt_very_hard");
        incStateCallbackThisFrame = false;
        break;
    
    case 19:
        alarm[0] = 100;
        break;
    
    case 20:
        with (obj_hangoutmanager)
            triggerEnd();
        
        break;
}
