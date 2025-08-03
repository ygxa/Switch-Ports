event_inherited();

switch (global.bev_subtype)
{
    case 0:
        boneId = 0;
        currHspeed = 0;
        currVspeed = 0;
        bulletCurve = undefined;
        bt_set_boxtype((1 << 0));
        
        if (fightType != 2)
            dx_attack("battles.cb.attack_start");
        else
            dx_attack("battles.cb_g.attack_start");
        
        break;
    
    case 1:
        dx_attack_update();
        
        if (boxSinerSpeed != 0)
        {
            with (obj_battlemanager)
            {
                boxDestX1 += (cos(other.boxSiner) * other.boxSinerAmplitude * other.boxSinerSpeed);
                boxDestX2 += (cos(other.boxSiner) * other.boxSinerAmplitude * other.boxSinerSpeed);
            }
            
            boxSiner += boxSinerSpeed;
        }
        
        break;
    
    case 2:
        attackedThisTurn = false;
        actualMissThisTurn = false;
        sprite_index = normalSprite;
        boxSinerSpeed = 0;
        boxSiner = 0;
        vextrasb = 0;
        break;
}
