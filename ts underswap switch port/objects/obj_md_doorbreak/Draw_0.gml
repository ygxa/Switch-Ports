for (var i = 0; i < 38; i++)
{
    var r = partRot[i];
    var c = dcos(r);
    var s = dsin(r);
    var xo = imageXOffsets[i];
    var yo = imageYOffsets[i];
    draw_sprite_ext(spr_md_doorparts, i, (x + partX[i]) - (xo * c) - (yo * s), (y + partY[i]) - (xo * -s) - (yo * c), 1, 1, r, c_white, 1 - partInactive[i]);
}
