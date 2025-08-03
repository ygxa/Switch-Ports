switch (state)
{
    case (0 << 0):
        draw_self();
        break;
    
    case (1 << 0):
        actualAngrySpeed = number_approach_smooth(actualAngrySpeed, angrySpeed, 0.35, 0.1);
        actualAngryRot = number_approach_smooth(actualAngryRot, angryRot, 0.35, 0.1);
        siner += ((1 + (actualAngrySpeed * 0.5)) / 6);
        
        if (siner >= (2 * pi))
            siner -= (2 * pi);
        
        rot = sin(siner) * 30 * actualAngryRot;
        var _x = x - sprite_xoffset;
        var _y = y - sprite_yoffset;
        draw_sprite_ext(spr_mdbody_base, 0, _x + normpartx[0], _y + normparty[0], 2, 2, -rot, image_blend, 1);
        draw_sprite_ext(spr_mdbody_torso, 0, _x + normpartx[1], _y + normparty[1] + (rot * 0.25), 2, 2, rot * 0.5, image_blend, 1);
        draw_sprite_ext(spr_mdbody_lowtorso, 0, _x + normpartx[2], _y + normparty[2], 2, 2, rot / 3, image_blend, 1);
        draw_sprite_ext(face, 0, (_x + normpartx[3]) - (rot / 3), _y + normparty[3] + (rot / 3), 2, 2, rot, image_blend, 1);
        break;
    
    case (2 << 0):
    case (3 << 0):
    case (4 << 0):
        var _x = x - sprite_xoffset;
        var _y = y - sprite_yoffset;
        draw_sprite_ext(spr_mdbody_base, 0, _x + partx[0], _y + party[0], 2, 2, partrot[0], image_blend, 1);
        draw_sprite_ext(spr_mdbody_torso, 0, _x + partx[1], _y + party[1], 2, 2, partrot[1], image_blend, 1);
        draw_sprite_ext(spr_mdbody_lowtorso, 0, _x + partx[2], _y + party[2], 2, 2, partrot[2], image_blend, 1);
        draw_sprite_ext(face, 0, _x + partx[3], _y + party[3], 2, 2, partrot[3], image_blend, 1);
        break;
}
