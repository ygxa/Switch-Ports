var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
sprite_index = s_draw_win;

switch (o_manager.winnerlast)
{
    case "PS":
        sprite_index = s_test_win;
        layer_background_sprite(back_id, s_b_results_pep);
        break;
    
    case "NO":
        sprite_index = s_noise_win;
        layer_background_sprite(back_id, s_b_results_noi);
        break;
    
    case "TV":
        sprite_index = s_vigilante_win;
        layer_background_sprite(back_id, s_b_results_vigi);
        break;
    
    case "FP":
        sprite_index = s_fakepep_win;
        layer_background_sprite(back_id, s_b_results_fake);
        break;
    
    case "DO":
        sprite_index = s_doise_win;
        layer_background_sprite(back_id, s_b_results_doi);
        break;
}

if (!audio_is_playing(mu_results))
    audio_play_sound(mu_results, 100, true);
