image_alpha += 0.05;

if (!fadeOut && image_alpha < 1)
    alarm[0] = 2;
else
    scene_resume();
