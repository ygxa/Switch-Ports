if !obj_endscreencard.visible
	draw_sprite_tiled_ext(bg_credits, 0, bgCredits.x, 0, 1, 1, bgCredits.image_blend, bgCredits.image_alpha);
	
draw_sprite_ext(spr_biggnomestudios_logosimple, 0, 0, 0, 1, 1, 0, c_white, showLogo * logoAlpha);

if (creditPhase == 1)
{
    if (currentCategory >= 0 && currentCategory < categoryCount)
    {
        for (var i = 0; i < categoryCount; i++)
        {
            var _nameArr = creditEntries[i][1];
            array_foreach(_nameArr, function(arg0, arg1)
            {
                arg0.draw();
            });
        }
        
        draw_set_color(c_white);
        
        if (killCounterArr[currentCategory] == array_length(creditEntries[currentCategory][1]))
            draw_set_color(c_yellow);
        
        //draw_text_scribble(camera_get_view_width(view_camera[0]) / 2, 100, string("[fa_center][fa_middle][smallfont]{0}", string_upper(creditEntries[currentCategory][0])));
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(global.smallfont)
		draw_text(camera_get_view_width(view_camera[0]) / 2, 100, string(string_upper(creditEntries[currentCategory][0])))
        draw_set_color(c_white);
    }
}

draw_set_alpha(fadeAlpha);
draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_player_sprite(obj_pizzelleflick.sprite_index, obj_pizzelleflick.image_index, obj_pizzelleflick.x, obj_pizzelleflick.y)
