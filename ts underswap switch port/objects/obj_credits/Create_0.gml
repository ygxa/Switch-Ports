extraLoc = 
{
    russian_loc: "Russian Localization",
    ru_cozy_inn: "Cozy Inn Team",
    ru_zakuro: "Zakuro",
    ru_translator: "Translator",
    ru_proofreader: "Proofreader",
    ru_artist_font: "Artist, font designer",
    ru_voice: "Voice actor",
    italian_loc: "Italian Localization",
    it_0: "L'Armadio",
    it_0r: "Main translator, sprite artist, proofreader",
    it_1: "EuvierUWU",
    it_1r: "Proofreader",
    it_2: "Green-Hat",
    it_2r: "Translator, proofreader",
    it_3: "Andrea Bruzzone",
    it_3r: "Sprite artist, proofreader",
    it_4: "Ernest_thor",
    it_4r: "Voice actor",
    demo_1_loc: "Demo v1.0 Localization"
};

switch (global.lang_data[global.lang_bound].language_code)
{
    case "ru":
        extraLoc.russian_loc = "Перевод на русский";
        extraLoc.ru_cozy_inn = "Команда Cozy Inn";
        extraLoc.ru_zakuro = "тёмыч";
        extraLoc.ru_translator = "Переводчик";
        extraLoc.ru_proofreader = "Корректор";
        extraLoc.ru_artist_font = "Художник, дизайнер шрифтов";
        extraLoc.ru_voice = "Актёр озвучки";
        extraLoc.demo_1_loc = "Переводы для демоверсии 1.0";
        break;
    
    case "it":
        extraLoc.italian_loc = "Localizzazione Italiana";
        extraLoc.it_0r = "Traduttore principale, grafico, revisore";
        extraLoc.it_1r = "Revisore";
        extraLoc.it_2 = "Cappello-Verde";
        extraLoc.it_2r = "Traduttore, revisore";
        extraLoc.it_3r = "Grafico, revisore";
        extraLoc.it_4r = "Doppiatore";
        extraLoc.demo_1_loc = "Localizzazioni Demo v1.0";
        break;
}

var trans1 = dxd_raw("credits.translator_credit");
var trans2 = dxd_raw("credits.translator_credit2");
var useTrans1 = trans1 != "<NOTICE TO TRANSLATORS: REPLACE THIS WITH TRANSLATION AUTHOR NAMES FOR CREDIT IN CREDITS SEQUENCE>";
var useTrans2 = trans2 != "<NOTICE TO TRANSLATORS: REPLACE THIS WITH TRANSLATION ATTRIBUTION INFO FOR CREDIT IN CREDITS SEQUENCE>";
content = [[0, dxd_raw("credits.directed_by")], [1, "Beethovenus", dxd_raw("credits.c_creative")], [1, "BeholdMaxine", dxd_raw("credits.c_writing")], [1, "cal", dxd_raw("credits.c_writing_co")], [1, "Chip Potato", dxd_raw("credits.c_art")], [1, "colinator27", dxd_raw("credits.c_coding")], [1, "NyakoFox", dxd_raw("credits.c_coding_co")], [1, "Ethosein", dxd_raw("credits.c_music")], [-1], [0, dxd_raw("credits.artwork_by")], [1, "Chip Potato" + dxd_raw("credits.c_lead")], [1, "Beethovenus"], [1, "Cap'n Toad"], [1, "Depresso"], [1, "Devilredd"], [1, "EllisBros"], [1, "FifLeo"], [13, "MrkySpices", dxd_raw("credits.c_former")], [1, "NetherHeartz", "Cammy"], [1, "Pixelated Engie", "Cerulean"], [1, "SilverTotodile", "Datudou"], [1, "StarbirbZ", "Delta Conduit"], [1, "SuperKirbylover", "emihead"], [1, "swords" + dxd_raw("credits.c_consultant"), "FmsDraws"], [1, "Treppy", "Frigadae"], [1, "Yamaduki", "Pizza Tony"], [-1], [0, dxd_raw("credits.music_by")], [1, "Ethosein" + dxd_raw("credits.c_lead")], [13, "colinator27", dxd_raw("credits.c_former")], [1, "DashingToadie", "Delta Conduit"], [1, "Devilredd", "Grassinio"], [1, "Jamangar", "jacksqrd"], [1, "LucasPucas", "Lucidis"], [1, "Philiplol", "Paledoptera"], [1, "SmartCellist1", "Robin Blend"], [1, "Zaid", "The Musical Ghost"], [-1], [0, dxd_raw("credits.written_by")], [1, "Beethovenus" + dxd_raw("credits.c_lead")], [1, "cal" + dxd_raw("credits.c_colead")], [1, "Cap'n Toad"], [1, "Chip Potato"], [1, "Depresso"], [1, "Devilredd"], [1, "LOLika"], [1, "SilverTotodile"], [13, "SuperKirbylover", dxd_raw("credits.c_former")], [1, "swords" + dxd_raw("credits.c_consultant"), "Cerulean"], [1, "BeholdMaxine", "emihead"], [-1], [0, dxd_raw("credits.coding")], [1, "colinator27" + dxd_raw("credits.c_lead")], [1, "NyakoFox" + dxd_raw("credits.c_colead")], [1, "CheezedFish"], [1, "IAmAnIssue"], [1, "sophiedeergirl"], [1, "TheFamiliarScoot"], [1, "afanguy" + dxd_raw("credits.c_consultant")], [1, "Qwert/er" + dxd_raw("credits.c_consultant")], [1, "ShinoInari" + dxd_raw("credits.c_consultant")], [-1], [0, dxd_raw("credits.beta_testing")], [9, "afanguy", "Beethovenus"], [9, "Chip Potato", "DashingToadie"], [9, "Depresso", "EllisBros"], [9, "Ethosein", "FifLeo"], [1, "NetherHeartz"], [1, "NyakoFox"], [1, "LucasPucas"], [13, "ShinoInari", dxd_raw("credits.c_former")], [1, "SmartCellist1", "Cerulean"], [1, "SuperKirbylover", "emihead"], [1, "Yamaduki", "Grassinio"], [1, "Zaid", "Lucidis"], [-1], [2, dxd_raw("credits.c_localization")], [0, extraLoc.italian_loc], [8, extraLoc.it_0], [3, extraLoc.it_0r], [8, extraLoc.it_1], [3, extraLoc.it_1r], [8, extraLoc.it_2], [3, extraLoc.it_2r], [8, extraLoc.it_3], [3, extraLoc.it_3r], [8, extraLoc.it_4], [3, extraLoc.it_4r], [0, extraLoc.russian_loc], [8, extraLoc.ru_cozy_inn], [15, extraLoc.ru_zakuro], [16, extraLoc.ru_translator], [15, "TheEpicTea"], [16, extraLoc.ru_proofreader], [15, "Anasu Meruku"], [16, extraLoc.ru_artist_font], [8, "The Th3rd Sergeevich"], [3, extraLoc.ru_voice], [0, extraLoc.demo_1_loc], [8, "EllisBros"], [3, dxd_raw("credits.c_loc_spanish")], [8, "Aizakku"], [3, dxd_raw("credits.c_loc_portuguese")], [8, "PrismaticAngel"], [3, dxd_raw("credits.c_loc_dutch")], [-1], [2, dxd_raw("credits.special_thanks")], [0, dxd_raw("credits.former_members")], [8, "Granpris"], [3, dxd_raw("credits.c_granpris")], [8, "Robin Blend"], [3, dxd_raw("credits.c_robinblend")], [8, "Grassinio"], [3, dxd_raw("credits.c_grassinio")], [8, "Garrett 'Dunky' Bogle"], [3, dxd_raw("credits.c_dunky")], [-1], [8, "Addicted2Electronics"], [3, dxd_raw("credits.c_past_sprites")], [8, "Amella"], [3, dxd_raw("credits.c_past_music")], [8, "Bloody-Uragiri"], [3, dxd_raw("credits.c_past_battlesprites_coverart")], [8, "Comicz"], [3, dxd_raw("credits.c_past_coding")], [8, "Demirramon"], [3, dxd_raw("credits.c_sprites")], [8, "Elfin"], [3, dxd_raw("credits.c_past_sprites")], [8, "FlowweTheFlowr"], [3, dxd_raw("credits.c_past_coding")], [8, "Gotochelle"], [3, dxd_raw("credits.c_characterdesign")], [8, "Jisho"], [3, dxd_raw("credits.c_past_music")], [8, "Jynx"], [3, dxd_raw("credits.c_past_music")], [8, "morgthecyborg"], [3, dxd_raw("credits.c_past_musicassistance")], [8, "nickwuh"], [3, dxd_raw("credits.c_past_music")], [8, "RickyG"], [3, dxd_raw("credits.c_codingassistance")], [8, "Seelocanth"], [3, dxd_raw("credits.c_past_music")], [8, "StarsFirefly"], [3, dxd_raw("credits.c_past_coding")], [8, "Vinpie"], [3, dxd_raw("credits.c_promoart_oldcover")], [-1], [0, dxd_raw("credits.playtesters")], [9, "Aizakku", "Dorked"], [9, "Dr. Magnum", "ExtraOrdiNora"], [9, "FmsDraws", "Granpris"], [1, "It's_Connor"], [1, "Kuouo"], [13, "Paledoptera", dxd_raw("credits.c_demo1")], [1, "PineOJust", "Arribagel"], [1, "PooterStapot", "Mamar11"], [1, "PrismaticAngel", "Mr G"], [1, "Shaw.Dizzle", "Robin Blend"], [1, "Farfrom Tile", "TheEpicTea"], [-1], [0, dxd_raw("credits.c_contest_winners")], [8, "Chip Potato"], [3, dxd_raw("credits.c_contest_bowler")], [8, "Doctor Porkchop"], [3, dxd_raw("credits.c_contest_moldemort")], [8, "Dizzy"], [3, dxd_raw("credits.c_contest_scatter")], [8, "PooterStapot"], [3, dxd_raw("credits.c_contest_mordax_cholula")], [0, dxd_raw("credits.other_contributors")], [8, "441 / Fours"], [3, dxd_raw("credits.c_envart_battlebg")], [8, "Audiospawn"], [3, dxd_raw("credits.c_voiceacting_trailer")], [8, "babyjeans (rousr)"], [3, dxd_raw("credits.c_dissonance")], [8, "CHAOS_FANTAZY"], [3, dxd_raw("credits.c_writinginspiration")], [8, "Cheryl Stelli"], [3, dxd_raw("credits.c_savemenu")], [8, "Dorked"], [3, dxd_raw("credits.c_dorked")], [8, "egg boy"], [3, dxd_raw("credits.c_ranting")], [8, "Gala the Squeaky Bird"], [3, dxd_raw("credits.c_gala")], [8, "Gaz"], [3, dxd_raw("credits.c_sansassistance")], [8, "GreatestFrog"], [3, dxd_raw("credits.c_leveldesign")], [8, "JJCooley"], [3, dxd_raw("credits.c_macfix")], [8, "Lead-namari"], [3, dxd_raw("credits.c_papinspiration")], [8, "MadCreativity"], [3, dxd_raw("credits.c_diannex")], [8, "MettaToreodere"], [3, dxd_raw("credits.c_environmentart")], [8, "Omega"], [3, dxd_raw("credits.c_spepmenu")], [8, "Reth-Vill15"], [3, dxd_raw("credits.c_wiki")], [8, "VyletBunni"], [3, dxd_raw("credits.c_gameplayinspiration")], [8, "Shad / PeriBooty"], [3, dxd_raw("credits.c_diannex")], [8, "Shayy"], [3, dxd_raw("credits.c_punchcard")], [8, "TheEpicTea"], [3, dxd_raw("credits.c_russian")], [8, "Zaid"], [3, dxd_raw("credits.c_readingcomments")], [useTrans1 ? 8 : -2, trans1], [useTrans2 ? 3 : -2, trans2], [-1], [4, dxd_raw("credits.c_fellowteams")], [-1], [4, dxd_raw("credits.end")], [-1], [0, dxd_raw("credits.inmemoryof")], [8, "Offtopic"], [3, dxd_raw("credits.c_offtopic")], [-1], [-1], [11, "UNDERTALE / DELTARUNE\n    by Toby Fox, Temmie Chang & Co."], [12, dxd_raw("credits.c_teamundertale")], [10, dxd_raw("credits.c_underswap")], [-1], [7]];

if (global.credits_from_menu)
    sfx_play(snd_menuhit);

enterBg = true;
showBg = false;
bgFrame = 0;
bgArea = global.credits_from_menu ? 1 : 2;

if (bgArea == 2)
{
    bgLayer[0] = bkg_star_parallax;
    bgLayer[1] = bkg_star_parallax;
    bgLayer[2] = bkg_star_parallax;
    bgLayer[3] = bkg_star_parallax;
    bgColor = 3674632;
    bgCutoff = true;
    bgFrameCount = 4;
    bgFrameSpeed = 0.05;
    bgLayerSpeed[0] = -0.0625;
    bgLayerX[0] = 0;
    bgLayerYDone[0] = -76;
    bgLayerY[0] = -52;
    bgLayerAlpha[0] = 0;
    bgLayerAlphaDone[0] = 1;
    bgLayerAlphaSpeed[0] = 0.075;
    bgLayerEnterSpeed[0] = 0.125;
    bgLayerSpeed[1] = -0.0625;
    bgLayerX[1] = 160;
    bgLayerYDone[1] = 4;
    bgLayerY[1] = 28;
    bgLayerAlpha[1] = 0;
    bgLayerAlphaDone[1] = 1;
    bgLayerAlphaSpeed[1] = 0.075;
    bgLayerEnterSpeed[1] = 0.125;
    bgLayerSpeed[2] = -0.0625;
    bgLayerX[2] = 80;
    bgLayerYDone[2] = 84;
    bgLayerY[2] = 108;
    bgLayerAlpha[2] = 0;
    bgLayerAlphaDone[2] = 1;
    bgLayerAlphaSpeed[2] = 0.075;
    bgLayerEnterSpeed[2] = 0.125;
    bgLayerSpeed[3] = -0.0625;
    bgLayerX[3] = 0;
    bgLayerYDone[3] = 164;
    bgLayerY[3] = 188;
    bgLayerAlpha[3] = 0;
    bgLayerAlphaDone[3] = 1;
    bgLayerAlphaSpeed[3] = 0.075;
    bgLayerEnterSpeed[3] = 0.125;
}
else
{
    bgLayer[0] = spr_parallax_rh0;
    bgLayer[1] = spr_parallax_rh1;
    bgLayer[2] = spr_parallax_rh2;
    bgColor = 0;
    bgCutoff = false;
    bgFrameCount = 0;
    bgFrameSpeed = 0;
    bgLayerSpeed[0] = -0.0625;
    bgLayerX[0] = 0;
    bgLayerYDone[0] = 0;
    bgLayerY[0] = 24;
    bgLayerAlpha[0] = 0;
    bgLayerAlphaDone[0] = 1;
    bgLayerAlphaSpeed[0] = 0.05;
    bgLayerEnterSpeed[0] = 0.1;
    bgLayerSpeed[1] = -0.125;
    bgLayerX[1] = 0;
    bgLayerYDone[1] = 0;
    bgLayerY[1] = 32;
    bgLayerAlpha[1] = 0;
    bgLayerAlphaDone[1] = 1;
    bgLayerAlphaSpeed[1] = 0.0625;
    bgLayerEnterSpeed[1] = 0.125;
    bgLayerSpeed[2] = -0.25;
    bgLayerX[2] = 0;
    bgLayerYDone[2] = 0;
    bgLayerY[2] = 40;
    bgLayerAlpha[2] = 0;
    bgLayerAlphaDone[2] = 1;
    bgLayerAlphaSpeed[2] = 0.075;
    bgLayerEnterSpeed[2] = 0.15;
}

for (var i = 0; i < array_length(bgLayer); i++)
{
    var b = bgLayer[i];
    
    if (b != -1)
    {
        var temp = sprite_get_width(b);
        bgLayerWidth[i] = temp;
        bgLayerX2[i] = bgLayerX[i] + (temp * 2);
    }
}

alarm[0] = global.credits_from_menu ? 120 : 30;
moveTitle = 0;
creditsY = 0;
drawCreditsText = false;
lastOffsetY = 0;
startYOffset = 480;
currY = startYOffset;
len = array_length(content);
positions = array_create(len);

for (var i = 0; i < len; i++)
{
    positions[i] = currY;
    
    switch (content[i][0])
    {
        case -1:
        case 1:
        case 3:
        case 8:
        case 9:
        case 13:
        case 14:
        case 15:
            currY += 32;
            break;
        
        case 16:
            currY += 24;
            break;
        
        case 0:
            currY += 48;
            break;
        
        case 2:
            currY += 54;
            break;
        
        case 4:
            currY += 164;
            break;
        
        case 5:
            currY += 92;
            break;
        
        case 6:
            currY += 64;
            break;
        
        case 10:
            currY += 136;
            break;
        
        case 11:
            currY += 80;
            break;
        
        case 12:
            currY += 48;
            break;
    }
}

moveSpeed = currY / 4170;
fader = false;
specialAlpha = 1;

function calcSize()
{
    if (global.windowtype == 3)
    {
        ww = display_get_width();
        wh = display_get_height();
    }
    else
    {
        ww = window_get_width();
        wh = window_get_height();
    }
    
    var aspect = ww / wh;
    shouldFullView = global.border != 0 && (aspect >= 0.75 && aspect <= 4);
}

function drawEverything(argument0)
{
    var overlayAlpha = 0;
    var baseA;
    
    if (instance_exists(obj_fader))
    {
        if (global.credits_from_menu)
        {
            baseA = 1 - obj_fader.alpha;
            draw_set_alpha(baseA);
        }
        else
        {
            baseA = 1;
            overlayAlpha = obj_fader.alpha;
        }
    }
    else
    {
        baseA = 1;
    }
    
    baseA *= specialAlpha;
    var offsetY, offsetX;
    
    if (argument0)
    {
        with (obj_gamemanager)
        {
            offsetX = -screenXOffset / borderXScale;
            offsetY = screenYOffset / borderYScale;
        }
    }
    else
    {
        offsetX = 0;
        offsetY = 0;
        ww = 640;
        wh = 480;
    }
    
    lastOffsetY = offsetY;
    
    if (showBg && !ruthMode && global.credits_from_menu)
    {
        for (var i = 0; i < array_length(bgLayer); i++)
        {
            var b = bgLayer[i];
            
            if (b != -1)
            {
                var _x = bgLayerX[i];
                var _x2 = bgLayerX2[i];
                var _y = bgLayerY[i];
                var a = bgLayerAlpha[i];
                
                if (i == 0)
                {
                    draw_rectangle_pix(offsetX, 0, ww, wh, merge_color(c_black, bgColor, a), 1);
                    
                    if (bgArea == 2)
                    {
                        draw_rectangle_pix(offsetX, 0, ww, 240, 0, 1);
                        draw_rectangle_pix(offsetX, 0, ww, 40, 0, 1);
                    }
                }
                
                var w = sprite_get_width(b);
                var h = sprite_get_height(b);
                
                if (bgCutoff && i < 2 && bgLayer[i + 1] != -1)
                {
                    var top = bgLayerY[i + 1];
                    
                    if ((_y + (h * 2)) >= top)
                        h = floor(top - _y) * 0.5;
                }
                
                if (bgArea == 2)
                    gpu_set_blendenable(false);
                
                draw_sprite_part_ext(b, bgFrame, 0, 0, w, h, _x + offsetX, _y + offsetY, 2, 2, c_white, a * baseA);
                draw_sprite_part_ext(b, bgFrame, 0, 0, w, h, _x2 + offsetX, _y + offsetY, 2, 2, c_white, a * baseA);
                
                if (bgArea == 2)
                {
                    gpu_set_blendenable(true);
                    
                    if (i == 3)
                        draw_rectangle_pix(offsetX, -offsetY, ww, wh, 0, 1 - (a * baseA));
                }
            }
        }
    }
    
    draw_rectangle_pix(offsetX, -offsetY, ww, wh, 0, 0.3 * baseA);
    draw_sprite_ext(spr_fadebg, 0, offsetX, offsetY, 321 * (2 + (offsetX / -160)), 2, 0, c_white, baseA);
    draw_rectangle_pix(34, -offsetY, 572, wh, 0, 0.5 * baseA);
    
    if (creditsY > (-startYOffset - 100 - offsetY))
    {
        if (global.credits_from_menu)
            draw_sprite_ext(spr_titlecard, 0, 0, min(0, creditsY + 100), 4, 4, 0, c_white, baseA);
        else
            draw_sprite_ext(spr_titlecard, 0, 0, min(-80, creditsY + 100), 4, 4, 0, c_white, 1);
    }
    
    draw_set_halign(fa_left);
    
    if (drawCreditsText)
    {
        for (var i = 0; i < len; i++)
        {
            var pos = positions[i];
            var data = content[i];
            var visualPos = pos + creditsY;
            
            if (visualPos < (480 + offsetY) && (data[0] == 7 || visualPos > (-240 - offsetY)))
            {
                switch (data[0])
                {
                    case 0:
                        set_font(fnt_main);
                        draw_set_color(c_black);
                        draw_text_mono(62, visualPos + 2, data[1]);
                        draw_set_color(c_yellow);
                        draw_text_mono(60, visualPos, data[1]);
                        break;
                    
                    case 2:
                        set_font(fnt_main);
                        draw_set_color(c_black);
                        draw_text_mono_centered(322, visualPos + 2, data[1]);
                        draw_set_color(c_yellow);
                        draw_text_mono_centered(320, visualPos, data[1]);
                        break;
                    
                    case 3:
                    case 12:
                        set_font(fnt_mainsm);
                        draw_set_color(c_black);
                        draw_text(91, visualPos + 1, data[1]);
                        draw_set_color(c_ltgray);
                        draw_text(90, visualPos, data[1]);
                        break;
                    
                    case 16:
                        set_font(fnt_mainsm);
                        draw_set_color(c_black);
                        draw_text(127, visualPos + 1, data[1]);
                        draw_set_color(c_ltgray);
                        draw_text(126, visualPos, data[1]);
                        break;
                    
                    case 1:
                    case 8:
                    case 4:
                    case 10:
                    case 11:
                        set_font(fnt_main);
                        draw_set_color(c_black);
                        draw_text(72, visualPos + 2, data[1]);
                        draw_set_color(c_white);
                        draw_text(70, visualPos, data[1]);
                        
                        if (array_length(data) == 3)
                        {
                            draw_set_halign(fa_right);
                            draw_set_color(c_black);
                            draw_text(572, visualPos + 2, data[2]);
                            draw_set_color(c_white);
                            draw_text(570, visualPos, data[2]);
                            draw_set_halign(fa_left);
                        }
                        
                        break;
                    
                    case 15:
                        set_font(fnt_main);
                        draw_set_color(c_black);
                        draw_text(108, visualPos + 2, data[1]);
                        draw_set_color(c_white);
                        draw_text(106, visualPos, data[1]);
                        break;
                    
                    case 13:
                        set_font(fnt_main);
                        draw_set_color(c_black);
                        draw_text(72, visualPos + 2, data[1]);
                        draw_set_color(c_white);
                        draw_text(70, visualPos, data[1]);
                        draw_set_halign(fa_right);
                        draw_set_color(c_black);
                        draw_text(572, visualPos + 2, data[2]);
                        draw_set_color(c_yellow);
                        draw_text(570, visualPos, data[2]);
                        draw_set_halign(fa_left);
                        break;
                    
                    case 9:
                        set_font(fnt_main);
                        draw_set_color(c_black);
                        draw_text(72, visualPos + 2, data[1]);
                        draw_text(322, visualPos + 2, data[2]);
                        draw_set_color(c_white);
                        draw_text(70, visualPos, data[1]);
                        draw_text(320, visualPos, data[2]);
                        break;
                    
                    case 14:
                        set_font(fnt_main);
                        draw_set_color(c_black);
                        draw_text(72, visualPos + 2, data[1]);
                        draw_text(322, visualPos + 2, data[2]);
                        draw_set_color(c_white);
                        draw_text(70, visualPos, data[1]);
                        draw_set_color(c_yellow);
                        draw_text(320, visualPos, data[2]);
                        break;
                    
                    case 7:
                        visualPos = max(180, visualPos);
                        draw_sprite_ext(spr_tslogo, 0, 288, visualPos, 2, 2, 0, c_white, baseA);
                        set_font(fnt_main);
                        draw_set_halign(fa_center);
                        draw_set_color(c_black);
                        draw_text(322, visualPos + 72 + 2, "TEAM SWITCHED\n2016-2025");
                        draw_set_color(c_white);
                        draw_text(320, visualPos + 72, "TEAM SWITCHED\n2016-2025");
                        draw_set_halign(fa_left);
                        break;
                }
            }
        }
    }
    
    draw_set_alpha(1);
    
    if (overlayAlpha > 0)
        draw_rectangle_pix(offsetX, -offsetY, ww, wh, 0, overlayAlpha);
    
    if (!global.credits_from_menu)
    {
        if (global.border == 0)
        {
            gpu_set_blendmode_ext(bm_zero, bm_src_alpha);
            draw_rectangle_pix(-160, -160, 160, 860, 0, 0);
            draw_rectangle_pix(640, -160, 160, 860, 0, 0);
            draw_rectangle_pix(0, -320, 640, 320, 0, 0);
            draw_rectangle_pix(0, 480, 640, 320, 0, 0);
            gpu_set_blendmode(bm_normal);
        }
        else
        {
            gpu_set_blendmode_ext(bm_zero, bm_src_alpha);
            draw_rectangle_pix(0, -350, 640, 290, 0, 0);
            draw_rectangle_pix(0, 540, 640, 320, 0, 0);
            gpu_set_blendmode(bm_normal);
        }
    }
}

os_powersave_enable(false);
ruthMode = !global.credits_from_menu && ruth_enabled() && global.journal_health[0] == (2 << 0);
