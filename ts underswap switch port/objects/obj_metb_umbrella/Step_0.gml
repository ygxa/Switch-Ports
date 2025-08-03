if (vspeed > 2 && y >= obj_battlemanager.boxY1)
{
    umbrellaOpen = 0;
    vspeed -= 0.1;
    singing = actuallySing;
    sprite_index = spr_metb_happy;
}

if (singing)
{
    if (noteCooldown == 0)
    {
        with (bt_bullet_attack(obj_metb_notesmall, damageAmount, x, y))
        {
            direction = point_direction(x, y, obj_battleheart.x, obj_battleheart.y);
            speed = 4;
        }
        
        noteCooldown = (hspeed != 0) ? 60 : 46;
        sfx_play(asset_get_index("snd_note" + _string(noteIndex)), 80, false);
        noteIndex++;
    }
    
    noteCooldown--;
}

if (y > obj_battlemanager.boxY2)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}
