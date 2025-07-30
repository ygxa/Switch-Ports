with (obj_tv)
{
    message = "YOU HAVE FOUND A SECRET!";
    showtext = 1;
    alarm[0] = 150;
}

scr_sound(91);
global.secretfound++;
instance_destroy();
