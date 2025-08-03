event_inherited();
damageAmount = 3;

if (room == rm_star22_chase1)
{
    sprite_index = choose(spr_md_house_throw1, spr_md_house_throw2, spr_md_house_throw3);
    vspeed = random_range(6, 7);
}
else
{
    sprite_index = choose(spr_md_house_throw1, spr_md_house_throw4);
    hspeed = random_range(6, 7);
    
    if (x > 160)
        hspeed *= -1;
    
    vspeed = -4;
    gravity = 0.1;
    gravity_direction = 270;
}

angler = random_range(10, 20);
depth = -6050;
sfx_play(snd_throw);
