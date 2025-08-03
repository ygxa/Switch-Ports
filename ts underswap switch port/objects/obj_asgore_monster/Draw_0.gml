if (animatedBody)
{
    var shake = 0;
    
    if (vruth == 1)
    {
        if (irandom(8) == 0)
            shake = irandom(2) - 1;
    }
    else if (vruth == 2)
    {
        if (irandom(5) == 0)
            shake = irandom(4) - 2;
    }
    else if (vruth == 3)
    {
        if (irandom(4) == 0)
            shake = irandom(4) - 2;
    }
    
    draw_sprite_ext(spr_asgb_cape, floor(capeIndex), x, y + capeY, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_asgb_legs, 0, x + 76, y + 154, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_asgb_arml, 0, x + 64, y + armLY, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_asgb_armr, 0, x + 184, y + armRY, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_asgb_torso, 0, x + 50, y + torsoY, 2, 2, 0, image_blend, 1);
    var f = cos(siner) * 4;
    draw_sprite_ext(spr_asgb_forearml, 0, x + shake + 58, y + spearY + 60 + f, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_asgb_forearmr, 0, x + shake + 190, y + spearY + 68 + f, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_asgb_head, 0, x + 92, y + headY, 2, 2, 0, image_blend, 1);
    
    if (drawSpear)
        draw_sprite_ext(spr_asgb_spear, 0, (x + shake) - 52, y + spearY, 2, 2, 0, c_white, 1);
    
    draw_sprite_ext(spr_asgb_handl, 0, x + shake + 64, y + spearY + 38, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_asgb_handr, 0, x + shake + 186, y + spearY + 82, 2, 2, 0, image_blend, 1);
}
else if (visible)
{
    if (kneeling)
    {
        draw_sprite_ext(sprite_index, isRuth && hp <= 0, x, y, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(face, image_index, x + 98, y + 32, 2, 2, 0, image_blend, 1);
    }
    else if (sprite_index != -1)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, image_blend, 1);
    }
}
