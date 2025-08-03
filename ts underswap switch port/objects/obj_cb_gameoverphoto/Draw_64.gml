if (!is_undefined(sprite))
{
    var tex = sprite_get_texture(sprite, 0);
    var uvs = sprite_get_uvs(sprite, 0);
    draw_sprite_ext(spr_cb_gameoverphoto_bg, 0, x, y, 2, 2, 0, c_white, 1);
    gpu_set_tex_filter(true);
    draw_set_color(c_white);
    
    if (global.use_shaders)
        shader_set(shd_sepia);
    
    draw_primitive_begin_texture(pr_trianglelist, tex);
    var xMidUV = uvs[0] + ((uvs[2] - uvs[0]) * 0.9);
    var yMidUV = uvs[1] + ((uvs[3] - uvs[1]) * 0.14);
    draw_vertex_texture(x - 140, y - 100, uvs[0], uvs[1]);
    draw_vertex_texture((x + 140) - 28, y - 100, xMidUV, uvs[1]);
    draw_vertex_texture(x - 140, y + 100, uvs[0], uvs[3]);
    draw_vertex_texture((x + 140) - 28, y - 100, xMidUV, uvs[1]);
    draw_vertex_texture(x - 140, y + 100, uvs[0], uvs[3]);
    draw_vertex_texture((x + 140) - 28, y + 100, xMidUV, uvs[3]);
    draw_vertex_texture((x + 140) - 28, y + 100, xMidUV, uvs[3]);
    draw_vertex_texture((x + 140) - 28, (y - 100) + 28, xMidUV, yMidUV);
    draw_vertex_texture(x + 140, y + 100, uvs[2], uvs[3]);
    draw_vertex_texture((x + 140) - 28, (y - 100) + 28, xMidUV, yMidUV);
    draw_vertex_texture(x + 140, y + 100, uvs[2], uvs[3]);
    draw_vertex_texture(x + 140, (y - 100) + 28, uvs[2], yMidUV);
    draw_primitive_end();
    
    if (global.use_shaders)
        shader_reset();
    
    gpu_set_tex_filter(false);
    draw_sprite_ext(spr_cb_gameoverphoto_bg, 1, x, y, 2, 2, 0, c_white, 1);
}
