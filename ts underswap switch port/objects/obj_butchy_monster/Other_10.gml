if (global.bev_subtype == 0)
{
    global.journal_kills[10]++;
    global.areapopulations[global.currentarea]--;
    
    if (vpunk >= 1)
        dustFilename = "rh_b2";
}
else if (global.bev_subtype == 2)
{
    shakeValue = shakeAmount;
    alarm[10] = 1;
    alarm[2] = 10;
}
else if (global.bev_subtype == 1)
{
    journal_spare_counter(10);
    spared = true;
    sfx_play(snd_fade);
    
    if (global.flavor_sprites)
        image_blend = merge_color(c_black, flavorColor, 0.5);
    else
        image_blend = c_gray;
    
    var a = x - 8;
    var b = y + 16;
    
    repeat (14)
        instance_create_xy(irandom(120) + a, irandom(55) + b, obj_dustcloud);
    
    exit;
}

event_inherited();
