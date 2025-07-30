door1x = -650;
door2x = 650;
pizzafaceangle = 180;
pizzafaceangleacc = 180;
pizzafaceangleaccto = 0;
dooracc = 4;
dooraccto = 40;
closed = false;
opening = false;
pizzafacestate = 0;
shake = 0;
shake2 = 0;
shake3 = 0;
targetRoom = -4;
fadealpha = 0;
showplayers = true;
p1x = -1000;
p2x = 1000;
titleacc = 25;
p1pal = s_pal_pep;
p1spr = spr_vspeppino;
p1title = spr_vstitle_peppino;
fadedir = 1;

if (global.player1 == "FP")
{
    p1pal = s_pal_fakepep;
    p1spr = spr_vsfakepep;
    p1title = spr_vstitle_fakepep;
}

if (global.player1 == "NO")
{
    p1pal = s_pal_noi;
    p1spr = spr_vsnoise;
    p1title = spr_vstitle_noise;
}

if (global.player1 == "DO")
{
    p1pal = s_pal_doi_win;
    
    if (global.palp1 != 3)
    {
        p1title = spr_vstitle_doise;
        p1spr = spr_vsdoise;
    }
    else
    {
        p1title = spr_vstitle_eldiego;
        p1spr = spr_vsdiego;
    }
}

if (global.player1 == "TV")
{
    p1pal = s_pal_vigi;
    p1spr = spr_vsvigilante;
    p1title = spr_vstitle_vigilante;
}

p2pal = s_pal_pep;
p2spr = spr_vspeppino;
p2title = spr_vstitle_peppino;

if (global.player2 == "FP")
{
    p2pal = s_pal_fakepep;
    p2spr = spr_vsfakepep;
    p2title = spr_vstitle_fakepep;
}

if (global.player2 == "NO")
{
    p2pal = s_pal_noi;
    p2spr = spr_vsnoise;
    p2title = spr_vstitle_noise;
}

if (global.player2 == "TV")
{
    p2pal = s_pal_vigi;
    p2spr = spr_vsvigilante;
    p2title = spr_vstitle_vigilante;
}

if (global.player2 == "DO")
{
    p2pal = s_pal_doi_win;
    
    if (global.palp2 != 3)
    {
        p2title = spr_vstitle_doise;
        p2spr = spr_vsdoise;
    }
    else
    {
        p2title = spr_vstitle_eldiego;
        p2spr = spr_vsdiego;
    }
}

if (global.player2 == "PF")
{
    p2pal = 0;
    p2spr = spr_vspizzaface;
    p2title = spr_vstitle_pizzaface;
}

alarm[4] = 1200;
