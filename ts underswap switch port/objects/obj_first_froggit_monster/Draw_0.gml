if (!visible)
    exit;

if (doLook || sprite_index != spr_froglook)
{
    draw_self();
}
else
{
    draw_sprite_ext(spr_frogbody, head.image_index, x + 12, y + 60, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(head.sprite_index, head.image_index, x + head.x, y + head.y, 2, 2, 0, image_blend, 1);
}
