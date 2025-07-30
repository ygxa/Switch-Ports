var i = ds_list_size(global.AfterImageList) - 1;

while (i > -1)
{
    with (ds_list_find_value(global.AfterImageList, i))
    {
        if (lifeTime > 0)
            lifeTime--;
        else
            vanish = true;
        
        if (doesBlink)
        {
            visible = global.BlinkTrail;
            
            if (afterImageType == 2)
                afterImageIndex = choose(0, 1);
        }
        
        if (afterImageType == 2)
        {
            if (!(ownerID.state == 94 && ownerID.sprite_index == spr_null) && ownerID.pizzapepper == 0 && ownerID.state != 193 && ownerID.state != 57 && ownerID.state != 110 && ownerID.state != 99 && ownerID.state != 149 && ownerID.state != 43 && ownerID.state != 82 && ownerID.state != 43 && ownerID.state != 33 && ownerID.state != 104 && ownerID.state != 6 && ownerID.pogochargeactive == 0 && ownerID.state != 22 && ownerID.state != 123 && ownerID.state != 39 && ownerID.state != 21 && ownerID.state != 130 && ownerID.state != 106 && ownerID.state != 44 && ownerID.state != 107 && ownerID.state != 77 && ownerID.state != 65 && ownerID.state != 75 && ownerID.state != 78 && ownerID.state != 67 && ownerID.state != 63 && ownerID.state != 99 && ownerID.state != 35)
                vanish = true;
            
            image_alpha = 0.65;
            
            if (ownerID.state == 106 || ownerID.state == 105 || ownerID.state == 123)
                image_alpha *= (abs(ownerID.movespeed) / 12);
            
            with (ownerID)
            {
                if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
                    other.vanish = true;
            }
        }
        
        if (vanish)
        {
            fadingAlpha = approach(fadingAlpha, 0, (afterImageType > 2) ? 0.05 : 0.15);
            
            if (fadingAlpha <= 0)
                ds_list_delete(global.AfterImageList, i);
        }
    }
    
    i--;
}

if (blinkingBuffer > 0)
{
    blinkingBuffer--;
}
else
{
    event_user(0);
    blinkingBuffer = blinkingBufferMax;
}
