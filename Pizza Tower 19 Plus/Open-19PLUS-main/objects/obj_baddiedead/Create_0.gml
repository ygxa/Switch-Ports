vsp = random_range(-10, -20);
hsp = sign(x - obj_player.x) * random_range(10, 15);
grav = 0.4;
alarm[0] = 5;

if (x != obj_player.x)
    image_xscale = -sign(x - obj_player.x);

depth = -1;
palettespr = palette_forknight;
pal = 0;
