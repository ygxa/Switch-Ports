p1pal = s_pal_pep;
image_speed = 0;

switch (global.player1)
{
    case "NO":
        image_index = 1;
        p1pal = s_pal_noi;
        break;
    
    case "DO":
        image_index = 2;
        p1pal = s_pal_doi_win;
        break;
    
    case "FP":
        image_index = 4;
        p1pal = s_pal_fakepep;
        break;
    
    case "TV":
        image_index = 3;
        p1pal = s_pal_vigi;
        break;
}
