var px = x;
var py = y;
actor_shake_visual();
var ropeStartY = (floor(camera_get_view_y(view_get_camera(0)) / 2) * 2) - 32;
var ropeHeight = (y + 30) - ropeStartY;

switch (state)
{
    case (1 << 0):
        draw_sprite(spr_crys_lift_carriage, floor(moveFrameIndex), x, y);
        draw_sprite_stretched(spr_crys_lift_rope, 0, x + 19, ropeStartY, 3, ropeHeight);
        
        if (jumpProgress < 0.5)
        {
            draw_sprite(spr_crys_lift_carriage, 3, x, y);
            draw_sprite(spr_crys_lift_direction, moveDirection, x, y);
        }
        
        draw_sprite(jumpSprite, 0, jumpX, jumpY);
        
        switch (items_get_armor())
        {
            case 6:
            case 49:
                draw_sprite(spr_chara_jump, 1, jumpX, jumpY);
                break;
            
            case 25:
                draw_sprite(spr_chara_jump, 2, jumpX, jumpY);
                break;
            
            case 26:
                draw_sprite(spr_chara_jump, 3, jumpX, jumpY);
                break;
        }
        
        if (jumpProgress >= 0.5)
        {
            draw_sprite(spr_crys_lift_carriage, 3, x, y);
            draw_sprite(spr_crys_lift_direction, moveDirection, x, y);
        }
        
        break;
    
    case (3 << 0):
        draw_sprite(spr_crys_lift_carriage, floor(moveFrameIndex), x, y);
        draw_sprite_stretched(spr_crys_lift_rope, 0, x + 19, ropeStartY, 3, ropeHeight);
        
        if (peerIndex == -1)
        {
            with (obj_player)
            {
                x = other.x + 20 + floor(other.charaOffset) + floor(other.charaShake);
                y = other.y + 5;
                visible = true;
                floorCoords = false;
                event_perform(ev_draw, ev_draw_normal);
                visible = false;
                floorCoords = true;
            }
        }
        
        draw_sprite(spr_crys_lift_carriage, 3, x, y);
        draw_sprite(spr_crys_lift_direction, moveDirection, x, y);
        
        if (peerIndex != -1)
        {
            with (obj_player)
            {
                x = other.x + 20 + floor(other.charaOffset) + floor(other.charaShake);
                y = other.y + 5;
                visible = false;
            }
            
            var peerOffset = 0;
            
            switch (items_get_armor())
            {
                case 6:
                case 49:
                    peerOffset = 2;
                    break;
                
                case 25:
                    peerOffset = 4;
                    break;
                
                case 26:
                    peerOffset = 6;
                    break;
            }
            
            draw_sprite(spr_chara_peer, peerOffset + peerIndex, x + floor(charaShake), y);
        }
        
        break;
    
    case (4 << 0):
        draw_sprite(spr_crys_lift_carriage, floor(moveFrameIndex), x, y);
        
        if (collapseTimer >= 26)
        {
            ropeHeight = 150 - ropeStartY;
            ropeStartY -= 60;
        }
        
        draw_sprite_stretched(spr_crys_lift_rope, 0, x + 19, ropeStartY, 3, ropeHeight);
        
        with (obj_player)
        {
            x = other.x + 20;
            y = other.y + 5;
            visible = true;
            floorCoords = false;
            event_perform(ev_draw, ev_draw_normal);
            visible = false;
            floorCoords = true;
        }
        
        draw_sprite(spr_crys_lift_carriage, 3, x, y);
        draw_sprite(spr_crys_lift_direction, moveDirection, x, y);
        break;
    
    default:
        draw_sprite(spr_crys_lift_carriage, floor(moveFrameIndex), x, y);
        draw_sprite_stretched(spr_crys_lift_rope, 0, x + 19, ropeStartY, 3, ropeHeight);
        draw_sprite(spr_crys_lift_carriage, 3, x, y);
        draw_sprite(spr_crys_lift_direction, moveDirection, x, y);
        break;
}

x = px;
y = py;
