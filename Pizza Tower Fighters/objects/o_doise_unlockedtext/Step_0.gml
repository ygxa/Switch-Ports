time += hoverSpeed;
var sine_value = sin(time);
y = (original_y - (hoverHeight / 2)) + ((hoverHeight / 2) * sine_value);

if (!audio_is_playing(mu_doiseunlocked))
    fadeToRoom(R_SinglePlayerMenu, 50, 0);
