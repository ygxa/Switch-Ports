function scr_ratblock_destroy()
{
    with (obj_player1)
    {
        if ((other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big) && sprite_index == spr_tumble && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other)))
            instance_destroy(other);
        
        if (state != 13 && state != 54 && (!scr_transformationcheck() || state == 115) && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other) || place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other)))
        {
            switch (state)
            {
                case 115:
                    if (!place_meeting(x, y - 12, other))
                        instance_destroy(other);
                    
                    break;
                
                case 53:
                    if (sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro)
                    {
                        instance_create(x, y, obj_bombexplosion);
                        instance_destroy(other);
                        gamepad_vibrate_constant(1, 0.9);
                        hurted = 1;
                        vsp = -4;
                        image_index = 0;
                        sprite_index = spr_bombpepend;
                        state = 53;
                        bombpeptimer = 0;
                    }
                    
                    break;
                
                case 188:
                case 152:
                case 148:
                case 35:
                case 36:
                case 37:
                case 49:
                case 51:
                    break;
                
                case 7:
                    if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
                        instance_destroy(other);
                    
                    break;
                
                default:
                    if (other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big)
                        instance_destroy(other);
            }
        }
    }
}
