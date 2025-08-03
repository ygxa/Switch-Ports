if (backLayerAlpha != 0)
{
    draw_sprite_ext(spr_gameoverbg, 0, 0, backLayerYOff, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_chara_wake, charaStage, 286, 334 + (((charaShake % 2) == 0) ? 0 : 2) + backLayerYOff, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameoverlight, 0, 0, backLayerYOff, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameovershadow, 0, 0, backLayerYOff, 640, 2, 0, c_white, 1);
    
    if (backLayerAlpha != 1)
        draw_rectangle_pix(0, 0, 640, 480, 0, 1 - backLayerAlpha);
}

draw_sprite_ext(lang_get_sprite(spr_gameover), 0, 0, 0, 2, 2, 0, c_white, bigTextAlpha);

if (writer != -4 && state >= 0 && textAlpha != 0)
{
    var split = string_split(writer.internalStr, "#");
    var lineCount = array_length(split);
    draw_set_alpha(textAlpha);
    
    for (var i = 0; i < lineCount; i++)
    {
        switch (textType)
        {
            case 3:
                draw_text_style(textX[i] + global.lang_data[global.lang_bound].offsets.gameover_text_x, textY + (i * global.lang_charheight_lg) + global.lang_data[global.lang_bound].offsets.gameover_text_y, split[i], 16777215, fnt_sans, global.lang_charwidth_md);
                break;
            
            case 4:
                draw_text_style(textX[i] + global.lang_data[global.lang_bound].offsets.gameover_text_x, textY + (i * global.lang_charheight_lg) + global.lang_data[global.lang_bound].offsets.gameover_text_y, split[i], 16777215, fnt_papyrus, global.lang_charwidth_lg2);
                break;
            
            default:
                draw_text_style(textX[i] + global.lang_data[global.lang_bound].offsets.gameover_text_x, textY + (i * global.lang_charheight_lg) + global.lang_data[global.lang_bound].offsets.gameover_text_y, split[i], 16777215, fnt_main, global.lang_charwidth_md);
                break;
        }
    }
    
    draw_set_alpha(1);
}

if (state == -2 || state == -2.5)
{
    draw_set_alpha(textAlpha);
    set_font(fnt_main);
    draw_set_color(c_white);
    draw_text_mono_centered(320 + global.lang_data[global.lang_bound].offsets.gameover_question_x, textY + global.lang_data[global.lang_bound].offsets.gameover_question_y, dxd_raw("gameover.question"));
    draw_set_halign(fa_center);
    draw_set_color((choice == 0) ? c_yellow : c_white);
    draw_text(220 + global.lang_data[global.lang_bound].offsets.gameover_choice_x[0], textY + 36 + global.lang_data[global.lang_bound].offsets.gameover_choice_y, dxd_raw(permadeath ? "gameover.lreset" : "gameover.lcontinue"));
    draw_set_color((choice == 1) ? c_yellow : c_white);
    draw_text(438 + global.lang_data[global.lang_bound].offsets.gameover_choice_x[1], textY + 36 + global.lang_data[global.lang_bound].offsets.gameover_choice_y, dxd_raw("gameover.lquit"));
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}
