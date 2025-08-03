draw_self();

if (spawnFade != 0)
{
    var scale = (1 - spawnFade) * 4;
    draw_sprite_ext(sprite_index, 0, xstart, ystart + obj_mettalot_monster.verticalOffset, scale, scale, 0, #D591FF, spawnFade);
}
