if (helicopter)
{
    var _x = x;
    
    if (irandom(1) == 0)
        x += irandom(1);
    
    draw_self();
    x = _x;
}
else
{
    var headSpr = spr_lesserdog_head;
    var headSpr2 = spr_lesserdog_head2;
    
    if (sprite_index == spr_lesserdog_hurt)
    {
        headInd = 2;
        tailInd = 0;
        headSpr = spr_lesserdog_hurt;
        headSpr2 = spr_lesserdog_hurt2;
    }
    
    var head = floor(headInd);
    draw_sprite_ext(spr_lesserdog_tail, floor(tailInd), x, y, image_xscale, image_yscale, 0, image_blend, 1);
    draw_sprite_ext(spr_lesserdog_base, 0, x, y, image_xscale, image_yscale, 0, image_blend, 1);
    draw_sprite_ext(spr_lesserdog_arms, 0, x, y + ((head == 1 || head == 2) ? 0 : 2), image_xscale, image_yscale, 0, image_blend, 1);
    
    if (neckLength == 0)
    {
        draw_sprite_ext(headSpr, head, x, y + ((head == 1 || head == 2) ? 2 : 0), image_xscale, image_yscale, 0, image_blend, 1);
    }
    else if (neckLength < 5)
    {
        draw_sprite_ext(spr_lesserdog_neck, 0, x + 34 + 22, (y + 52) - (neckLength * 2.5), 2, neckLength * 2.5, 0, image_blend, 1);
        draw_sprite_ext(spr_lesserdog_head, 4, x, y, image_xscale, image_yscale, 0, image_blend, 1);
        draw_sprite_ext(spr_lesserdog_head3, head, x, (y - (neckLength * 2)) + ((head == 1 || head == 2) ? 2 : 0), image_xscale, image_yscale, 0, image_blend, 1);
    }
    else
    {
        draw_sprite_ext(spr_lesserdog_neck, 0, x + 34 + 22, (y + 52) - (neckLength * 2), 2, neckLength * 2, 0, image_blend, 1);
        draw_sprite_ext(spr_lesserdog_head, 4, x, y, image_xscale, image_yscale, 0, image_blend, 1);
        draw_sprite_ext(headSpr2, head, x, (y - (neckLength * 2)) + ((head == 1 || head == 2) ? 2 : 0), image_xscale, image_yscale, 0, image_blend, 1);
    }
    
    for (var i = 0; i < addNeckCount; i++)
    {
        switch (addNeckSide[i])
        {
            case 1:
                draw_sprite_ext(spr_lesserdog_neck, 0, addNeckX[i] + (addNeckScale[i] * 56), 0, 2 * addNeckScale[i], addNeckLength[i] * 2 * addNeckScale[i], 0, image_blend, 1);
                draw_sprite_ext(headSpr2, head, addNeckX[i], (addNeckScale[i] * (addNeckLength[i] + 30) * 2) + ((head == 1 || head == 2) ? (addNeckScale[i] * 2) : 0), image_xscale * addNeckScale[i], image_yscale * -addNeckScale[i], 0, image_blend, 1);
                break;
            
            case 0:
                draw_sprite_ext(spr_lesserdog_neck, 0, addNeckX[i] + (addNeckScale[i] * 56), 480 - (addNeckScale[i] * addNeckLength[i] * 2), 2 * addNeckScale[i], addNeckLength[i] * 2 * addNeckScale[i], 0, image_blend, 1);
                draw_sprite_ext(headSpr2, head, addNeckX[i], (480 - (addNeckScale[i] * (addNeckLength[i] + 30) * 2)) + ((head == 1 || head == 2) ? (addNeckScale[i] * 2) : 0), image_xscale * addNeckScale[i], image_yscale * addNeckScale[i], 0, image_blend, 1);
                break;
        }
    }
    
    headInd += 0.05;
    
    if (floor(headInd) >= 4)
        headInd -= 4;
    
    tailInd += 0.30000000000000004;
    
    if (vtruepet >= 3)
        tailInd += 0.30000000000000004;
    else if (vtruepet >= 2)
        tailInd += 0.15000000000000002;
    
    if (vcall >= 101)
        tailInd += 0.6000000000000001;
    else if (vcall >= 100)
        tailInd += 0.30000000000000004;
    
    if (floor(tailInd) >= 6)
        tailInd -= 6;
}

if (global.debug)
{
    if (keyboard_check(vk_f3))
    {
        if (keyboard_check_pressed(ord("U")))
            neckLength++;
        
        if (keyboard_check_pressed(ord("J")))
            neckLength--;
    }
}
