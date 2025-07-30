if (player == -4 || pillar == -4 || !instance_exists(pillar))
    exit;

mail_trigger(10);
event_play_oneshot("event:/SFX/bo/punch", player.x, player.y);
punched = true;

with (player)
{
    if (state == 109 || state == 273)
        exit;
    
    alarm[8] = 100;
    alarm[7] = 150;
    hurted = 1;
    event_play_oneshot("event:/SFX/bo/hurt", x, y);
    xscale = -sign(other.pillar.image_xscale);
    sprite_index = spr_hurtjump;
    hsp = -3 * xscale;
    movespeed = 3;
    vsp = -10;
    timeuntilhpback = 300;
    instance_create(x, y, obj_spikehurteffect);
    
    if (state == 271 || state == 270 || state == 272)
        state = 273;
    else
        state = 109;
    
    image_index = 0;
    flash = 1;
}
