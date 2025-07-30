hsp = irandom_range(-5, 5);
vsp = -4;
grv = 0.3;
fart = "player1";
audio_play_sound(su_dead, 50, false);
audio_stop_sound(su_vigi_smg);
audio_play_sound(su_vigi_death, 50, false);
event_inherited();
