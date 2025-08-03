depth = 40;
imageXOffsets = array_create(38);
imageYOffsets = array_create(38);
partX = array_create(38);
partY = array_create(38);
partXSpd = array_create(38);
partYSpd = array_create(38);
partRot = array_create(38);
partRotSpd = array_create(38);
partInactive = array_create(38);

for (var i = 0; i < 38; i++)
{
    var uvs = sprite_get_uvs(spr_md_doorparts, i);
    var tex = sprite_get_texture(spr_md_doorparts, i);
    var texW = 1 / texture_get_texel_width(tex);
    var texH = 1 / texture_get_texel_height(tex);
    var left = floor(uvs[0] * texW);
    var top = floor(uvs[1] * texH);
    var right = floor(uvs[2] * texW);
    var bottom = floor(uvs[3] * texH);
    imageXOffsets[i] = (uvs[4] + floor((left + right) * 0.5)) - left;
    imageYOffsets[i] = (uvs[5] + floor((top + bottom) * 0.5)) - top;
    partX[i] = imageXOffsets[i];
    partY[i] = imageYOffsets[i];
    partXSpd[i] = (random(4) - 2) * 0.65;
    partYSpd[i] = 3;
    partRot[i] = 0;
    
    if (irandom(1) == 0)
        partRotSpd[i] = irandom_range(10, 35);
    else
        partRotSpd[i] = -irandom_range(10, 35);
    
    partInactive[i] = 0;
}

obj_ruin_door.open = true;
view_shake(4, 3);
view_flash();
instance_create_xy(150, 320, obj_md_doorow);
sfx_play(snd_dooropen);
instance_destroy(obj_md_stand);
