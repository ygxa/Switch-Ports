draw_self();

if (bananaFalling && instance_exists(bananaBul) && !bananaBul.landedOnRow)
{
    var _x = bananaBul.x;
    var _y = obj_battleheart_purple.getRowY(bananaTargetRow);
    var progress = clamp((_y - bananaBul.y) / (_y - y), 0, 1);
    draw_sprite_ext(spr_banana_bul, bananaBul.image_index, _x, _y, 1, 1, 0, c_gray, 1 - max(0.3, progress));
}
