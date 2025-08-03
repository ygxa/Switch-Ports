if (instance_exists(obj_speechbubble) && instance_exists(obj_speechbubble.writer) && !obj_speechbubble.writer.isDone)
{
    image_speed = 0.2;
}
else
{
    image_speed = 0;
    image_index = 0;
}

if (faceSprite == spr_beenardfaceb_think)
    bodySprite = spr_beenard_body_think;
else
    bodySprite = spr_beenard_body;

if (attackType == 1 && !visible)
{
    siner = 0;
}
else
{
    var _hp = hp;
    
    if (instance_exists(obj_battledamage))
        _hp = obj_battledamage.monsterHpTarget;
    
    hpRatio = _hp / maxHp;
    
    if (isActive && hpRatio > 0)
    {
        if (attackType != 1 || bulletsGenerated)
        {
            siner += (0.125 * hpRatio);
            
            if (siner >= (2 * pi))
                siner -= (2 * pi);
            
            yhover = (yhover + (30 + (30 * (1 - hpRatio)))) * 0.5;
            y = ystart + yhover + (20 * sin(siner));
        }
        
        wingIndex += (0.25 * min(1, hpRatio * 2));
        
        if (floor(wingIndex) >= 2)
            wingIndex -= 2;
    }
}
