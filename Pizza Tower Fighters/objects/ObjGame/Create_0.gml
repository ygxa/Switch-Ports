Player1live = global.stocks;
Player2live = global.stocks;
starting = true;
starting_text_timer = 60;
start_text = s_ready;
startsprite = 0;
startspritetime = 7;
alphastart = 0;

if (global.remix)
    music = mu_pizzascapeOLD;
else
    music = mu_pizzascapeOLD;

if (room == R_DontMakeASound)
    music = mu_dmas;

if (room == R_FunFarm)
    music = mu_funfarm;

if (room == R_GnomeForest)
    music = mu_gnomeforest;

if (room == R_SecretRoom)
    music = mu_secretstage;

if (room == R_GrinchRace)
    music = mu_grinchrace;

if (room == R_Top)
    music = mu_top;

if (room == R_Training)
{
    music = mu_training;
    Player1live = 9999;
    starting = false;
}

if (room == R_Credits)
{
    music = mu_credits;
    Player1live = 9999;
    starting = false;
}

if (room == R_Tutorial)
{
    music = mu_tutorial;
    Player1live = 9999;
    starting = false;
}

instance_create_layer(x, y, layer, O_Pause);

if (starting == true)
    audio_play_sound(su_an_ready, 50, false);

audio_play_sound(music, 100, true);
depth = -1000;

if (global.timeron == true && room != R_Credits && room != R_Tutorial && room != R_Training)
    instance_create_layer(x, y, layer, O_Timer);

timerscore = 250;
timerscore_t = 200;
