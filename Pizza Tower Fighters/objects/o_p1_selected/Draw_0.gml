switch (global.player1)
{
    case "PS":
        pal_swap_set(s_pal_pep, global.palp1, false);
        draw_self();
        pal_swap_reset();
        break;
    
    case "NO":
        pal_swap_set(s_pal_noi, global.palp1, false);
        draw_self();
        pal_swap_reset();
        break;
    
    case "TV":
        pal_swap_set(s_pal_vigi, global.palp1, false);
        draw_self();
        pal_swap_reset();
        break;
    
    case "FP":
        pal_swap_set(s_pal_fakepep, global.palp1, false);
        draw_self();
        pal_swap_reset();
        break;
    
    case "DO":
        pal_swap_set(s_pal_doi_win, global.palp1, false);
        draw_self();
        pal_swap_reset();
        break;
}
