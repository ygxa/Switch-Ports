function Scr_SetMatchIcons()
{
    switch (p1ch)
    {
        case "PS":
            p1pal = s_pal_pep;
            p1spr = s_match_pep;
            p1spr_w = s_match_pep_w;
            p1spr_l = s_match_pep_l;
            break;
        
        case "NO":
            p1pal = s_pal_noi;
            p1spr = s_match_noi;
            p1spr_w = s_match_noi_w;
            p1spr_l = s_match_noi_l;
            break;
        
        case "DO":
            p1pal = s_pal_doi_win;
            p1spr = s_match_doi;
            p1spr_w = s_match_doi_w;
            p1spr_l = s_match_doi_l;
            break;
        
        case "FP":
            p1pal = s_pal_fakepep;
            p1spr = s_match_faker;
            p1spr_w = s_match_faker_w;
            p1spr_l = s_match_faker_l;
            break;
        
        case "TV":
            p1pal = s_pal_vigi;
            p1spr = s_match_vigi;
            p1spr_w = s_match_vigi_w;
            p1spr_l = s_match_vigi_l;
            break;
    }
    
    switch (p2ch)
    {
        case "PS":
            p2pal = s_pal_pep;
            p2spr = s_match_pep;
            p2spr_w = s_match_pep_w;
            p2spr_l = s_match_pep_l;
            break;
        
        case "FP":
            p2pal = s_pal_fakepep;
            p2spr = s_match_faker;
            p2spr_w = s_match_faker_w;
            p2spr_l = s_match_faker_l;
            break;
        
        case "NO":
            p2pal = s_pal_noi;
            p2spr = s_match_noi;
            p2spr_w = s_match_noi_w;
            p2spr_l = s_match_noi_l;
            break;
        
        case "TV":
            p2pal = s_pal_vigi;
            p2spr = s_match_vigi;
            p2spr_w = s_match_vigi_w;
            p2spr_l = s_match_vigi_l;
            break;
        
        case "DO":
            p2pal = s_pal_doi_win;
            p2spr = s_match_doi;
            p2spr_w = s_match_doi_w;
            p2spr_l = s_match_doi_l;
            break;
    }
}
