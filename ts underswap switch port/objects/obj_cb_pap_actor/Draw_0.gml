var px = x;
var py = y;
actor_shake_visual();

switch (sprite_index)
{
    case spr_papb_handup_face:
        draw_sprite_ext(spr_papb_handup, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_self();
        break;
    
    case spr_papb_stomp:
        draw_self();
        break;
    
    default:
        draw_sprite_ext(pose, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        x += 50;
        draw_self();
        break;
}

x = px;
y = py;
