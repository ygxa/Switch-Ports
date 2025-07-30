draw_self();

if (selected)
    draw_sprite(stageplaceholderselect, 0, x, y);

if (pointed)
    draw_sprite_ext(stageplaceholderselect, 0, x, y, 1, 1, 0, c_white, wave(0, 0.5, 2, 0));
